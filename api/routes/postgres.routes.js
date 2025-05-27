const express = require('express');
const router = express.Router();
const postgresController = require('../controllers/postgres.controller');

router.get('/all-data', postgresController.getAllData);

module.exports = router;