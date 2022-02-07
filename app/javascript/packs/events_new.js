$(document).ready(function(){ 
    let div_insc_ini            = document.getElementById("div_intranet_event_insc_ini")
    let div_insc_fim            = document.getElementById("div_intranet_event_insc_fim")
    let div_periodo_ini         = document.getElementById("div_intranet_event_periodo_ini")
    let div_periodo_fim         = document.getElementById("div_intranet_event_periodo_fim")
    let div_data_max_pagamento  = document.getElementById("div_intranet_event_data_max_pagamento")
    let div_tipo                = document.getElementById("div_intranet_event_tipo")
    let div_valor               = document.getElementById("div_intranet_event_valor")
    let div_qtd_insc_total      = document.getElementById("div_intranet_event_qtd_insc_total")
    let div_qtd_insc_cart       = document.getElementById("div_intranet_event_qtd_insc_cart")

    let event_pago              = document.getElementById("intranet_event_pago")
    let insc_ini                = document.getElementById("intranet_event_insc_ini")
    let insc_fim                = document.getElementById("intranet_event_insc_fim")
    let periodo_ini             = document.getElementById("intranet_event_periodo_ini")
    let periodo_fim             = document.getElementById("intranet_event_periodo_fim")
    let data_max_pagamento      = document.getElementById("intranet_event_data_max_pagamento") 
    let tipo                    = document.getElementById("tipo")
    let valor                   = document.getElementById("intranet_event_valor")
    let qtd_insc_total          = document.getElementById("intranet_event_qtd_insc_total")
    let qtd_insc_cart           = document.getElementById("intranet_event_qtd_insc_cart")

    div_insc_fim.style.display           = "none";            
    div_periodo_ini.style.display        = "none";         
    div_periodo_fim.style.display        = "none";         
    div_data_max_pagamento.style.display = "none";  
    div_tipo.style.display               = "none";                
    div_valor.style.display              = "none";               
    div_qtd_insc_total.style.display     = "none";      
    div_qtd_insc_cart.style.display      = "none";    

    insc_ini.onchange = function (){      
        insc_fim.value           = null          
        periodo_ini.value        = null
        periodo_fim.value        = null
        data_max_pagamento.value = null
        tipo.value               = null              
        valor.value              = null              
        qtd_insc_total.value     = null     
        qtd_insc_cart.value      = null   
            
        div_insc_fim.style.display           = "none";          
        div_periodo_ini.style.display        = "none";       
        div_periodo_fim.style.display        = "none";       
        div_data_max_pagamento.style.display = "none";
        div_tipo.style.display               = "none";              
        div_valor.style.display              = "none";             
        div_qtd_insc_total.style.display     = "none";    
        div_qtd_insc_cart.style.display      = "none";  

        div_insc_fim.style.display = "block";
        insc_fim.setAttribute("min", insc_ini.value);
    }
    insc_fim.onchange = function (){   
        periodo_ini.value                    = null 
        periodo_fim.value                    = null
        data_max_pagamento.value             = null
        tipo.value                           = null              
        valor.value                          = null             
        qtd_insc_total.value                 = null     
        qtd_insc_cart.value                  = null   
        div_periodo_fim.style.display        = "none";       
        div_data_max_pagamento.style.display = "none";
        div_tipo.style.display               = "none";              
        div_valor.style.display              = "none";             
        div_qtd_insc_total.style.display     = "none";    
        div_qtd_insc_cart.style.display      = "none"; 
        div_periodo_ini.style.display        = "block"; 

        periodo_ini.setAttribute("min", insc_fim.value);
    }
    periodo_ini.onchange = function (){ 
        periodo_fim.value                    = null
        data_max_pagamento.value             = null
        tipo.value                           = null              
        valor.value                          = null            
        qtd_insc_total.value                 = null   
        qtd_insc_cart.value                  = null    
        div_periodo_fim.style.display        = "none";       
        div_data_max_pagamento.style.display = "none";
        div_tipo.style.display               = "none";              
        div_valor.style.display              = "none";             
        div_qtd_insc_total.style.display     = "none";    
        div_qtd_insc_cart.style.display      = "none";  
        div_periodo_ini.style.display        = "block"; 
        div_periodo_fim.style.display        = "block";
        periodo_fim.setAttribute("min", insc_fim.value);
    }
    periodo_fim.onchange = function (){ 
        data_max_pagamento.value             = null 
        tipo.value                           = null              
        valor.value                          = null             
        qtd_insc_total.value                 = null     
        qtd_insc_cart.value                  = null     
        div_data_max_pagamento.style.display = "none";
        div_tipo.style.display               = "none";              
        div_valor.style.display              = "none";             
        div_qtd_insc_total.style.display     = "none";    
        div_qtd_insc_cart.style.display      = "none";
        if(event_pago.checked){ 
            div_data_max_pagamento.style.display = "block";
            data_max_pagamento.setAttribute("max", periodo_fim.value);
            data_max_pagamento.setAttribute("min", insc_fim.value);
            $("#intranet_event_data_max_pagamento").prop('required',true)
            $("#intranet_event_valor").prop('required',true)
        }else{
            div_tipo.style.display = "block";
            $("#intranet_event_data_max_pagamento").prop('required',false)
            $("#intranet_event_valor").prop('required',false)
        }
    }
    event_pago.onchange = function (){
        if(event_pago.checked){ 
            div_data_max_pagamento.style.display = "block";
            data_max_pagamento.setAttribute("max", periodo_fim.value);
            data_max_pagamento.setAttribute("min", insc_fim.value);
            qtd_insc_cart.value.value =  null 
            qtd_insc_total.value      =   null
            tipo.value                = null                         
            valor.value               = null      
            div_valor.style.display   = "block";
            $("#intranet_event_data_max_pagamento").prop('required',true)
            $("#intranet_event_valor").prop('required',true)
        }else{
            tipo.value                = null               
            div_tipo.style.display    = "block"; 
            div_data_max_pagamento.style.display = "none";
            data_max_pagamento.value  = null
            qtd_insc_cart.value.value =  null 
            qtd_insc_total.value      =   null           
            valor.value               = null     
            div_valor.style.display = "none";
            $("#intranet_event_data_max_pagamento").prop('required',false)
            $("#intranet_event_valor").prop('required',false)
        }
    } 
    data_max_pagamento.onchange = function(){ 
        tipo.value              = null               
        valor.value             = null               
        qtd_insc_total.value    = null     
        qtd_insc_cart.value     = null     
        div_tipo.style.display  = "none";              
        div_valor.style.display = "none";             
        div_qtd_insc_total.style.display = "none";    
        div_qtd_insc_cart.style.display  = "none"; 
        div_tipo.style.display = "block";
    }
    tipo.onchange = function(){   
        if(event_pago.checked){ 
            div_valor.style.display = "block"; 
            $("#intranet_event_data_max_pagamento").prop('required',true)
            $("#intranet_event_valor").prop('required',true)
        }else{ 
            div_valor.style.display = "none"; 
            $("#intranet_event_data_max_pagamento").prop('required',false)
            $("#intranet_event_valor").prop('required',false)
        }

        valor.value = null  
        if(tipo.value == "1"){
            div_qtd_insc_total.style.display = "block";  
            div_qtd_insc_cart.style.display  = "none";  
            
            $("#div_intranet_event_qtd_insc_cart").prop('required',true)
            $("#div_intranet_event_qtd_insc_total").prop('required',false)

            qtd_insc_cart.value.value = null
            qtd_insc_total.value      = null  
            valor.value               =  null
        }else if(tipo.value == "2"){ 
            div_qtd_insc_cart.style.display  = "block"; 
            div_qtd_insc_total.style.display = "none"; 

            $("#div_intranet_event_qtd_insc_cart").prop('required',false);
            $("#div_intranet_event_qtd_insc_total").prop('required',true);

            qtd_insc_cart.value.value =  null;
            qtd_insc_total.value      =   null;
            valor.value               = null;
        }
    }
});