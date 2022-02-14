$(document).ready(function(){
    $('.alert1').hide()
    var bloco_cart           = document.getElementById("bloco_cart");
    var cpf                  = document.getElementById("user_cpf");
    var select_cart          = document.getElementById("intranet_cartorio_id"); 
    cpf.value = null; 
    cpf.onkeyup = function(){ 
        if(cpf.value.length  >= 9){
            $('#intranet_cartorio_id').empty();
            $('.alert1').hide()
            $("#loading").fadeIn(); 
            $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: '/consulta/cart',
            data: {cpf: cpf.value},
            success: function(data) {  
                if(data.length > 0){
                    bloco_cart.style.display = "block" 
                    $.each( data, function( key, value ) { 
                        select_cart.options[select_cart.options.length] = new Option(value[1],value[0]); 
                    });
                }else{ 
                    cpf.value = null;
                    $('.alert1').fadeIn();
                }
                $("#loading").fadeOut(500); 
            }
            });
        }else{ 
            bloco_cart.style.display = "none";
            $('#intranet_cartorio_id').empty();
        }
    } 
});