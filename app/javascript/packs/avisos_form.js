$(document).ready(function(){
    
    $("#tdscheck").on("change", function(){
        checktds(); 
    });
    function checktds() { 
        var id1       = document.getElementById("atividade_id_1");
        var id3     = document.getElementById("atividade_id_3");
        var id11     = document.getElementById("atividade_id_11");
        var id6      = document.getElementById("atividade_id_6");
        var id2      = document.getElementById("atividade_id_2");
        var id7     = document.getElementById("atividade_id_7");
        var id4      = document.getElementById("atividade_id_4");
        var id9     = document.getElementById("atividade_id_9"); 
        var id8     = document.getElementById("atividade_id_8"); 
        var id10     = document.getElementById("atividade_id_10"); 
        var id5     = document.getElementById("atividade_id_5"); 
        var tds       = document.getElementById("tdscheck");
        if(tds.checked){ 
            id1.checked     = true; 
            id3.checked     = true; 
            id11.checked    = true; 
            id6.checked     = true; 
            id2.checked     = true;  
            id7.checked     = true;   
            id4.checked     = true;   
            id8.checked     = true;   
            id9.checked     = true;  
            id10.checked    = true;   
            id5.checked     = true;   
        }else{ 
            id1.checked     = false; 
            id3.checked     = false; 
            id11.checked    = false; 
            id6.checked     = false; 
            id2.checked     = false;  
            id7.checked     = false;   
            id4.checked     = false;   
            id8.checked     = false;  
            id9.checked     = false;  
            id10.checked    = false;   
            id5.checked     = false;   
        }
    }; 
        
    $("#subform").click(function() {
        var titulo  = document.getElementById("intranet_aviso_titulo");
        var aviso = document.getElementById("intranet_aviso_aviso");
        if(titulo.value == ''){
            titulo.style.border = "1px solid #ea2c00"; 
            return false;
        }else{
            titulo.style.border = "1px solid #ced4da"; 
            if(aviso.value == ""){
            aviso.style.border = "1px solid #ea2c00"; 
            return false;
            }else{
            aviso.style.border = "1px solid #ced4da"; 
            return true;
        };
    };  
    }); 
});