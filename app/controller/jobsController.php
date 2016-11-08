<?php

/* 
 * Main controller file for tasks related to applications. Contains functions for
 * create, edit and delete job post operations.
 */
include_once '../global.php';

//get the page that we want to load
$action = $_GET["action"];

//instantiate a jobsController and route it
$jc = new JobsController();
$jc->route($action);

class JobsController{
    //global constants for column names in the table.
    const COL1 = "id";
    const COL2 = "title";
    const COL3 = "location";
    const COL4 = "summary";
    const COL5 = "job_desc";
    const COL6 = "img_url";
    const COL7 = "link_url";
    
    public function route($action){
        switch($action){
            case "jobs":
                $jobsType = $_GET["jobsType"];
                if($jobsType == "preferred"){
                    $this->preferredJobs();
                }
                else {
                    $this->suggestedJobs();
                }
                break;
            case "editJobPost":
                if($this->isAdminLogin()){
                    $jobid = $_GET["id"];
                    $operation = $_POST['button'];
                    if($operation == "edit"){
                        $this->editJobPost($jobid);
                    }else{
                        $this->deleteJobPost($jobid);
                    }
                }
                else{
                    header("LOCATION ".BASE_URL."/home.tpl");
                }
                break;
            case "editJobProcess":
                if($this->isAdminLogin()){
                    $id= $_GET['id'];
                    $this->editJobProcess($id);
                }
                else{
                    header("LOCATION ".BASE_URL."/home.tpl");
                }
                break;
            case "createJobPost":
                if($this->isAdminLogin()){
                    $this->createJobPost();
                }
                else{
                    header("LOCATION ".BASE_URL."/home.tpl");
                }
                break;
            case "createJobProcess":
                if($this->isAdminLogin()){
                    $this->createJobProcess();
                }
                else{
                    header("LOCATION ".BASE_URL."/home.tpl");
                }
                break;
            case "viewJobPost":
                $jobid=$_GET["id"];
                $this->viewJobPost($jobid);
                break;
            default:
                header('Location: '.BASE_URL);
                exit();
        }
    }
    public function isAdminLogin(){
        session_start();
        if(isset($_SESSION['user']) && $_SESSION['user'] == 'admin'){
            return true;
        }
        else{
            return false;
        }
    }
    //placeholder for preferred jobs page, yet to be implemented
    public function preferredJobs(){
       // echo 'Page under construction.';
        $pageName = "preferredJobs";
        $resultList = $this->getJobsList(); 
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/preferredJobs.tpl';
        include_once SYSTEM_PATH.'/view/footer.tpl';
    }
    
    public function getJobsList() {
        $endpoint = "http://service.dice.com/api/rest/jobsearch/v1/simple.json?text=java&country=CA&pgcnt=5";
        $contents = file_get_contents($endpoint);
	$obj = json_decode($contents);
        return json_decode(json_encode($obj->{'resultItemList'}), True); //stdClass Object to Array
    }
    
    //function to call list view in suggested jobs page
    public function suggestedJobs(){
        $result = SuggestedJobs::getAllJobs();
        $jobs = array();
        foreach($result as &$row){
            $jobs[] = $this->getAllCols($row);
        } 
        
        //set isAdmin
        $isAdmin = $this->isAdminLogin();
        $pageName = "jobs";
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/jobs.tpl';
        include_once SYSTEM_PATH.'/view/footer.tpl';
    }
    
    //helper function to convert a result object to an array
    public function getAllCols($row){
        $item = array();
        $item[self::COL1] = $row ->get(self::COL1);
        $item[self::COL2] = $row ->get(self::COL2);
        $item[self::COL3] = $row->get(self::COL3);
        $item[self::COL4] = $row ->get(self::COL4);
        $item[self::COL5] = $row->get(self::COL5);
        $item[self::COL6] = $row -> get(self::COL6);
        $item[self::COL7] = $row->get(self::COL7);
        return $item;
    }
    
    //function to call edit view in suggested jobs page
    public function editJobPost($id){
        $pageName = "EditJob";
        $result = SuggestedJobs::loadById($id);
        if($result != NULL){
            $job = $this->getAllCols($result);
        }
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/editJobPost.tpl';
	include_once SYSTEM_PATH.'/view/footer.tpl';
    }
    
    //function to process edit view in suggested jobs page
    public function editJobProcess($id){
        $title = $_POST[self::COL2];
        $location = $_POST[self::COL3];
        $summary = $_POST[self::COL4];
        $job_desc = $_POST[self::COL5];
	$link_url = $_POST[self::COL7];
        
	$job = SuggestedJobs::loadById($id);
	$job->set(self::COL2, $title);
	$job->set(self::COL4, $summary);
	$job->set(self::COL3, $location);
        $job->set(self::COL5, $job_desc);
	$job->set(self::COL7, $link_url);

	$job->save();
        header("LOCATION: ".BASE_URL."/jobs");
    }
    
    //function to call create view in suggested jobs page
    public function createJobPost(){
        $pageName = "CreateJob";
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/createJobPost.tpl';
	include_once SYSTEM_PATH.'/view/footer.tpl';
    }
    
    //function to process create view in suggested jobs page
    public function createJobProcess(){
        $job = new SuggestedJobs();
        $job->set(self::COL2, $_POST[self::COL2]);
	$job->set(self::COL4, $_POST[self::COL4]);
        $job->set(self::COL5, $_POST[self::COL5]);
	$job->set(self::COL3, $_POST[self::COL3]);
	$job->set(self::COL7, $_POST[self::COL7]);
        
        $job->save();
        header("LOCATION: ".BASE_URL."/jobs");
    }
    
    //function to process delete view in suggested jobs page
    public function deleteJobPost($id){
        $obj = new SuggestedJobs();
        $obj->deleteById($id);
        header("LOCATION: ".BASE_URL."/jobs");
    }
    
    //function to call detail view in suggested jobs page
    public function viewJobPost($id){
        $isAdmin = $this->isAdminLogin();
        $pageName = "ViewJob";
        $result = SuggestedJobs::loadById($id);
        $job = $this->getAllCols($result);
        include_once SYSTEM_PATH.'/view/header.tpl';
        include_once SYSTEM_PATH.'/view/viewJob.tpl';
	include_once SYSTEM_PATH.'/view/footer.tpl';
    }
} 

