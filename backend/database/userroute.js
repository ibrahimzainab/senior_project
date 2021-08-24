const express = require('express')
const router = express.Router()

const actions = require("../controllers/user-controller")

router.get('/', (req, res) => {
	res.send('hello world');
});

router.post('/register', actions.register)
router.post('/login', actions.login)

module.exports = router;