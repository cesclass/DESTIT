const { exit } = require("process");
const fs = require("fs");
const mysql = require("mysql");

const file_options = { encoding: "utf-8" };
const config_file = "./server.conf.json";

try { // Ouverture (synchrone) du fichier de conf
  fs.accessSync(config_file, fs.constants.F_OK | fs.constants.R_OK);
} catch (error) {
  console.error("Fichier '%s' inaccessible.", config_file);
  exit(1);
}

const config = JSON.parse(fs.readFileSync(config_file, file_options));

const writer = mysql.createConnection({
  host:     config.database.host,
  port:     config.database.port,
  user:     config.database.writer.username,
  password: config.database.writer.password,
  // database: config.database.name
});

writer.connect((err) => {
  if (err) {
    console.error(err);
    exit(1);
  } else {
    console.log("connection ok");
  }
});

/* TEST SQL DESCRIBE
  writer.query("DESCRIBE `DEV_DB`.`CHERCHEUR`", (err, val) => {
    if(err) {
      console.error(err);
    } else {
      for(let {Type} of val)
      if(Type.match(/^enum(.*)/)) {
        console.dir(Type)
        Type = Type.replace(/enum|\(|\)|'/g, "");
        Type = Type.split(",");
        console.dir(Type);
      }
    }
  });
*/

/* TEST SQL INSERT
  writer.query("INSERT INTO `DEV_DB`.`CHERCHEUR` (nom, prenom, domaine) VALUES ('Cyril', 'ESCLASSAN', 'INFO')", (err, val) => {
    if(err) {
      console.error(err);
    } else {
      console.dir(val);
    }
  });
*/

/* TEST SQL SELECT
  writer.query("SELECT * FROM `DEV_DB`.`CHERCHEUR`", (err, val) => {
    if (err) {
      console.error(err);
    } else {
      console.dir(val);
    }
  });
*/

writer.end();
