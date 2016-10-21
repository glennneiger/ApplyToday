<?php
/* 
 * Main controller file for the site. Used for navigation between pages.
 */
include_once '../global.php';

$action = $_GET["action"];
$pc = new SiteController();
$pc->route($action);

class SiteController{
    public function route($action){
        switch ($action){
            case "home":
                $this-> home();
                break;
            case "signinProcess":
                $un = $_POST["un"];
                $pw = $_POST["pw"];
                $this->processSignIn($un, $pw);
                break;
            case "signup":
                $this-> signup();
                break;
            case "targets":
                $this-> targets();
                break;
            case "profileinfo":
                $this-> profileinfo();
                break;
            case "error":
                $this->goToError();
                break;
            default:
                header('Location: '.BASE_URL);
                exit();
        }
    }
    //home page
    public function home(){
        $pageName = "home";
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/home.tpl';
        include_once SYSTEM_PATH.'/view/footer.tpl';
    }
    
    //signup page
    public function signup(){
        $pageName = "signup";
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/signup.tpl';
        include_once SYSTEM_PATH.'/view/footer.tpl';
    }
    
    //targets page
    public function targets(){
        $pageName = "targets";
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/targets.tpl';
        include_once SYSTEM_PATH.'/view/footer.tpl';
    }
   
    //profileinfo page
    public function profileinfo(){
        $pageName = "profileinfo";
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/profileinfo.tpl';
        include_once SYSTEM_PATH.'/view/footer.tpl';
    }

    //function to process sign in action
    public function processSignIn($un=null, $pw=null){
        //validations for username and password
        if($un == null) {
            $error = "User name cannot be empty.";
            $this->goToError($error);
            exit();
        }
        if($pw == null){
            $error = "Password cannot be empty.";
            $this->goToError($error);
            exit();
        }
        $pageName = "applications";
        $obj = User::loadByUsername($un);
        //print_r($obj);  
        if($obj == null){
            $error = "User name not found.";
            $this->goToError($error);
            exit();
        }
        else if($obj->get('password') == $pw){
           session_start();
           $_SESSION['user'] = $un;
           if($_SESSION['user'] == 'admin'){
               $isAdmin = true;
           }
           //echo $_SESSION['user'];
           header('LOCATION: '.BASE_URL."/applications");
        }
        else{
            $error = "Password is incorrect.";
            $this->goToError($error);
            exit();
        }
    }
    
    //function to call error page
    public  function goToError($error){
        $pageName = "home";
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/error.tpl';
        include_once SYSTEM_PATH.'/view/footer.tpl';
    }
    
}