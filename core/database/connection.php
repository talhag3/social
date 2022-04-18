<?php
    
    $dsn = "mysql:host=".$DOTENV['host'].";dbname=".$DOTENV['dbname'];
    $user = $DOTENV['dbuser'];
    $pass = $DOTENV['dbpass'];
    

    //die($DOTENV['host']);

    try{
        echo $dsn.$user.$pass;
        $pdo = new PDO($dsn, $user, $pass);
    }catch(PDOException $e){
        echo 'Connection Error! ' . $e->getMessage();
        die;
    }
?>