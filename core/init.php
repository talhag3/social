<?php
    require __DIR__.'/../dotenv.php';
    if(isset($DOTENV) && isset($DOTENV['env']) && $DOTENV['env'] == 'dev'){
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
    }
    
    
    include 'database/connection.php';
    include 'classes/user.php';
    include 'classes/follow.php';
    include 'classes/tweet.php';
    include 'classes/message.php';

    global $pdo;

    session_start();

    $getFromU = new User($pdo);
    $getFromF = new Follow($pdo);
    $getFromT = new Tweet($pdo);
    $getFromM = new Message($pdo);

    
    define("BASE_URL", $DOTENV['baseurl'] ? $DOTENV['baseurl'] : "http://localhost/twitter/");
?>