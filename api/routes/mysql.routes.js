// routes/mysql.routes.js
const express = require('express');
const router = express.Router();
const mysqlController = require('../controllers/mysql.controller');

router.get('/all-data', mysqlController.getAllData);

module.exports = router;