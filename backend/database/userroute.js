const express = require('express')
const router = express.Router()

const actions = require("../controllers/user-controller")

router.get('/', (req, res) => {
	res.send('hello world');
});

router.post('/register', actions.register)
router.post('/login', actions.login)
router.post('/getPlants', actions.getPlants)
router.post('/getSavedPlants', actions.getSavedPlants)
router.post('/getPlant', actions.getPlant)
router.post('/getArticles', actions.getArticles)
router.post('/getRelatedArticles', actions.getRelatedArticles)
router.post('/getRelatedInsects', actions.getRelatedInsects)
router.post('/getRelatedDiseases', actions.getRelatedDiseases)
router.post('/addToGarden', actions.addToGarden)
router.post('/addNote', actions.addNote)
router.post('/addSchedule', actions.addSchedule)
router.post('/getNotes', actions.getNotes)
router.post('/getAllNotes', actions.getAllNotes)
router.post('/editNote', actions.editNote)

module.exports = router;