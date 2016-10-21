/**
 * Created by vrk19 on 9/23/2016.
 */
$(document).ready(function () {

    //to have the personal information tab highlighted
    $(".activelink").css("background-color", "white");
    $(".activelink").css("color", "#006699");

    //navigating to corresponding forms in card layout
    $("#tabslist a").click(function () {
        var formid = $(this).text().toLowerCase().replace(/\s/g, '');
        $(".activelink").css("background-color", "#006699");
        $(".activelink").css("color", "white");
        $("#tabslist").removeClass("activelink");
        $(this).css("background-color", "white");
        $(this).css("color", "#006699");
        var forms = $(".appforms");
        //debugger;
        $(this).addClass("activelink");
        $(".appforms").removeClass("active");
        $("#" + formid).addClass("active");
    });

    //to add a company to the companies list
    $("#addcompany").click(function () {
        var company = $("#companyname").val();
        var compname = "<div class = compname>" + company + "</div>";
        if(company === ""){
            $("#companyname").css("border-color", "red");
        }
        else{
            $("#companylist").prepend("<li>"+ compname + "<button class='close' id='"+company+"'>" + "\u00D7" + "</button>" + "</li>");
            $("#companyname").val("");
        }
    });

    //to delete a company from the list
    $("#companylist").on("click", function (e) {
        if(e.target.className === "close"){
            $("#"+e.target.id).parent().remove();
        }
    });


    //to change the style in nav bar
    $("nav").click(function (e) {
        $(".selectednav").removeClass("selectednav");
        $(e.target).addClass("selectednav");
    });

    //to navigate to profile info on signup submit
    $("#signupform").submit(function () {
        debugger;
       window.location = 'profileinfo.html';
    });
    
    $(".customtable").on("click", ".edit", function(){
       if($(this).siblings().hasClass("normalCell")){
            $(this).siblings().addClass("editedCell");
            $(this).siblings().removeClass("normalCell");
            $(this).attr("name", "editSubmit");
            $(this).attr("type", "button");
            $(this).html('&#9989');
            $(this).siblings().attr("contenteditable", "true");
            $(this).parent().children().first().attr("contenteditable", "false");
        }
        else{
            $(this).siblings().addClass("normalCell");
            $(this).siblings().removeClass("editedCell");
            $(this).attr("name", "button");
            $(this).attr("type", "submit");
            var id = $(this).attr("form");  
            $(this).attr("form", "editApplication_" + id);
            $(this).html('&#9998');
            $(this).siblings().attr("contenteditable", "false");
            
            //set input fields
            $field = $(this).parent().children("input.company_name");
            $field.attr("value", $field.parent().children("div.company_name").text().trim());
            $field = $(this).parent().children("input.position");
            $field.attr("value", $field.parent().children("div.position").text().trim());
            $field = $(this).parent().children("input.job_url");
            $field.attr("value", $field.parent().children("div.job_url").text().trim());
            $field = $(this).parent().children("input.applied_date");
            $field.attr("value", $field.parent().children("div.applied_date").text().trim());
            $field = $(this).parent().children("input.resume_version");
            $field.attr("value", $field.parent().children("div.resume_version").text().trim());
            $field = $(this).parent().children("input.contact");
            $field.attr("value", $field.parent().children("div.contact").text().trim());
            $field = $(this).parent().children("input.status");
            $field.attr("value", $field.parent().children("div.status").text().trim());
        }
    });
    
    $(".delete").click(function(){
        return confirm("Do you want to delete this application?");
    });
  /*
    $(".customtable").on("click", ".normalCell", function(){
       if($("td").hasClass("editableCell")){
           $("td").attr("contenteditable", "false");
           $("td").addClass("normalCell");
           $("td").removeClass("editableCell");
       }
       $(this).addClass("editableCell");
       $(".editableCell").attr("contenteditable", "true");
       $(this).removeClass("normalCell");
    });
    
    $("table").on("click", ".removeRow", function(){ 
       $(this).parent().parent().remove(); 
    });
    
    $(".customtable").on("click", ".addRow", function(){
       var $row = $(this).parent().parent(); 
       var $tds = $row.find("td");
       $("table").find("tbody").find("tr").last().remove();
       $("table").find("tbody").append($('<tr>'));
       var newrow = $("table").find("tbody").find("tr").last();
       
       $.each($tds, function(){
           newrow.append($('<td class = "normalCell" contenteditable="false">'));
           newrow.find("td").last().text($(this).find("input").val());
           newrow.find("td").find("input").append($('<input type="hidden" name="" value="">'));
           //add name and value parameters with jobid_nameid and jobid_valueid
       });
       //adding close button
       newrow.find("td").last().remove();
       newrow.append("<td class='remove'> <button type='button' class='removeRow'> X </button></td>");
     
       //adding addElementRow again
       $("table").find("tbody").append("<tr id='addApplication'><td>New</td><td><input type='text' name='company_name'></td><td><input type='text' name='jobrole'></td><td><input type='text' name='jobpostlink'></td><td><input type='date' name='applieddate'></td><td><input type='text' style='max-width: 100px' name='resumeversion'></td><td><input type='text' name='contact'></td><td><input type='text' name='status'></td><td class='add'> <button type='button' class='addRow'> + </button></td>");
                
    });
    */
    $(".deleteButton").click(function(){
       return confirm("Do you want to delete this post?"); 
    });
    
    $("#deleteApplication").click(function(){
       return confirm("Do you want to delete this application?"); 
    });
});
