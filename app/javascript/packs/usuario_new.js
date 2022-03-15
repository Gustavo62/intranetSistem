$(document).ready(function(){
    $('.alert1').hide()
    var bloco_cart           = document.getElementById("bloco_cart");
    var cpf                  = document.getElementById("user_cpf");
    var senha                = document.getElementById("user_password");
    var select_cart          = document.getElementById("intranet_cartorio_id"); 
    var valida               = document.getElementById("valida");
    var login                = document.getElementById("login");
    let cpf_aux = ""
    cpf.value = '';  
    IMask(
        document.getElementById("user_cpf"),
        {mask:'000.000.000-00'}
    );  
    $('.alert1').hide() 
    $('#intranet_cartorio_id').empty();
    bloco_cart.style.display = "none" 

    valida.onclick = function(){  
        $('#intranet_cartorio_id').empty();
        $("#loading").fadeIn();  
        cpf_aux = cpf.value.replace(/[^0-9]/g, '')  
        $.ajax({
        type: "get",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url: '/consulta/cart',
        data: {cpf: cpf_aux},
        success: function(data) {   
            if(data.length > 0){
                bloco_cart.style.display = "block" 
                $.each( data, function( key, value ) { 
                    select_cart.options[select_cart.options.length] = new Option(value[1],value[0]); 
                });
                $("#exampleModal1").modal('show'); 
            }else{ 
                cpf.value = '';
                senha.value = '';
                $('.alert1').fadeIn();
                $("#exampleModal1").modal('hide'); 
            }
            $("#loading").fadeOut(500); 
        },
        error: function(error) { 
            $("#loading").fadeOut(500); 
        }
        });
    }
    login.onclick = function(){ 
        cpf.value = cpf_aux 
    }
});

$(document).on('keyup keypress', 'form input[type="text"]', function(e) {
    if(e.keyCode == 13) {
    e.preventDefault();
    return false;
    }
});  