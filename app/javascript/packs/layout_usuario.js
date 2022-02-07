$(document).ready(function(){  
    a = 1
    $count = 0
    function openNavLeft() { 
        document.getElementById("mySidenav-left").style.width    = "314px";  
        document.getElementById("minimize").style.display   = "block";  
        document.getElementById("html_main").style.overflow = "hidden";
    }

    function closeNavLeft() {   
        document.getElementById("mySidenav-left").style.width    = "0"; 
        document.getElementById("minimize").style.display   = "none";  
        document.getElementById("html_main").style.overflow = "auto";
    }
    function openNavRight() {  
        document.getElementById("mySidenav-right").style.width   = "100%"; 
        document.getElementById("mySidenav-right").style.display   = "block";  
        document.getElementById("minimize").style.display   = "block";  
        document.getElementById("html_main").style.overflow = "hidden";
    }

    function closeNavRight() {   
        document.getElementById("mySidenav-right").style.width   = "0%"; 
        document.getElementById("minimize").style.display   = "none"; 
        document.getElementById("html_main").style.overflow = "auto";
    }
    function openNavUl() {  
        $("#ul-in-ul").fadeIn("slow");
        $count += a; 
        if($count == 2){ 
            $("#ul-in-ul").fadeOut("slow");
            $count = 0;
        }  
    } 
    $("#openNavLeft").on("click", function(){
        openNavLeft(); 
    }); 
    $("#openNavRight").on("click", function(){
        openNavRight(); 
    }); 
    
    $("#closebtn-right").on("click", function(){
        closeNavRight(); 
    }); 
    $("#closebtn").on("click", function(){
        closeNavLeft(); 
    });   
    $("#openNavUl").on("click", function(){
        openNavUl(); 
    });   
});
