<?php
    $user="{{ DB_USER }}";
    $password="{{ DB_PASS }}";
    $dbname="kamailio";
    $host="{{ DB_HOST }}";

    try {
        $dsn = "mysql:host=$host;dbname=$dbname;port=3306";
        $dbh = new PDO($dsn, $user, $password);
    } catch (PDOException $e){
        echo $e->getMessage();
    }
?>