$(document).ready(function(){   
    IMask(
        document.getElementById("intranet_tabeliao_rg"),
        {mask:'00.000.000-00'}
    ); 
    IMask(
        document.getElementById("intranet_tabeliao_telefone"),
        {mask:'(00) 0 0000-0000'}
    );  
    IMask(
        document.getElementById("intranet_tabeliao_cpf"),
        {mask:'000.000.000-00'}
    );
    var submit    = document.getElementById("subform"); 
    var cart_form = document.getElementById("intranet_tabeliao_intranet_cartorio_id");  
    cart_form.classList.add("form-control"); 
    var id_tab    = document.getElementById("id_tab");  
    $('#modalClose').on('click', function () {
        $('#modal').hide();
    })
    cart_form.onchange = function (){
        $.ajax({
        type: "get",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url: "/intranet/tabeliaos/consultar/cartorios/" + id_tab.value,
        data: {cart_id: cart_form.value},
        success: function(data) {   
            if(data == false){  
                $('#modal').fadeIn()
                    cart_form.classList.add("form-control");
                    submit.onclick = function(){
                    return false;
                }; 
                for(var i = 0; i < cart_form.options.length;i++){  
                    cart_form.options[i].selected=false; 
                }
                }else{   
                    submit.classList.remove("disabled");
                    submit.onclick = function(){
                    return true;
                };   
            }
        }
        });
    }
});