module.exports = function() {
  var express = require('express');
  var router = express.Router();
  
  /* Get all the projects */
  function getProjects(res, mysql, context, complete) {
      mysql.pool.query('SELECT Pnumber, Pname FROM PROJECT', function(error, results, fields) {
          if(error) {
              res.write(JSON.stringify(error));
              res.end();
          }
          
          context.projects = results;
          complete();
      
      });
  }
  
  /* Get all the employees */
  function getEmployees(res, mysql, context, complete) {
      mysql.pool.query('SELECT Ssn, Fname, Lname, Salary, Dno FROM EMPLOYEE', function(error, results, fields) {
          if(error) {
              res.write(JSON.stringify(error));
              res.end();
          }
          
          context.employee = results;
          complete();
      
      });
  }
  
  /* Get Employees for a Specific Project */
  function getEmployeebyProject(req, res, mysql, context, complete) {
      var query = "SELECT Ssn, Fname, Lname, Salary, Dno, WO.Pno FROM EMPLOYEE E, WORKS_ON WO WHERE WO.Essn = E.Ssn AND Pno = ?";
      console.log(req.params)
      var inserts = [req.params.project]
      
      mysql.pool.query(query, inserts, function(error, results, fields) {
          if(error) {
              res.write(JSON.stringify(error));
              res.end();
          }
          
          context.employee = results;
          context.PNO = results[0].Pno;
          complete();
      
      });
  }
  
  /* Get Project's Name and Location from Pno */
  function getProjectInfo(req, res, mysql, context, complete) {
      var query2 = "SELECT Pname, Pnumber, Plocation FROM PROJECT WHERE Pnumber = ?";
      console.log(req.params)
      var inserts2 = [req.params.project]
      
      mysql.pool.query(query2, inserts2, function(error, results, fields) {
          if(error) {
              res.write(JSON.stringify(error));
              res.end();
          }
          
          context.Projectname = results[0].Pname;
          context.Projectlocation = results[0].Plocation;
          complete();
      
      });
  }
  
  /* Find employee whose Name starts with given str */
  function getEmployeeWithNameLike(req, res, mysql, context, complete) {
      var query = "SELECT Ssn, Fname, Lname, Salary, Dno FROM EMPLOYEE WHERE Fname LIKE " + mysql.pool.escape(req.params.s + '%');
      console.log(query)
      
      mysql.pool.query(query, function(error, results, fields) {
          if(error) {
              res.write(JSON.stringify(error));
              res.end();
          }
          
          context.employee = results;
          complete();
      
      });
  }
  
  /* Display all employees */
  router.get('/', function(req, res) {
      var callbackCount = 0;
      var context = {};
      context.jsscripts = ["filterEmployee.js","searchEmployee.js"];
      var mysql = req.app.get('mysql');
      
      getEmployees(res, mysql, context, complete);
      getProjects(res, mysql, context, complete);
      
      function complete() {
          callbackCount++;
          if (callbackCount >= 2) {
              res.render('employee', context);
          }
      }
  });
  
  /* Display all employees from a given Project */
  router.get('/filter/:project', function(req, res) {
      var callbackCount = 0;
      var context = {};
      context.jsscripts = ["filterEmployee.js","searchEmployee.js"];
      var mysql = req.app.get('mysql');
      
      getEmployeebyProject(req, res, mysql, context, complete);
      getProjectInfo(req, res, mysql, context, complete);
      getProjects(res, mysql, context, complete);
      
      function complete() {
          callbackCount++;
          if (callbackCount >= 3) {
              res.render('employee', context);
          }
      }
  });
  
  /* Display all employees from the str */
  router.get('/search/:s', function(req, res) {
      var callbackCount = 0;
      var context = {};
      context.jsscripts = ["filterEmployee.js","searchEmployee.js"];
      var mysql = req.app.get('mysql');
      
      getEmployeeWithNameLike(req, res, mysql, context, complete);
      getProjects(res, mysql, context, complete);
      
      function complete() {
          callbackCount++;
          if (callbackCount >= 2) {
              res.render('employee', context);
          }
      }
  });
  
  return router;
}();