const express = require('express')
const router = express.Router()
const db = require('../models/db.js')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const auth = require('../middleware/auth.js')





/**
 * Dans ce fichier, vous trouverez des exemples de requêtes GET, POST, PUT et DELETE
 * Ces requêtes concernent l'ajout ou la suppression d'articles sur le site
 * Votre objectif est, en apprenant des exemples de ce fichier, de créer l'API pour le panier de l'utilisateur
 *
 * Notre site ne contient pas d'authentification, ce qui n'est pas DU TOUT recommandé.
 * De même, les informations sont réinitialisées à chaque redémarrage du serveur, car nous n'avons pas de système de
 * base de données pour faire persister les données
 */

/**
 * Notre mécanisme de sauvegarde des paniers des utilisateurs sera de simplement leur attribuer un panier grâce à
 * req.session, sans authentification particulière
 */
function parseJwt (token) {
  var base64Url = token.split('.')[1];
  var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
  var jsonPayload = decodeURIComponent(global.atob(base64).split('').map(function(c) {
    return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
  }).join(''));

  return JSON.parse(jsonPayload);
}

function isAdmin(token) {
  if(parseJwt(token).admin === 1) {
    return true;
  }
  return false;
}




router.use((req, res, next) => {
  // l'utilisateur n'est pas reconnu, lui attribuer un panier dans req.session
  auth(router);
  next()
})




/*
 * Cette route doit retourner le panier de l'utilisateur, grâce à req.session
 */

/*
 * Cette route doit ajouter un article au panier, puis retourner le panier modifié à l'utilisateur
 * Le body doit contenir l'id de l'article, ainsi que la quantité voulue
 */



/*
 * Cette route doit permettre de confirmer un panier, en recevant le nom et prénom de l'utilisateur
 * Le panier est ensuite supprimé grâce à req.session.destroy()
 */
router.post('/panier/pay', (req, res) => {
const LastName = req.body.nom;
const firstName = req.body.prenom;

if(req.session.panier !== undefined) {
  req.session.destroy();
  res.status(200).json("Merci " + firstName + " " + LastName + " " + "pour votre achat")
}

})

/*
 * Cette route doit permettre de changer la quantité d'un article dans le panier
 * Le body doit contenir la quantité voulue
 */
router.put('/panier/:articleId', (req, res) => {
  const articleId = parseInt(req.params.articleId)
  const quantite = parseInt(req.body.quantite)

  if(req.session.panier.articles.find(a => a.id === articleId) === undefined) { res.status(404).json({ message: 'Ohnon, cela ne sera pas possible, pas dans le panier' })
    return }

  if(isNaN(quantite) || quantite <= 0) { res.status(404).json( {message : "Pas de quantité nulle ou négative"})
  return; }

    const modArticle = req.session.panier.articles.find(a => a.id === articleId)
    modArticle.quantite = quantite

  res.status(200).json(req.session.panier)
})

/*
 * Cette route doit supprimer un article dans le panier
 */
router.delete('/panier/:articleId', (req, res) => {
  const articleId = parseInt(req.params.articleId)

  const supArticle = req.session.panier.articles.find(a => a.id === articleId)



  if (supArticle === undefined) {res.status(400).json({message: "Cet article n'est pas dans le panier"})
  return;}

  else {req.session.panier.articles.splice(supArticle,1)}

  res.status(200).json(req.session.panier)
})


/**
 * Cette route envoie l'intégralité des articles du site
 */

/**
 * Cette fonction fait en sorte de valider que l'article demandé par l'utilisateur
 * est valide. Elle est appliquée aux routes:
 * - GET /article/:articleId
 * - PUT /article/:articleId
 * - DELETE /article/:articleId
 * Comme ces trois routes ont un comportement similaire, on regroupe leurs fonctionnalités communes dans un middleware
 */
function parseArticle (req, res, next) {


  const name = req.body.name
  const description = req.body.description
  const image = req.body.image
  const price = parseInt(req.body.price)
  const articleId = parseInt(req.params.articleId)
  const quantite = parseInt(req.body.quantite)
  req.articleId = articleId;
  req.name = name;
  req.image = image;
  req.description = description;
  req.price = price;
  req.quantite = quantite;


  var token = req.headers['x-access-token'] || req.headers['authorization']  || req.cookies.token;
  if (!!token && token.startsWith('Bearer ')) {
    token = token.slice(7, token.length);
  }

  if (token) {

    jwt.verify(token, 'RANDOM_TOKEN_SECRET', (err, decoded) => {
      if (err) {
        return res.status(401).json('token_not_valid');
      } else {
        var userId = decoded.userId
        req.decoded = decoded;
        console.log(userId)

        const newToken  = jwt.sign({
              user : decoded.user
            },
            'RANDOM_TOKEN_SECRET',
            {
              expiresIn: '24h'
            });

        res.header('Authorization', 'Bearer ' + newToken);
        res.cookie("token", token, {httpOnly: true})
        next();
      }
    });
  } else {
    return res.status(400).json('token_required');
  }
 }


