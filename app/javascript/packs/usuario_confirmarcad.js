$(document).ready(function(){
    var cartorios_ids       = document.getElementById("cartorios_ids");    
    var assFixaAssinada     = document.getElementById("fixa_assinada");   
    function logArrayElements(element, index, array) {
        var nome_var = document.getElementById("fixa_assinada_"+element);    
    }
    JSON.parse(cartorios_ids.value).forEach(logArrayElements);
    $(document).on('keyup keypress', 'form input[type="text"]', function(e) {
        if(e.keyCode == 13) {
        e.preventDefault();
        return false;
        }
    }); 
    $("#enviar").click(function(){   
        for(let count = 0; JSON.parse(cartorios_ids.value).length; count++){ 
            let nome_var_aux = "fixa_assinada_"+JSON.parse(cartorios_ids.value)[count] 
            if(nome_var_aux.value==''){
                nome_var_aux.focus(); 
                $("#termo_required_"+JSON.parse(cartorios_ids.value)[count]).html("Não pode ficar vazio."); 
                nome_var_aux.style.boxShadow = "0px 0px 0px 1px #ea2c00";
                nome_var_aux.style.borderRadius = "6px";
                return false;
            }else{   
                $("#termo_required_"+JSON.parse(cartorios_ids.value)[count]).html("");  
                return true;
            };
        }
        
    });  
});
