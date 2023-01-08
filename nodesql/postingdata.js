// var mysql = require("mysql");

function addItemToCart(cId, pId, qty)
{
    var mysql = require("mysql");
    console.log(mysql);
    const con = mysql.createConnection({
        host: '127.0.0.1',
        user: 'root',
        password: 'administrator',
        database: 'sys'
    });

    con.connect(function(err) {  
        if (err) 
        {
            throw err;  
        }

        console.log("Connected!");  

        // var sql = "INSERT INTO Product VALUES (101, 11, 21, 'elaitnsos', 69, 2, 'apsul', 'Pasdsuct Fugifat amus')";  
        var sql = 'INSERT INTO Cart(customer_id, product_id, quantity) VALUES ("'+cId+'",' +pId+","+qty+")";  

        con.query(sql, function (err, result) {  
            if (err) 
            {
                throw err;  
            }
            console.log("1 record inserted");  
            }
        );
    }
    );
}


function addProductToInv(pId, adminId, sId, pName, mrp, qty, pCat, pDesc)
{
    var mysql = require("mysql");
    const con = mysql.createConnection({
        host: '127.0.0.1',
        user: 'root',
        password: 'administrator',
        database: 'sys'
    });

    con.connect(function(err) {  
        if (err) 
        {
            throw err;  
        }

        console.log("Connected!");  

        // var sql = "INSERT INTO Product VALUES (101, 11, 21, 'elaitnsos', 69, 2, 'apsul', 'Pasdsuct Fugifat amus')";  
        var sql = "INSERT INTO Product VALUES ("+pId+"," +adminId+","+sId+", '"+pName+"', "+mrp+", "+qty+", '"+pCat+"', '"+pDesc+")";  

        con.query(sql, function (err, result) {  
            if (err) 
            {
                throw err;  
            }
            console.log("1 record inserted");  
            }
        );
    }
    );
}



// addItemToCart("aletha87", "87", "1");
export {addProductToInv, addItemToCart};