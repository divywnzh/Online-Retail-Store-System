const express = require('express');
const res = require('express/lib/response');
const mysql = require('mysql');
const cors=require('cors');

let temp=[];
// Create conection

const con = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'administrator',
    database: 'sys'
  });
// Connect
con.connect(()=>{
    console.log('Mysql Connected....');
});
const app = express()

con.query('SELECT * FROM Product;', (e,rows) => {
    console.log('Data received from Db:');
    console.log(rows);
    temp.push(rows);
  });

app.listen('3002',()=>{
    console.log('Server started on port 3001');
});

// app.get('/gets',cors(),(req,res)=>{
//     res.send(temp);
//     console.log("on posts");
// });
// app.use(cors());

app.post("/create" , cors(), (req, res) =>{
  console.log("adding to cart in express");
  const gotPId = req.body.product_id;
  console.log("Received pId in express: " + gotPId);
})
app.use(cors());

const myTimeout = setTimeout(myGreeting, 1000);

function myStopFunction() {
  clearTimeout(myTimeout);
}

function myGreeting(){
console.log("From temp",temp);
}