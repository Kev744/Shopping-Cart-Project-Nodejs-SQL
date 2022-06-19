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
function Authentification (req, res, next) {


  const name = req.body.name
  const description = req.body.description
  const image = req.body.image
  const author = req.body.author
  const articleId = parseInt(req.params.articleId)
  const quantite = parseInt(req.body.quantite)
  const itemId = parseInt(req.params.itemId)
  req.articleId = articleId;
  req.name = name;
  req.image = image;
  req.description = description;
  req.author = author;
  req.quantite = quantite;
  req.itemId = itemId;


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
    .get(Authentification, (req,res) =>  {
        let token = req.headers['x-access-token'] || req.headers['authorization']  || req.cookies.token;
        let result = isAdmin(token)
        res.status(200).json(result)
    })

router.route('/article')

.get(Authentification,(req, res) => {
  db.query("SELECT * FROM articles", function (err,result) { if (err) throw err;
    res.status(200).json(result)});
})

.post(Authentification, (req, res) => {

  // vérification de la validité des données d'entrée
  if (typeof req.name !== 'string' || req.name === '' ||
      typeof req.description !== 'string' || req.description === '' ||
      typeof req.image !== 'string' || req.image === '' ||
      typeof req.author !== 'string' || req.author === '' ||
      isNaN(req.quantite) || req.quantite <= 0) {
    res.status(400).json({ message: 'bad request' })
    return
  }




  db.query("INSERT INTO articles (name, description, author, image, quantite) VALUES (?)",
      [[req.name, req.description, req.author, req.image, req.quantite]],
      function (err, result) {
        if (err) throw err;
      });

  db.query("SELECT * FROM articles ORDER BY id_article DESC LIMIT 1", function (err,result) { if (err) throw err;
    res.status(200).json(result)});

});



router.route('/article/:articleId')
  /**
   * Cette route envoie un article particulier
   */
  .get(Authentification, (req, res) => {
    // req.article existe grâce au middleware parseArticle
    db.query("SELECT *  FROM articles WHERE id_article = (?)", [req.articleId], function (err,result) { if (err) throw err;
      res.json(result)
    })

  })


  .put(Authentification, (req, res) => {

    db.query("UPDATE articles SET name = ?, description = ?, author = ?, image = ?, quantite = ? WHERE id_article = ?", [req.name, req.description, req.author, req.image, req.quantite, req.articleId], function (err,result) { if (err) throw err;
      console.log(result);})

    res.json({message: "Propre"})

})

  .delete(Authentification, (req, res) => {

    db.query("DELETE FROM articles WHERE id_article = (?)", [req.articleId], function (err,result) { if (err) throw err;
      console.log(result);})

  res.json({message: "Propre"})})

let set = [];

function updateData(tab,cart,result){
    let obj = tab.find(o => o.id === result[0].id_article);

    if(obj!== undefined && obj !== null){
        obj.count += 1;
    } else {
        tab.push(cart);
    }}

function stopData(tab,cart,result){
    let obj = tab.find(o => o.id === result[0].id_article);

    if(obj!== undefined && obj !== null){
        obj.count -= 1;
    } else {
        tab.push(cart);
    }}
router.route('/panier/:articleId')


    .post(Authentification, (req,res, next) => {
            let token = req.headers['x-access-token'] || req.headers['authorization'] || req.cookies.token;

            db.query("SELECT * FROM panier WHERE id_user = ?", [parseJwt(token).userId], function (err, cart) {
                if(err) throw err;
                if(cart[0] === undefined) { db.query("INSERT INTO panier(id_user, date_crea) VALUES (?)", [[parseJwt(token).userId, new Date()]], function (err, cart) {
                    if (err) throw err;
                })}



        db.query("SELECT * FROM articles WHERE id_article = ?",
          [[req.articleId]],
          function (err, result) {
              if (err) throw err;
              let cart = {id : result[0].id_article, count : 1};

              let quantity = result[0].quantite;

                  let token = req.headers['x-access-token'] || req.headers['authorization'] || req.cookies.token;

                  db.query("SELECT quantite FROM panier_item WHERE id_article = ? AND id_user = ?", [req.articleId, parseJwt(token).userId], function (err, resultat) {
                      if (err) throw err;
                      if(quantity > 0) {
                          if (resultat[0] === undefined) {
                              updateData(set, cart, result)
                              db.query("INSERT INTO panier_item(id_article,id_user,quantite) VALUES (?)", [[req.articleId, parseJwt(token).userId, 1]], function (err, result) {
                              if (err) throw err;
                          })}
                       else {

                                  updateData(set, cart, result)
                                  if (set.find(a => a.id === req.articleId).count <= quantity) {
                          db.query("UPDATE panier_item SET quantite = ? WHERE id_article = ? AND id_user = ?", [resultat[0].quantite + 1, req.articleId, parseJwt(token).userId], function (err, result) {
                              if (err) throw err;
                          })}}}
                                  else {stopData(set, cart, result)
                                        }
})})
    })})





router.route('/verif')

.get(Authentification, (req,res) => {

        let token = req.headers['x-access-token'] || req.headers['authorization'] || req.cookies.token;
        db.query("SELECT * FROM panier_item WHERE id_user = ?", [parseJwt(token).userId], function (err, results) {
    if(err) throw err;
    for(let i= 0; i < results.length; i++) {
        let articleId = results[i]["id_article"];

        db.query("SELECT * FROM articles WHERE id_article = ?", [articleId], function (err, number) {
            if(err) throw err;
            let Article = set.find(a => a.id === articleId)
                if(  Article !== undefined ) {let popArticle = set.find(a => a.id === articleId).count;
            db.query("UPDATE articles SET quantite = ? WHERE id_article = ?", [number[0].quantite - popArticle , articleId], function (err) {
                set = []


            })}

        })

    }

    }
    )
        db.query("SELECT * FROM articles", function (err,result) { if (err) throw err;

            res.status(200).json(result)});
            })

router.route('/panier/:itemId')


    .delete(Authentification, (req, res) => {
        let token = req.headers['x-access-token'] || req.headers['authorization'] || req.cookies.token;
        db.query("DELETE FROM panier_item  WHERE id_user = ? AND idpanieritem = ?", [parseJwt(token).userId, req.itemId], function (err, results) {
            if(err) throw err;
        })
        res.status(200).json({message: "Propre"})})


router.route('/panier')


    .get(Authentification, (req,res) => {

      let token = req.headers['x-access-token'] || req.headers['authorization']  || req.cookies.token;
      db.query("SELECT * FROM articles INNER JOIN panier_item ON articles.id_article = panier_item.id_article WHERE id_user = (?)", [parseJwt(token).userId], function (err,result) {
        if (err) throw err;

        res.status(200).json(result)
      })})




module.exports = router
