const mysql = require('mysql2');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'uma_tarjetas',
    password: '',
});

module.exports = pool.promise();
