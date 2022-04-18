<?php
    include '../init.php';
	$getFromU->preventAccess($_SERVER['REQUEST_METHOD'], realpath(__FILE__), realpath($_SERVER['SCRIPT_FILENAME']));
    if(isset($_POST) && !empty($_POST)){
        $status = $getFromU->checkInput($_POST['status']);
        $user_id = $_SESSION['user_id'];
        $tweetImage = '';

        if(!empty($status) or !empty($_FILES['file']['name'][0])){
			if(!empty($_FILES['file']['name'][0])){
				$tweetImage = $getFromU->uploadImage($_FILES['file']);
			}

			if(strlen($status) > 140){
				$error = "The Text of your tweet is too long";
			}
			$getFromU->create('tweets',array('status' => $status, 'tweetBy' => $user_id, 'tweetImage' => $tweetImage, 'postedOn' => date('d-m-Y H:i:s')));
			preg_match_all("/#+([a-zA-Z0-9_]+)/i", $status, $hashtag);
			
			if(!empty($hashtag)){
				$getFromT->addTrend($status);
			}
			$tweet_id = $getFromT->addMention($status, $user_id, $tweet_id);

            $result['success'] = "Your Tweet has been posted";
            echo json_encode($result);

		}else{
			$error = "Type or choose image to tweet";
		}

        if(isset($error)){
            $result['error'] = $error;
            echo json_encode($result);
        }
    }
?>