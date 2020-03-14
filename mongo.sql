use admin
db.createUser(
   {
     user: "root",
     pwd: "dick206530",
     roles: [ { role: "userAdminAnyDatabase", db: "admin" },
              { role: "dbAdminAnyDatabase", db: "admin" }]
   }
 )

use osr_sys
db.createCollection("test")
db.createUser(
{
    user:'root',
    pwd:'dick206530',
    roles:[{role:'readWrite', db:'osr_sys'}]
})

use osr_user
db.createCollection("test")
db.createUser(
{
    user:'root',
    pwd:'dick206530',
    roles:[{role:'readWrite', db:'osr_user'}]
})


use osr_web
db.createCollection("test")
db.createUser(
{
    user:'root',
    pwd:'dick206530',
    roles:[{role:'readWrite', db:'osr_web'}]
})
