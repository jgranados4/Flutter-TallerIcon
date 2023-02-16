const express = require('express');

const employeesController = require('../controllers/employeesController');

const router = express.Router();

//Rutas de empleados
router.get('/', employeesController.list);
router.get('/get_employee/:id', employeesController.get);
router.post('/add_employee', employeesController.save);
router.put('/update_employee/:id', employeesController.update);
router.delete('/delete_employee/:emp_id', employeesController.delete);

module.exports = router;
