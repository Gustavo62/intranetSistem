$(document).ready(function(){
    let btn_se_inscreve     = document.getElementById("se_inscreve"); 
    let assoc_id            = document.getElementById("assoc_id").value; 
    let event_id            = document.getElementById("event_id").value; 
    let cart_id             = document.getElementById("cart_id").value; 
    let form_ok             = false; 
    let recip_name          = document.getElementById("recipient-name");
    let recip_name_cracha   = document.getElementById("recipient-name-cracha");
    let recip_telefone      = document.getElementById("recipient-telefone");
    let recip_email         = document.getElementById("recipient-email");
    let recip_funcao        = document.getElementById("recipient-funcao");
    let recip_whatsapp      = document.getElementById("recipient-whatsapp");
    let gerar_boleto        = document.getElementById("gerar_boleto");
    let count_form          = 0; 
	IMask(
        document.getElementById("recipient-telefone"),
        {mask:'(00) 0 0000-0000'}
    );  
    function isEmpty(str) {
        return (!str || str.length === 0 );
    }
    function validaFomr() { 
        if(isEmpty(recip_name.value)){
            recip_name.focus();
        }else{
            count_form +=1;
        }
        if(isEmpty(recip_name_cracha.value)){
            recip_name_cracha.focus();
        }else{
            count_form +=1;
        }
        if(isEmpty(recip_telefone.value)){
            recip_telefone.focus();
        }else{
            count_form +=1;
        }
        if(recip_funcao.value  == "Selecione sua profissão"){
            recip_funcao.focus();
        }else{
            count_form +=1;
        } 
        if(isEmpty(recip_email.value)){
            recip_email.focus();
        }else{ 
            count_form +=1;
        }
    }
    btn_se_inscreve.onclick = function () { 
        validaFomr()
        if(count_form == 5){ 
            form_ok = true;
            count_form = 0;
        }else{ 
            form_ok = false;
            count_form = 0;
        }

        if(form_ok){  
            $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: '/intranet/presencs/adicionar/presenca',
            dataType: 'json',
            data: { ingresso_nome: recip_name.value,
                    m_name: "evento",
                    intranet_associado_id: assoc_id,
                    m_id: event_id,
                    cart_id:cart_id,
                    cracha_nome: recip_name_cracha.value,
                    funcao: recip_funcao.value, 
                    telefone: recip_telefone.value,
                    whatsapp: recip_whatsapp.checked,
                    email: recip_email.value,
                },
            success: function(data) {    
                if(data){
                    document.location.reload(true);
                    document.location.reload(true); 
                }else{
                    console.log(count_form)
                    console.log(data)
                }
            }  
            }); 
        }else{ 
            return false
        }
    } 
});