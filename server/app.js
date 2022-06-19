const express = require('express')
const session = require('express-session')
const path = require('path')
const cookieParser = require('cookie-parser')
const logger = require('morgan')
const mysql = require('mysql')



const apiRouter = require('./routes/api.js')
const db = require('./models/db.js')

const app = express()




app.use(logger('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(session({ secret: 'grehjznejzkhgjrez', saveUninitialized: false, resave: false }))
app.use(express.static(path.join(__dirname, '../client')))
app.use('/api/', apiRouter)

app.listen(3030)

module.exports = app
