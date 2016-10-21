
<div id="signindiv">
    <form id="signinform" action="<?= BASE_URL ?>/signin/process" method="POST">
        <input type="text" id="signinemailid" name = "un" placeholder="email">
        <input type="password" id="signinpassword" name = "pw" placeholder="password">
        <input type ="submit" id = "signin" value="Submit">
        <a id="signup" href="<?= BASE_URL ?>/signup">Create New Account</a> 
        <div class="clearfloat"><a href="#">Forgot account?</a></div>
    </form>
</div>
