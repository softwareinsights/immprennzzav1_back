<?php
define("HOSTNAME" , "localhost");
define("USERDB", "root");
define("PASSWORDDB" , "immprenzzaroot");
define("DBNAME" , "immprenzzaconstock");

$db = new PDO("mysql:host=".HOSTNAME.";dbname=".DBNAME.";chaset=utf8mb4", USERDB, PASSWORDDB);