/**
 * Cette route crée un article.
 * WARNING: dans un vrai site, elle devrait être authentifiée et valider que l'utilisateur est bien autorisé
 * NOTE: lorsqu'on redémarre le serveur, l'article ajouté disparait
 *   Si on voulait persister l'information, on utiliserait une BDD (mysql, etc.)
 */

router.route('/admin')
    .get(parseArticle, (req,res) =>  {
        let token = req.headers['x-access-token'] || req.headers['authorization']  || req.cookies.token;
        let result = isAdmin(token)
        res.status(200).json(result)
    })

router.route('/article')

.get(parseArticle,(req, res) => {
  db.query("SELECT * FROM articles", function (err,result) { if (err) throw err;
    res.status(200).json(result)});
})

.post(parseArticle, (req, res) => {

  // vérification de la validité des données d'entrée
  if (typeof req.name !== 'string' || req.name === '' ||
      typeof req.description !== 'string' || req.description === '' ||
      typeof req.image !== 'string' || req.image === '' ||
      isNaN(req.price) || req.price <= 0 ||
      isNaN(req.quantite) || req.quantite <= 0) {
    res.status(400).json({ message: 'bad request' })
    return
  }




  db.query("INSERT INTO articles (name, description, price, image, quantite) VALUES (?)",
      [[req.name, req.description, req.price, req.image, req.quantite]],
      function (err, result) {
        if (err) throw err;
        console.log(result);


      });

  db.query("SELECT * FROM articles ORDER BY id_article DESC LIMIT 1", function (err,result) { if (err) throw err;
    res.status(200).json(result)});


  // on envoie l'article ajouté à l'utilisateur
});



router.route('/article/:articleId')
  /**
   * Cette route envoie un article particulier
   */
  .get(parseArticle, (req, res) => {
    // req.article existe grâce au middleware parseArticle
    db.query("SELECT *  FROM articles WHERE id_article = (?)", [req.articleId], function (err,result) { if (err) throw err;
      console.log(result);
      res.json(result)
    })

  })

  /**
   * Cette route modifie un article.
   * WARNING: dans un vrai site, elle devrait être authentifiée et valider que l'utilisateur est bien autorisé
   * NOTE: lorsqu'on redémarre le serveur, la modification de l'article disparait
   *   Si on voulait persister l'information, on utiliserait une BDD (mysql, etc.)
   */
  .put(parseArticle, (req, res) => {

    db.query("UPDATE articles SET name = ?, description = ?, price = ?, image = ?, quantite = ? WHERE id_article = ?", [req.name, req.description, req.price, req.image, req.quantite, req.articleId], function (err,result) { if (err) throw err;
      console.log(result);})

    res.json({message: "Propre"})

})

  .delete(parseArticle, (req, res) => {

    db.query("DELETE FROM articles WHERE id_article = (?)", [req.articleId], function (err,result) { if (err) throw err;
      console.log(result);})

  res.json({message: "Propre"})})


router.route('/panier/:articleId')


    .post(parseArticle, (req,res) => {




      db.query("SELECT * FROM articles WHERE id_article = ?",
          [[req.articleId]],
          function (err, result) {
              if (err) throw err;

              let quantity = result[0].quantite - 1;
              if (result[0].quantite < 1) {
              } else {
                  db.query("UPDATE articles SET quantite = ? WHERE id_article = ?", [quantity, req.articleId], function (err, result) {
                      if (err) throw err;
                  })

                  let token = req.headers['x-access-token'] || req.headers['authorization'] || req.cookies.token;

                  db.query("SELECT quantite FROM panier_item WHERE id_article = ? AND id_user = ?", [req.articleId, parseJwt(token).userId], function (err, result) {
                      if (err) throw err;
                      console.log(result[0])
                      if (result[0] === undefined) {
                          db.query("INSERT INTO panier_item(id_article,id_user,quantite) VALUES (?)", [[req.articleId, parseJwt(token).userId, 1]], function (err, result) {
                              if (err) throw err;
                          })
                      } else {
                          db.query("UPDATE panier_item SET quantite = ? WHERE id_article = ? AND id_user = ?", [result[0].quantite + 1, req.articleId, parseJwt(token).userId], function (err, result) {
                              if (err) throw err;
                          })
                      }
                  })
              }


              // on envoie l'article ajouté à l'utilisateur
              res.status(200).json({message: "Good!"})
          }
      )
    }
 )


router.route('/panier')


    .get(parseArticle, (req,res) => {

      let token = req.headers['x-access-token'] || req.headers['authorization']  || req.cookies.token;
      console.log(parseJwt(token))
      db.query("SELECT * FROM articles INNER JOIN panier_item ON articles.id_article = panier_item.id_article WHERE id_user = (?)", [parseJwt(token).userId], function (err,result) {
        if (err) throw err;
        console.log(result);

        res.status(200).json(result)
      })})




module.exports = router
