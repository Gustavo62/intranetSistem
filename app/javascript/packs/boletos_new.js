$(document).ready(function(){   
    var cartorio_select  = document.getElementById("intranet_boleto_intranet_cartorio_id");
    var associado_select = document.getElementById("intranet_boleto_intranet_associado_id");
    var associado_box    = document.getElementById("associadoSelect");
    cartorio_select.onchange = function(){ 
        $("#intranet_boleto_intranet_associado_id").empty();
        $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: '/intranet/boletos/atualizar/associados',
            dataType: 'json',
            data: {cart_id: cartorio_select.value},
            success: function(data) {   
                let response = String(data).split(","); 
                if (data){
                    associado_box.style.display = 'block';
                    associado_select.options[associado_select.options.length] = new Option(response[1],response[0]); 
                    associado_select.disabled = true;
                }
            }  
        }); 
    }  
});