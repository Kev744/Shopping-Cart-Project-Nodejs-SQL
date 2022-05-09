const mysql = require("mysql")
const dbConfig = require("../config/db.config.js")


const con = mysql.createConnection({

    host: dbConfig.host,

    user: dbConfig.user,

    password: dbConfig.password,

    database: dbConfig.db,

});

con.connect(function (err) {
    if (err) throw err;
    console.log("Connecté à la base de données SQL");
});

module.exports = con;
