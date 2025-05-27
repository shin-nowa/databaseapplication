// routes/home.routes.js
const express = require('express');
const router = express.Router();
const homeController = require('../controllers/home.controller');

router.get('/', homeController.showHome);

module.exports = router;