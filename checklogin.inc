<?php

if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW'])) {
     // If username or password hasn't been set, display the login request.
     displayLogin();

} else {

     // Escape both the password and username string to prevent users from inserting bogus data.
     $_SERVER['PHP_AUTH_USER'] = addslashes($_SERVER['PHP_AUTH_USER']);
     $_SERVER['PHP_AUTH_PW'] = md5($_SERVER['PHP_AUTH_PW']);

     // Check username and password agains the database.
     $sql = "SELECT id FROM webusers WHERE password='" . $_SERVER['PHP_AUTH_PW'] . "' AND username='" . $_SERVER['PHP_AUTH_USER'] . "'";
     $result = $dbh->query($sql) or die("Couldn't query the user-database.");

     $num = $result->rowCount();

     //echo "$sql: " . $sql . "<BR>";
     //echo "count: " . $num;

     if (!$num) {
          // If there were no matching users, show the login
          displayLogin();
     }
}

?>