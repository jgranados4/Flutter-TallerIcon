const mysqlConnection = require("../utils/database");
const controller = {};

// GET all Employees
controller.list = (req, res) => {
  console.log("Listado");
  //return;
  mysqlConnection.query("SELECT * FROM mytable", (err, rows, fields) => {
    if (!err) {
      res.json({
        status_code: 202,
        message: "Listado",
        employees: rows,
        //authData
      });
      console.log(rows);
    } else {
      res.json({
        code: 500,
        error: true,
        message: err,
      });
    }
  });
};
// GET An Employee
controller.get = (req, res) => {
  const { id } = req.params;

  mysqlConnection.query(
    "SELECT * FROM mytable WHERE id = ?",
    [id],
    (err, rows, fields) => {
      if (!err) {
        res.json(rows[0]);
      } else {
        console.log(err);
        res.json({
          code: 500,
          error: true,
          message: err,
        });
      }
    }
  );
};
// INSERT
controller.save = (req, res) => {
  const { name, edad, email, Genero, status } = req.body;
  //console.log(req);
  console.log(name, edad, email, Genero, status);

  const query = `INSERT INTO mytable(name, email,Genero,status) VALUES(?,?,?,?)`;
  mysqlConnection.query(
    query,
    [name, email, Genero, status],
    (err, rows, fields) => {
      if (!err) {
        res.json({
          error: false,
          message: "Saved",
        });
      } else {
        res.json({
          error: true,
          message: err,
        });
        console.log(err);
      }
    }
  );
};
// UPDATE
controller.update = (req, res) => {
  const { name, email,Genero,status } = req.body;
  const { id } = req.params;
  //console.log(id, name, edad, email);
  //const query = `SET @id = ?; SET @name = ?; SET @email = ?; SET @edad = ?; CALL employeeAddOrEdit(@id, @name, @email,@edad);`;
  const query = `UPDATE mytable SET name=?, email=?,Genero=?,status=? WHERE id=?;`;
  mysqlConnection.query(query, [name, email, Genero,status, id], (err, rows, fields) => {
    if (!err) {
      res.json({
        code: 200,
        error: false,
        message: " Updated",
      });
    } else {
      console.log(err);
      res.json({
        code: 500,
        error: true,
        message: err,
      });
    }
  });
};
// DELETE
controller.delete = (req, res) => {
  const { emp_id } = req.params;
  mysqlConnection.query(
    "DELETE FROM mytable WHERE id = ?",
    [emp_id],
    (err, rows, fields) => {
      if (!err) {
        res.json({
          code: 200,
          error: false,
          message: " Deleted",
        });
      } else {
        console.log(err);
        res.json({
          code: 500,
          error: true,
          message: err,
        });
      }
    }
  );
};
module.exports = controller;
