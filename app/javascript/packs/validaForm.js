$(document).ready(function() {
    let response = {};
    let content_cart_info_resumo        =  document.getElementById("content_cart_info_resumo");
    let box_termos_poses                =  document.getElementById("box_termos_poses");
    let pagina;
    let valida_primeira_pagina 			= 0;
    let valida_segunda_pagina  			= 0; 
    let valida_terceira_pagina 			= 0; 
    let valida_primeira_pagina_cpf 		= 0;
    let valida_primeira_pagina_email	= 0;
    let dia_p                           = ['0','1','2','3']
    let dia_s                           = ['0','1','2','3','4','5','6','7','8','9']
    let mes_p                           = ['0','1']
    let mes_s                           = ['0','1','2']
    let mes_t                           = ['0','1','2','3','4','5','6','7','8','9']
    let senha_validada                  = false;
    let dataRetunUserEmail;
    let password_c_errors   = document.getElementById("admin_password_c_errors"); 
    let progress_bar        = document.getElementById("progress-bar");
    let liStatus1 			= document.getElementById("li-status-1");
    let liStatus2 			= document.getElementById("li-status-2");
    let liStatus3 			= document.getElementById("li-status-3");
    let leg1        		= document.getElementById("leg-1");
    let leg2        		= document.getElementById("leg-2");
    let leg3        		= document.getElementById("leg-3");
    let userNome    		= document.getElementById("user_nome");
    let userCpf     		= document.getElementById("user_cpf");
    let userEmail   		= document.getElementById("user_email");
    let userSenha   		= document.getElementById("user_senha");
    let userSenhaConfirm 	= document.getElementById("user_senha_confirm");
    let assNome         	= document.getElementById("ass_nome");
    let cartId              = document.getElementById("intranet_cartorio");
    let assDtNasc			= document.getElementById("ass_data_nascimento");
    let assFunc 			= document.getElementById("ass_funcao");
    let funcBox             = document.getElementById("intranet_funcao_box"); 
    let assSubs 			= document.getElementById("ass_substituto");
    let assRg				= document.getElementById("ass_rg"); 
    let assCep 				= document.getElementById("ass_cep");
    let assLogradouro 		= document.getElementById("ass_logradouro");
    let assTel1 			= document.getElementById("ass_telefone_1");
    let assTel2             = document.getElementById("ass_telefone_2")
    let assEmail			= document.getElementById("ass_email");
    let assTermoPosse       = document.getElementById("user_termo_posse"); 
    let dados_cart          = false  
    assFunc.classList.add("form-control");
    cartId.classList.add("form-control");  
    IMask(
        assDtNasc,
        {mask:'00/00'}
    );
    IMask(
        assTel1,
        {mask:'(00) 0 0000-0000'}
    );
    IMask(
        assTel2,
        {mask:'(00) 0 0000-0000'}
    ); 
    IMask(
        assRg,
        {mask:'000.000.000.00'}
    );  
    IMask(
        assCep,
        {mask:'00000-000'}
    ); 
    $('.step').hide();
    $('.mensagem').hide();
    $('.step').first().show();
    userCpf.onkeyup = function(){ 
        if(userCpf.value.length  >= 9){ 
            $.ajax({
                type: "get",
                beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
                url: '/consulta/user',
                data: {cpf: userCpf.value},
                success: function(data) {   
                    if(data == 0){
                        if(valida_primeira_pagina_cpf == 0){   
                            if(valida_primeira_pagina_cpf == 0){ 
                                valida_primeira_pagina_cpf+=1;
                            }
                            userCpf.style.border = "1px solid #ced4da"; 
                            $("#user_cpf_exist").html(""); 
                        }
                    }else{
                        userCpf.focus();
                        userCpf.style.border= "1px solid #ea2c00"; 
                        $("#user_cpf_exist").html("Este cpf já está cadastrado."); 
                        userCpf.value = null;
                        valida_primeira_pagina_cpf = 0;
                    } 
                }
            });
        } 
    } 
    userEmail.onchange = function(){  
        $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: '/checkemail?',
            data: 'email=' + userEmail.value,
            success: function(data) {  
                if(data.email_exists){ 
                    userEmail.focus();
                    userEmail.style.border= "1px solid #ea2c00";
                    $("#user_email_exist").html("Email já está em uso");  
                    userEmail.value = null;
                    valida_primeira_pagina_email = 0;
                }else{      
                    if(valida_primeira_pagina_email == 0){ 
                        valida_primeira_pagina_email+=1;
                    }
                    userEmail.style.border = "1px solid #ced4da";
                    $("#user_email_exist").html("");  
                };  
            }
        });  
    }  
    assDtNasc.onkeypress = function(event){ 

        if(assDtNasc.value.length == 0){  
            if(dia_p.includes(event.key) == false){ 
                return false
            }
        } 
        if(assDtNasc.value.length == 1){  
            if(assDtNasc.value.slice(-1) == 3)
                if(event.key != 1){ 
                    return false
                } 
        } 
        if(assDtNasc.value.length == 2){  
            if(mes_p.includes(event.key) == false){ 
                return false
            } 
        }
        if(assDtNasc.value.length == 3){  
            if(mes_p.includes(event.key) == false){ 
                return false
            } 
        }
        if(assDtNasc.value.length == 4){  
            if(assDtNasc.value.slice(-1) == 1){ 
                if(mes_s.includes(event.key) == false){ 
                    return false
                } 
            }else{ 
                if(mes_t.includes(event.key) == false){ 
                    return false
                } 
            }
        }
    }   
    assSubs.onchange =  function(){ 
        if(assSubs.value == 'sim'){
            $("#intranet_funcao_box").hide() 
        }else if(assSubs.value == 'não'){ 
            $("#intranet_funcao_box").show() 
        } 
    }
    user_senha.onkeyup  =  function(){
        let txt =$(this).val();
        let forca = 0;

        if(txt.length > 5) {
            forca += 25;
        } 

        var reg = new RegExp(/[a-z]/i);
        if(reg.test(txt)){
            forca += 25;
        }

        var reg = new RegExp(/[0-9]/i);
        if(reg.test(txt)){
            forca += 25;
        }

        var reg = new RegExp(/[^a-z0-9]/i);
        if(reg.test(txt)){
            forca += 25;
        }
        mostrarForca(forca);
    };
    function mostrarForca(forca){ 
        if(forca == 0 ){
            progress_bar.style.width = "0%"
            progress_bar.style.backgroundColor = "#ff0052"
        } 
        if(forca > 20 && forca < 45  ){
            progress_bar.style.width = "25%"
            progress_bar.style.backgroundColor = "#ff6a00"
        } 
        if(forca > 45 && forca < 70){
            progress_bar.style.width = "50%"
            progress_bar.style.backgroundColor = "#ebcb2f"
        } 
        if(forca > 70  && forca < 95){
            progress_bar.style.width = "75%"
            progress_bar.style.backgroundColor = "#4bd71d"
        } 
        if(forca > 95){
            progress_bar.style.width = "100%"
            progress_bar.style.backgroundColor = "#007bff"
        } 
    }
    user_senha_confirm.onkeyup =  function(){ 
        if(user_senha_confirm.value != user_senha.value){
            password_c_errors.innerHTML = "As senhas não coincidem"  
        }else{
            password_c_errors.innerHTML = ""   
        }
    };
    let passoexibido = function(){
        let index = parseInt($(".step:visible").index()) + 1;   
        if(index == 1){
            $("#prev").prop('disabled',true); 
            liStatus1.classList.add("active");
            liStatus2.classList.remove("active");
            liStatus3.classList.remove("active");
            leg1.classList.add("active-leg-1");
            leg2.classList.remove("active-leg-2");
            leg3.classList.remove("active-leg-3");
            document.getElementById("status").style.width = "0%";
        }else if(index == 3){  
            document.getElementById("next").style.display = "none";
            $("#prev").prop('disabled',false);
            liStatus1.classList.add("active");
            liStatus2.classList.add("active");
            liStatus3.classList.add("active");
            leg1.classList.add("active-leg-1");
            leg2.classList.add("active-leg-2");
            leg3.classList.add("active-leg-3");
            document.getElementById("status").style.width = "100%";
        }else{ 
            document.getElementById("next").style.display = "block";          
            $("#prev").prop('disabled',false);
            liStatus1.classList.add("active");
            liStatus2.classList.add("active");
            liStatus3.classList.remove("active");
            leg1.classList.add("active-leg-1");
            leg2.classList.add("active-leg-2");
            leg3.classList.remove("active-leg-3");
            document.getElementById("status").style.width = "50%";
        };
        $("#passo").html(index);  
        pagina = index;
    };
    passoexibido(); 
    function validateEmail(email) {
        const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    };
    let validaPagina = function(){ 
        if(pagina == 1){   
            if(userNome.value==''){
                userNome.focus();
                userNome.style.border = "1px solid #ea2c00";
                $("#user_nome_exist").html("Não pode ficar vazio."); 
            }else{
                userNome.style.border = "1px solid #ced4da";
                valida_primeira_pagina+=1; 
                $("#user_nome_exist").html(""); 
            }; 
            if(userCpf.value==''){
                userCpf.focus();
                userCpf.style.border= "1px solid #ea2c00"; 
                $("#user_cpf_exist").html("Não pode ficar vazio."); 
            }else{
                userCpf.style.border = "1px solid #ced4da";
                valida_primeira_pagina+=1; 
                $("#user_cpf_exist").html(""); 
            };

            if(userEmail.value==''){
                userEmail.focus();
                userEmail.style.border= "1px solid #ea2c00"; 
                $("#user_email_exist").html("Não pode ficar vazio."); 
            }else{ 
                valida_primeira_pagina+=1; 
            }

            if(userSenha.value==''){
                userSenha.focus();
                userSenha.style.border= "1px solid #ea2c00";  
                $("#user_senha_exist").html("Não pode ficar vazio."); 
            }else{ 
                if(userSenha.value.length < 6){
                    userSenha.focus();
                    userSenha.style.border= "1px solid #ea2c00";    
                    $("#user_senha_exist").html("No mínimo 6 digitos."); 
                    progress_bar.style.width = "0%"
                    progress_bar.style.backgroundColor = "#ff0052"
                }else{ 
                    userSenha.style.border = "1px solid #ced4da";
                    valida_primeira_pagina+=1; 
                    $("#user_senha_exist").html(""); 
                };
            };

            if(userSenhaConfirm.value==''){
                userSenhaConfirm.focus();
                userSenhaConfirm.style.border = "1px solid #ea2c00"; 
                $("#user_senha_conf_exist").html("Não pode ficar vazio."); 
                progress_bar.style.width = "0%"
                progress_bar.style.backgroundColor = "#ff0052"
            }else{
                userSenhaConfirm.style.border = "1px solid #ced4da";
                valida_primeira_pagina+=1;  
                $("#user_senha_conf_exist").html(""); 
            };

            if(valida_primeira_pagina <= 4){
                valida_primeira_pagina = 0; 
            };
        }; 
        if(pagina == 2){ 
            if(assSubs.value == ''){ 
            }else{ 
                
            }
            if(assNome.value==''){
                assNome.focus();
                assNome.style.border = "1px solid #ea2c00"; 
                $("#ass_nome_required").html("Não pode ficar vazio."); 
            }else{
                assNome.style.border = "1px solid #ced4da";
                $("#ass_nome_required").html(""); 
                valida_segunda_pagina+=1;
            };
            if(assSubs.value != ''){
                assSubs.style.border = "1px solid #ced4da";
                $("#ass_subs_required").html(""); 
                if(assSubs.value == 'não'){
                    if(assFunc.value==''){
                        assFunc.focus();
                        assFunc.style.boxShadow = "0px 0px 0px 1px #ea2c00";
                        $("#ass_func_required").html("Não pode ficar vazio."); 
                    }else{
                        assFunc.style.boxShadow = "0px 0px 0px 0px white";
                        $("#ass_func_required").html(""); 
                        valida_segunda_pagina+=1;
                    };
                }else{ 
                    valida_segunda_pagina+=1;
                }
                
            }else{ 
                assSubs.focus();
                assSubs.style.border = "1px solid #ea2c00"; 
                $("#ass_subs_required").html("Não pode ficar vazio."); 
            }
            if(assCep.value==''){
                assCep.focus();
                assCep.style.border = "1px solid #ea2c00";
                $("#ass_cep_required").html("Não pode ficar vazio."); 
            }else{
                assCep.style.border = "1px solid #ced4da";
                $("#ass_cep_required").html(""); 
                valida_segunda_pagina+=1;
            };
            if(assLogradouro.value==''){
                assLogradouro.focus();
                assLogradouro.style.border = "1px solid #ea2c00";
                $("#ass_log_required").html("Não pode ficar vazio."); 
            }else{
                assLogradouro.style.border = "1px solid #ced4da";
                $("#ass_log_required").html(""); 
                valida_segunda_pagina+=1;
            };
            if(assTel1.value==''){
                assTel1.focus();
                assTel1.style.border = "1px solid #ea2c00";
                $("#ass_tel1_required").html("Não pode ficar vazio."); 
            }else{
                assTel1.style.border = "1px solid #ced4da";
                $("#ass_tel1_required").html(""); 
                valida_segunda_pagina+=1;
            };
            if(assEmail.value==''){
                assEmail.focus();
                assEmail.style.border = "1px solid #ea2c00";
                $("#ass_email_required").html("Não pode ficar vazio."); 
            }else{
                var re = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                var emailFormat = re.test(assEmail.value);
                if (emailFormat) {
                    assEmail.style.border = "1px solid #ced4da";
                    $("#ass_email_required").html(""); 
                    valida_segunda_pagina+=1;
                }else{  
                    assEmail.focus();
                    assEmail.style.border = "1px solid #ea2c00"; 
                    $("#ass_email_required").html("Email Inválido."); 
                };
            }; 
            let selected = [...cartId.options]
            .filter(option => option.selected)
            .map(option => option.value); 
            let indice = selected.indexOf('')
            while(indice >= 0){
                selected.splice(indice, 1);
                indice = selected.indexOf('');
            } 
            if(selected.length > 0){
                cartId.style.border = "1px solid #ced4da";
                $("#ass_cart_id_required").html(""); 
                valida_segunda_pagina+=1;  
            }else{ 
                cartId.focus();
                cartId.style.border = "1px solid #ea2c00";
                $("#ass_cart_id_required").html("Não pode ficar vazio."); 
            } 
            assEmail.value=='' 
            if(valida_segunda_pagina <= 5){
                valida_segunda_pagina = 0; 
            };
        };
        if(pagina == 3){
            if(assTermoPosse.value==''){
                assTermoPosse.focus(); 
                $("#termo_required").html("Não pode ficar vazio."); 
                assTermoPosse.style.boxShadow = "0px 0px 0px 1px #ea2c00";
                assTermoPosse.style.borderRadius = "6px";
            }else{
                assTermoPosse.style.boxShadow = "0px 0px 0px 0px white";
                $("#termo_required").html(""); 
                valida_terceira_pagina+=1;
            };
        };
    }; 
    let verificaSenha = function(){
        let user_senha = userSenha.value;
        let user_senha_confirm = userSenhaConfirm.value;
        if (user_senha != user_senha_confirm){
            document.getElementById('user_senha').value='';
            document.getElementById('user_senha_confirm').value=''; 
            $("#user_senha_exist").html("As senhas não estão iguais."); 
            progress_bar.style.width = "0%"
            progress_bar.style.backgroundColor = "#ff0052"
            senha_validada = false;
        }else if(user_senha.length < 6){   
            $("#user_senha_exist").html("Senha não pode ficar vazia."); 
            progress_bar.style.width = "0%"
            progress_bar.style.backgroundColor = "#ff0052"
            senha_validada = false;
        }else{ 
            if(user_senha.length < 6 || user_senha == null){ 
                senha_validada = false;
            }else{ 
                senha_validada = true;
            }
        }
    };
    let validaDadosCart = function(){ 
        let conteudo_cards = []
        let selected = [...cartId.options].filter(option => option.selected).map(option => option.value); 
        let indice = selected.indexOf('')
        while(indice >= 0){
            selected.splice(indice, 1);
            indice = selected.indexOf('');
        } 
        response = {};
        $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: '/verifica/dados/cart',
            data: 'ids=' + selected,
            success: function(data) {  
                response = data
                var count = 0
                for( count in response){ 
                    conteudo_cards[count] = `<div class="card shadow bg-white rounded" style="width: 100%;">
                    <div class="card-body">
                        <h5 class="card-title">${data[count][1]}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">mais detalhes</h6>
                        <p class="card-text"> 
                            <div class="form-group row" style="display:flex">
                                <div style="width:100%">
                                    <label  class="col-sm-2 col-form-label" >Nome fantasia</label>
                                    <div class="col-sm-10 correct-md-10" >
                                        <input type="text" readonly class="form-control-plaintext input-show"  value="${data[count][2] || "vazio"}">
                                    </div>
                                </div> 
                            </div>  
                            <div class="form-group row" style="display:flex">
                                <div style="width:100%">
                                    <label  class="col-sm-2 col-form-label" >E-mail</label>
                                    <div class="col-sm-10 correct-md-10" >
                                        <input type="text" readonly class="form-control-plaintext input-show"  value="${data[count][8] || "vazio"}">
                                    </div>
                                </div> 
                            </div>  
                            <div class="form-group row" style="display:flex">
                                <div style="width:100%">
                                    <label  class="col-sm-2 col-form-label" >Endereço</label>
                                    <div class="col-sm-10 correct-md-10" >
                                        <input type="text" readonly class="form-control-plaintext input-show"  value="${data[count][5] || "vazio"}">
                                    </div>
                                </div> 
                            </div>  
                            <div class="form-group row" style="display:flex">
                                <div style="width:49.5%">
                                    <label  class="col-sm-2 col-form-label" >CNPJ</label>
                                    <div class="col-sm-10 correct-md-10" >
                                        <input type="text" readonly class="form-control-plaintext input-show"  value="${data[count][0] || "vazio" }">
                                    </div>
                                </div>
                                <div style="width:49.5%">
                                    <label  class="col-sm-2 col-form-label" >COD TJ</label>
                                    <div class="col-sm-10 correct-md-10" >
                                        <input type="text" readonly class="form-control-plaintext input-show"  value="${data[count][6] || "vazio"}">
                                    </div>
                                </div>
                            </div>   
                            <div class="form-group row" style="display:flex">
                                <div style="width:49.5%">
                                    <label  class="col-sm-2 col-form-label" >Celular</label>
                                    <div class="col-sm-10 correct-md-10" >
                                        <input type="text" readonly class="form-control-plaintext input-show"  value="${data[count][3] || "vazio" }">
                                    </div>
                                </div>
                                <div style="width:49.5%">
                                    <label  class="col-sm-2 col-form-label" >Telefone</label>
                                    <div class="col-sm-10 correct-md-10" >
                                        <input type="text" readonly class="form-control-plaintext input-show"  value="${data[count][4] || "vazio"}">
                                    </div>
                                </div>
                            </div>  
                        </p>
                    </div>
                    </div>`  
                }
                conteudo_cards[data.length] = `
                <div class="alert1 alert-danger" role="alert"> 
                    <h4 class="alert-heading">Caso haja divergências</h4>
                    <p>Entre em contato com a secretaria, para atualizar os dados do cartório, caso haja divergência com os dados o seu cadastro será indeferido.</p>
                    <hr>
                    <p class="mb-0">Telefone (85) 3038-9496 • Whatsapp (85) 9 9863-0065 • Rua Walter Bezerra Sá, 55 - Dionísio Torres</p>
                </div>`  
                content_cart_info_resumo.innerHTML = conteudo_cards.join("<br>");
            }
        });     
        $("#cart_info_resumo").modal('show');
    };
    let listarTermosInput = function(cartorios_ids){
        let inputs = []; 
        var count   = 0; 
        for( count in response){  
            inputs[count] = `<div class="page-header">
                            <h1 style="border-bottom: 1px solid #f8f9fa;margin-top: 3%;font-size: 18px;">${response[count][1]}</h1>      
                        </div>
                        <p>Anexe o documento relacionado a este respectivo cartório.</p>
                        <input style="width: 97%;margin-top: 20px;" type="file" name="user[termo_posse_${response[count][9]}]" required="true" id="user_termo_posse" class="form-control">`  
        } 
        box_termos_poses.innerHTML = inputs.join("<br>");
    }
    $("#next").click(function(){
        validaPagina();
        if(pagina == 1){
            let aux_contagem = 0
            verificaSenha();     
            aux_contagem = valida_primeira_pagina + valida_primeira_pagina_cpf + valida_primeira_pagina_email 
            if(senha_validada == true ){  
                if( aux_contagem == 7){
                    $("#exampleModal2").modal('show')
                    valida_primeira_pagina = 0; 
                }
            };
        };
        if(pagina == 2){    
            if(valida_segunda_pagina == 6 ){ 
                validaDadosCart()    
                valida_segunda_pagina = 0;
            }  
        }; 
    });
    $("#termos_de_uso").click(function(){   
        if(pagina == 1){    
            $("#exampleModal2").modal('hide') 
            $(".step:visible").hide().next().fadeIn();  
            passoexibido(); 
        };
    });
    $("#prosseguir_etapa_2").click(function(){   
        if(pagina == 2){    
            $("#cart_info_resumo").modal('hide');
            $(".step:visible").hide().next().fadeIn();  
            passoexibido();   
            let selected = [...cartId.options]
            .filter(option => option.selected)
            .map(option => option.value); 
            let indice = selected.indexOf('')
            while(indice >= 0){
                selected.splice(indice, 1);
                indice = selected.indexOf('');
            } 
            listarTermosInput(selected)
        };
    });
    $("#prev").click(function(){
        $(".step:visible").hide().prev().fadeIn();
        passoexibido();
    }); 
}); 

$(document).on('keyup keypress', 'form input[type="text"]', function(e) {
    if(e.keyCode == 13) {
    e.preventDefault();
    return false;
    }
});  