const express = require('express');
const res = require('express/lib/response');
const mysql = require('mysql');
const cors=require('cors');
const bp=require("body-parser");
const app = express()

app.use(bp.json());
app.use(bp.urlencoded({extended:true}));

let temp=[];
// Create conection
let tempCart = []

const con = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'administrator',
    database: 'dbms'
  });
// Connect
con.connect(()=>{
    console.log('Mysql Connected....');
});

con.query('SELECT * FROM Product;', (e,rows) => {
    console.log('Data received from Db:');
    // console.log(rows);
    temp.push(rows);
  });
  let typeUser;
  let username;
  let password;
  let tem;

  
  // con.query('select  sum(P.MRP*C.quantity) from product P inner join cart C on C.product_id=P.product_id where C.customer_id='+username+';', (e,result) => {
  //   console.log('Data received from Db:');
  //   console.log(result);
  //   // tempCart.push(rows);
  // });
let isPwordOk = false;
// login fn

app.post("/login" , (req, res) =>{
  async function xx(s)
  {
    tem=await s;
    console.log("works");
    // console.log(tem); 
    if(password === tem[0]["Password"])
        {
          console.log("username matches password");
          isPwordOk=true;
        }
        else{
          // app.get('/gets',cors(),(req,res)=>{
          //   res.send("Wrong Username or Password.");
          console.log("no match");
        }
  }
  

  console.log("adding to cart in express");
  typeUser = req.body.typeUser;
  username = req.body.username;
  password = req.body.password;
  console.log("Username is ", username);
  console.log("password is ", password);
  console.log("typeUser is ", typeUser);

  

  if(typeUser==="0"){
    var sq = 'SELECT Password FROM Customer where customer_id="'+username+'" ;';  

        con.query(sq, (err, result) => {  
          xx(result);
            }
        );
    }
    else if(typeUser==="1"){
      var sq = 'SELECT Password FROM Admin where admin_id="'+username+'" ;';  
  
          con.query(sq, (err, result) => {  
            xx(result);
              }
          );
      }
      else if(typeUser==="2"){
        var sq = 'SELECT Password FROM Supplier where supplier_id="'+username+'" ;';  
    
            con.query(sq, (err, result) => {  
              xx(result);
                }
            );
        }
    else
    {
      console.log("Wrong Choice");
    }
    // else if(typeUser=="1"){
    //   if(password == con.query('SELECT password FROM Admin WHERE username=username;', (e,rows)=>{hassubmitted:true}
    //   ));
    //   else{
    //     app.get('/gets',cors(),(req,res)=>{
    //       res.send("Wrong Username or Password.");
    //   });
    //   }
    // }
    // else {
    //   if(password == con.query('SELECT password FROM Supplier WHERE username=username;', (e,rows)=>{hassubmitted:true}
    //   ));
    //   else{
    //     app.get('/gets',cors(),(req,res)=>{
    //       res.send("Wrong Username or Password.");
    //   });
    //   }
    // }
    
})



app.listen('3001',()=>{
    console.log('Server started on port 3001');
});
// app.get('/',(req,res)=>{
//     res.send(temp);
//     console.log("req"); 
// });

app.get('/gets',cors(),(req,res)=>{
  if(isPwordOk){
    res.send(temp);
    console.log("on posts");
  }
});
app.use(cors());
let gotquantity;
let gotcustID;
let gotPID;

app.post("/create" , (req, res) =>{
  console.log("adding to cart in express");
  // console.log(req.body);
  gotquantity = req.body.quantity;
  gotcustID = req.body.customer_id;
  gotPID = req.body.product_id;
//   console.log("Received pId in express: " + gotPID);
//   con.query("INSERT INTO `Cart` (`customer_id`, `product_id`, `quantity`) VALUES ("+(gotcustID, gotPID, gotquantity)+");",(err,result)=>{
//     console.log(result.affectedRows +" record changed");  
//   });
var sql = 'INSERT INTO Cart(customer_id, product_id, quantity) VALUES ("'+gotcustID+'",' +gotPID+","+gotquantity+")";  

        con.query(sql, function (err, result) {  
            if (err) 
            {
                throw err;  
            }
            console.log("1 record inserted");  
            }
        );
})

app.use(cors());

const myTimeout = setTimeout(myGreeting, 1000);

function myStopFunction() {
  clearTimeout(myTimeout);
}

function myGreeting(){
// console.log("From temp",temp);
}


app.get('/getCart',cors(),(req,res)=>{
  // con.query('SELECT * FROM Cart C WHERE C.customer_id="aletha87";', (e,rows) => {
  //   console.log('Data received from Db:');
  //   console.log(rows);
  //   tempCart.push(rows);
  // });
  // res.send(tempCart);
  // console.log("on carts");



  // async function xx(s)
  // {
  //   tem=await s;
  //   console.log("works");
  //   // console.log(tem); 
  //   if(password === tem[0]["Password"])
  //       {
  //         console.log("username matches password");
  //         isPwordOk=true;
  //       }
  //       else{
  //         // app.get('/gets',cors(),(req,res)=>{
  //         //   res.send("Wrong Username or Password.");
  //         console.log("no match");
  //       }
  // }
  

  var sp = 'SELECT * FROM Cart C WHERE C.customer_id="'+username+'";';  
        con.query(sp, (err, result) => {  
          // console.log(result);
          res.send(result);
            }
        );
    }
);

app.get('/getcartsum',cors(),(req,res)=>{
  var sp = 'select  sum(P.MRP*C.quantity) from product P, cart C where C.product_id=P.product_id and C.customer_id="'+username+'";';  
  
        con.query(sp, (err, result) => {  
          console.log(result);
          res.send(result);
            }
        );
    }
);