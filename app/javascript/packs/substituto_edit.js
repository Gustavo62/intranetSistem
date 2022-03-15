$(document).ready(function(){   
    var submit    = document.getElementById("subform"); 
    var cart_form = document.getElementById("intranet_substituto_intranet_cartorio_id");  
    var id_sub    = document.getElementById("id_sub");  
    cart_form.classList.add("form-control"); 
        $('#modalClose').on('click', function () {
        $('#modal').hide();
    })
    cart_form.onchange = function (){
        $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: "/intranet/substitutos/consultar/cartorios/" + id_sub.value,
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