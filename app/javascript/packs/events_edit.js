$(document).ready(function(){
    let div_insc_ini           = document.getElementById("div_intranet_event_insc_ini")
    let div_insc_fim           = document.getElementById("div_intranet_event_insc_fim")
    let div_periodo_ini        = document.getElementById("div_intranet_event_periodo_ini")
    let div_periodo_fim        = document.getElementById("div_intranet_event_periodo_fim")
    let div_data_max_pagamento = document.getElementById("div_intranet_event_data_max_pagamento")
    let div_tipo               = document.getElementById("div_intranet_event_tipo")
    let div_valor              = document.getElementById("div_intranet_event_valor")
    let div_qtd_insc_total     = document.getElementById("div_intranet_event_qtd_insc_total")
    let div_qtd_insc_cart      = document.getElementById("div_intranet_event_qtd_insc_cart")

    let tipo_aux           = document.getElementById("tipo")
    let event_pago         = document.getElementById("intranet_event_pago")
    let insc_ini           = document.getElementById("intranet_event_insc_ini")
    let insc_fim           = document.getElementById("intranet_event_insc_fim")
    let periodo_ini        = document.getElementById("intranet_event_periodo_ini")
    let periodo_fim        = document.getElementById("intranet_event_periodo_fim")
    let data_max_pagamento = document.getElementById("intranet_event_data_max_pagamento")
    let tipo               = document.getElementById("tipo")
    let valor              = document.getElementById("intranet_event_valor")
    let qtd_insc_total     = document.getElementById("intranet_event_qtd_insc_total")
    let qtd_insc_cart      = document.getElementById("intranet_event_qtd_insc_cart")
    
    if(document.getElementById("div_intranet_event_tipo").value == "1"){
        div_qtd_insc_total.style.display = "block";
        div_qtd_insc_cart.style.display  = "none"; 
        qtd_insc_total.setAttribute("readonly", true); 
    }else{ 
        div_qtd_insc_cart.style.display  = "block";  
        div_qtd_insc_total.style.display = "none";  
        qtd_insc_cart.setAttribute("readonly", true); 
    }    
    if(event_pago.checked){
        div_valor.style.display  = "block"; 
        $("intranet_event_valor").prop('required',true)
    }else{ 
        div_valor.style.display  = "none"; 
        $("intranet_event_valor").prop('required',false)
    } 
    insc_ini.setAttribute("readonly", true); 
    insc_fim.setAttribute("readonly", true);   
    periodo_ini.setAttribute("readonly", true); 
    periodo_fim.setAttribute("readonly", true);      
    data_max_pagamento.setAttribute("readonly", true);  
    $('#tipo option:not(:selected)').attr('disabled', true); 
});