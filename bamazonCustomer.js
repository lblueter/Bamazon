var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "root",
  database: "bamazon_DB"
});

var selection
var quantity
var total

connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);

  connection.query("SELECT * FROM products", function (err, res) {
    if (err) throw err;
    // console.log(res)
    for (var i = 0; i < res.length; i++) {
      console.log("Item ID: " + res[i].item_id + " | Name: " + res[i].product_name + " | Price: $" + res[i].price)
    }

    inquirer.prompt([
      {
        type: "input",
        message: "Enter ID of item you wish to purchase.",
        name: "select",
        validate: function (value) {
          if (isNaN(value) === false) {
            return true;
          }
          return false;
        }
      }
    ]).then(function (first) {
      selection = first.select

      inquirer.prompt([
        {
          type: "input",
          message: "How much would you like to purchase?",
          name: "amount",
          validate: function (value) {
            if (isNaN(value) === false) {
              return true;
            }
            return false;
          }
        }
      ]).then(function (second) {
        quantity = second.amount

        connection.query("SELECT * FROM products WHERE item_id=?", [selection], function (err, resp) {
          if (err) throw err;
          // console.log(resp[0].stock_quantity)
          if (quantity > resp[0].stock_quantity) {
            console.log("I'm sorry, we don't have enough of that product.")
            connection.end()
          } else {
            total = quantity * resp[0].price
            quantity = resp[0].stock_quantity - quantity

            console.log("Your total is $" + total)
            inquirer.prompt([
              {
                type: "confirm",
                message: "Is this ammount correct?",
                name: "conf",
                default: true
              }
            ]).then(function (third) {

              if (third.conf) {
                connection.query("UPDATE products SET ? WHERE ?", [
                  {
                    stock_quantity: quantity
                  },
                  {
                    item_id: selection
                  }
                ], function (err, respo) {
                  if (err) throw err;
                  console.log("Cha-Ching! Item(s) purchased.")
                  connection.end()
                })
              } else {
                console.log("Please try again.")
                connection.end()
              }
            })
          }

        })
      })
    })
  })

});
