
$(document).ready(function(){
	let pagina;
	let valida_primeira_pagina = 0;
	let valida_segunda_pagina = 0; 
	let valida_terceira_pagina = 0; 
	let senha_validada;
	let dataRetunUserEmail;
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
	let cartId              = document.getElementById("intranet_cartorio_id");
	let assDtNasc			= document.getElementById("ass_data_nascimento");
	let assFunc 			= document.getElementById("ass_funcao");
	let assRg				= document.getElementById("ass_rg");
	let assRgEmissor		= document.getElementById("ass_rg_emissor");
	let assSexo  			= document.getElementById("ass_sexo");
	let assCep 				= document.getElementById("ass_cep");
	let assLogradouro 		= document.getElementById("ass_logradouro");
	let assTel1 			= document.getElementById("ass_telefone_1");
	let assEmail			= document.getElementById("ass_email");
	let assTermoPosse       = document.getElementById("user_termo_posse");
	let assFixaAssinada     = document.getElementById("user_fixa_assinada");
    $('.step').hide();
	$('.mensagem').hide(); 
    $('.step').last().show();
    let passoexibido = function(){
        let index = parseInt($(".step:visible").index());   
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
            $("#next").prop('disabled',true); 
            $("#prev").prop('disabled',false);
			liStatus1.classList.add("active");
			liStatus2.classList.add("active");
			liStatus3.classList.add("active");
			leg1.classList.add("active-leg-1");
			leg2.classList.add("active-leg-2");
			leg3.classList.add("active-leg-3");
			document.getElementById("status").style.width = "100%";
        }else{
            $("#next").prop('disabled',false);            
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
				valida_primeira_pagina++; 
				$("#user_nome_exist").html(""); 
			};
			if(userCpf.value==''){
				userCpf.focus();
				userCpf.style.border= "1px solid #ea2c00"; 
				$("#user_cpf_exist").html("Não pode ficar vazio."); 
			}else{
				userCpf.style.border = "1px solid #ced4da";
				valida_primeira_pagina++; 
				$("#user_cpf_exist").html(""); 
			};
			if(userEmail.value==''){
				userEmail.focus();
				userEmail.style.border= "1px solid #ea2c00"; 
				$("#user_email_exist").html("Não pode ficar vazio."); 
			}else{ 
                if(validateEmail(userEmail.value)){ 
					$.ajax({
						type: "POST",
						beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
						url: '/checkemail?',
						data: 'email=' + userEmail.value,
						success: function(data) {
							dataRetunUserEmail = data.email_exists;
						}
					}); 
					if(dataRetunUserEmail){ 
						userEmail.focus();
						userEmail.style.border= "1px solid #ea2c00";
						$("#user_email_exist").html("Email já está em uso");  
					}else{  
						valida_primeira_pagina++;   
						userEmail.style.border = "1px solid #ced4da";
						$("#user_email_exist").html(""); 
					};  
                }else{  
                    userEmail.focus();
                    userEmail.style.border= "1px solid #ea2c00";  
					$("#user_email_exist").html("Email não é válido."); 
                };
			};
			if(userSenha.value==''){
				userSenha.focus();
				userSenha.style.border= "1px solid #ea2c00";  
				$("#user_senha_exist").html("Não pode ficar vazio."); 
			}else{ 
				if(userSenha.value.length < 6){
					userSenha.focus();
					userSenha.style.border= "1px solid #ea2c00";    
					$("#user_senha_exist").html("No mínimo 6 digitos."); 
				}else{ 
					userSenha.style.border = "1px solid #ced4da";
					valida_primeira_pagina++; 
					$("#user_senha_exist").html(""); 
				};
			};
			if(userSenhaConfirm.value==''){
				userSenhaConfirm.focus();
				userSenhaConfirm.style.border = "1px solid #ea2c00"; 
				$("#user_senha_conf_exist").html("Não pode ficar vazio."); 
			}else{
				userSenhaConfirm.style.border = "1px solid #ced4da";
				valida_primeira_pagina++;  
				$("#user_senha_conf_exist").html(""); 
			};
			if(valida_primeira_pagina <= 4){
				valida_primeira_pagina = 0; 
			};
		}; 
        if(pagina == 2){
            if(assNome.value==''){
				assNome.focus();
				assNome.style.border = "1px solid #ea2c00"; 
				$("#ass_nome_required").html("Não pode ficar vazio."); 
			}else{
				assNome.style.border = "1px solid #ced4da";
				$("#ass_nome_required").html(""); 
				valida_segunda_pagina++;
			};    
            if(cartId.value == ''){
				cartId.focus();
				cartId.style.boxShadow = "0px 0px 0px 1px #ea2c00"; 
				$("#ass_cart_id_required").html("Não pode ficar vazio."); 
			}else{ 
				cartId.style.boxShadow = "0px 0px 0px 0px white";
				$("#ass_cart_id_required").html(""); 
				valida_segunda_pagina++;
			};
            if(assDtNasc.value==''){
				assDtNasc.focus();
				assDtNasc.style.border = "1px solid #ea2c00";
				$("#ass_dtn_required").html("Não pode ficar vazio."); 
			}else{
				assDtNasc.style.border = "1px solid #ced4da";
				$("#ass_dtn_required").html(""); 
				valida_segunda_pagina++;
			};
            if(assFunc.value==''){
				assFunc.focus();
				assFunc.style.boxShadow = "0px 0px 0px 1px #ea2c00";
				$("#ass_func_required").html("Não pode ficar vazio."); 
			}else{
				assFunc.style.boxShadow = "0px 0px 0px 0px white";
				$("#ass_func_required").html(""); 
				valida_segunda_pagina++;
			};
            if(assRg.value==''){
				assRg.focus();
				assRg.style.border = "1px solid #ea2c00";
				$("#ass_rg_required").html("Não pode ficar vazio."); 
			}else{
				assRg.style.border = "1px solid #ced4da";
				$("#ass_rg_required").html(""); 
				valida_segunda_pagina++;
			};
            if(assRgEmissor.value==''){
				assRgEmissor.focus();
				assRgEmissor.style.border = "1px solid #ea2c00";
				$("#ass_rg_emissor_required").html("Não pode ficar vazio."); 
			}else{
				assRgEmissor.style.border = "1px solid #ced4da";
				$("#ass_rg_emissor_required").html(""); 
				valida_segunda_pagina++;
			};
            if(assSexo.value==''){
				assSexo.focus();
				assSexo.style.boxShadow = "0px 0px 0px 1px #ea2c00";
				$("#ass_sexo_required").html("Não pode ficar vazio."); 
			}else{
				assSexo.style.boxShadow = "0px 0px 0px 0px white";
				$("#ass_sexo_required").html(""); 
				valida_segunda_pagina++;
			};
            if(assCep.value==''){
				assCep.focus();
				assCep.style.border = "1px solid #ea2c00";
				$("#ass_cep_required").html("Não pode ficar vazio."); 
			}else{
				assCep.style.border = "1px solid #ced4da";
				$("#ass_cep_required").html(""); 
				valida_segunda_pagina++;
			};
            if(assLogradouro.value==''){
				assLogradouro.focus();
				assLogradouro.style.border = "1px solid #ea2c00";
				$("#ass_log_required").html("Não pode ficar vazio."); 
			}else{
				assLogradouro.style.border = "1px solid #ced4da";
				$("#ass_log_required").html(""); 
				valida_segunda_pagina++;
			};
            if(assTel1.value==''){
				assTel1.focus();
				assTel1.style.border = "1px solid #ea2c00";
				$("#ass_tel1_required").html("Não pode ficar vazio."); 
			}else{
				assTel1.style.border = "1px solid #ced4da";
				$("#ass_tel1_required").html(""); 
				valida_segunda_pagina++;
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
					valida_segunda_pagina++;
				}else{  
					assEmail.focus();
					assEmail.style.border = "1px solid #ea2c00"; 
					$("#ass_email_required").html("Email Inválido."); 
				}
				
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
				valida_terceira_pagina++;
			};
			if(assFixaAssinada.value==''){
				assFixaAssinada.focus();
				assFixaAssinada.style.boxShadow = "0px 0px 0px 1px #ea2c00";
				$("#fixa_required").html("Não pode ficar vazio."); 
				assFixaAssinada.style.borderRadius = "6px";
			}else{
				assFixaAssinada.style.boxShadow = "0px 0px 0px 0px white";
				$("#fixa_required").html(""); 
				valida_terceira_pagina++;
			};
			if(document.getElementById("user_rg_photo_1").value==''){
				$("#identidade_required").html("Não pode ficar vazio."); 
				document.getElementById("user_rg_photo_1").focus();
				document.getElementById("user_rg_photo_1").style.boxShadow = "0px 0px 0px 1px #ea2c00";
				document.getElementById("user_rg_photo_1").style.borderRadius = "6px";
			}else{
				document.getElementById("user_rg_photo_1").style.boxShadow = "0px 0px 0px 0px white";
				$("#identidade_required").html(""); 
				valida_terceira_pagina++;
			};
			if(document.getElementById("user_rg_photo_2").value==''){ 
				$("#identidade_required").html("Não pode ficar vazio."); 
				document.getElementById("user_rg_photo_2").focus();
				document.getElementById("user_rg_photo_2").style.boxShadow = "0px 0px 0px 1px #ea2c00";
				document.getElementById("user_rg_photo_2").style.borderRadius = "6px";
			}else{
				document.getElementById("user_rg_photo_2").style.boxShadow = "0px 0px 0px 0px white";
				$("#identidade_required").html(""); 
				valida_terceira_pagina++;
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
            senha_validada = false;
        }else if(userSenha.length < 6){  
            alert(userSenha.length);
            $("#user_senha_exist").html("Senha não pode ficar vazia."); 
            senha_validada = false;
        }else{ 
            senha_validada = true;
        }
    };
    $("#next").click(function(){
		validaPagina();
        if(pagina == 1){
            verificaSenha();   
            if(valida_primeira_pagina == 5 && senha_validada == true){
                $(".step:visible").hide().next().show(); 
                valida_primeira_pagina = 0; 
				passoexibido(); 
            }; 
			valida_primeira_pagina = 0; 
        };
        if(pagina == 2){  
            if(valida_segunda_pagina == 11){ 
                $(".step:visible").hide().next().show(); 
                valida_segunda_pagina = 0; 
				passoexibido();
            } 
			valida_segunda_pagina = 0; 
        };
    });
    $("#prev").click(function(){
        $(".step:visible").hide().prev().show();
        passoexibido();
    });
	$("#enviar").click(function(){ 
		validaPagina();
		if(valida_terceira_pagina == 4){
			return true
		}else{
			valida_terceira_pagina = 0;
			return false
		};
    });
	$(document).on('keyup keypress', 'form input[type="text"]', function(e) {
		if(e.keyCode == 13) {
		  e.preventDefault();
		  return false;
		}
	  }); 
 });
