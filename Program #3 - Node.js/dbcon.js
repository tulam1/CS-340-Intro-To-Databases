var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_lamtu',
  password        : '9137',
  database        : 'cs340_lamtu'
});

module.exports.pool = pool;
