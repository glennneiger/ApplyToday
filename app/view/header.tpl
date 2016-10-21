<?php
    function isSelected($curPage, $pageName){
        if($curPage == $pageName)
            return 'class = "selectednav" ';         
    }
    
   
    
    function createHeader($pageName){
        if($pageName == "home"){
            echo '<h1> Apply Today</h1>';
            include_once SYSTEM_PATH.'/view/signin.tpl';
        }
        else if($pageName == "signup"){
            echo'
            <h1> Apply Today</h1>
            <div id="signupnav">
               Already have an account?
               <a href="'.BASE_URL.'/home"> Sign In here</a>
            </div>';
        }
        else{
          echo'
            <nav>
                <ul>
                    <li><a id ="applications" '.isSelected("applications", $pageName).' href="'.BASE_URL.'/applications">Applications</a></li>
                    <li><a id ="mytargets"  '.isSelected("targets", $pageName).' href="'.BASE_URL.'/targets">My Targets</a></li>
                    <li><a id ="jobs"  '.isSelected("jobs", $pageName).' href="'.BASE_URL.'/jobs">Jobs</a></li>
                    <li><a id = "profileinfo"  '.isSelected("profileinfo", $pageName).' href="'.BASE_URL.'/profileinfo">Profile Info</a></li>
                </ul>
            </nav>';
            
        }
    }
    
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your personal job application manager</title>
    <link rel = "stylesheet" type = "text/css" href = "<?= BASE_URL?>/public/css/styles.css">
    <script type="text/javascript" src="<?= BASE_URL?>/public/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src = "<?= BASE_URL?>/public/js/scripts.js"></script>
</head>
<body>
    <header>
        <div id = "logo">
            <a href="<?=BASE_URL?>/home">
                <img src="<?= BASE_URL ?>/public/img/at.png" alt="logo"/>
            </a>
        </div>
        <?= createHeader($pageName)?>
       
    </header>
