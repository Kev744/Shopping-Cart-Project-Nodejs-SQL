const jwt = require('jsonwebtoken');
const bcrypt = require("bcrypt");
const db = require("../models/db");

module.exports = (router) => {
    router.post('/signup', (req, res) => {
        bcrypt.hash(req.body.password,10).then(hash => { const user = db.query("INSERT INTO users (email, password, nom, prenom, admin) VALUES (?)", [[req.body.email, hash, req.body.nom, req.body.prenom, req.body.admin]], function (err,result) { if (err) throw err;
            console.log(result);
            res.status(201).json({message: 'Nous sommes heureux de vous accueillir'})
        })})
            .catch(error => res.status(500).json({error}));})

router.post('/login', (req, res) => {
    function runQuery(sqlQuery, args){
        return new Promise(function (resolve, reject) {
            db.query(sqlQuery, args, function(error, results) {
                if (error) reject(error);
                else resolve(results);
            });
        });
    }

    runQuery("SELECT * from users where email = ? ", [req.body.email]).then(user => {
        if (user.length === 0) {
            return res.status(401).json({ error: 'Utilisateur non trouvé !',
                success : 0});
        }
        bcrypt.compare(req.body.password, user[0].password)
            .then(valid => {
                if (!valid) {
                    return res.status(401).json({ error: 'Mot de passe incorrect !',
                        success : 0});
                }


                const userId = user[0].id_user;
                const token = jwt.sign({ userId: user[0].id_user,
                                                admin: user[0].admin},
                    'RANDOM_TOKEN_SECRET',
                    { expiresIn: '24h' });
                res.header("Authorization","Bearer " + token)
                res.cookie("token", token, {httpOnly: true})

                return res.status(200).json({success : 1})
            })

            .catch(error => res.status(500).json({ error }));

    })
        .catch(error => res.status(500).json({ error }));
});
router.get('/logout', (req, res) => {
        res.clearCookie('token');
        return res.redirect('/');
});
}

