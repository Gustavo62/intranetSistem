$(document).ready(function(){
	let pagina;
	let valida_primeira_pagina = 0;
	let valida_segunda_pagina = 0; 
	let senha_validada;
    $('.step').hide();
	$('.mensagem').hide(); 
    $('.step').first().show();
    let passoexibido = function(){
        let index = parseInt($(".step:visible").index());   
        if(index == 1){
            $("#prev").prop('disabled',true);
        }else if(index == 3){ 
            $("#next").prop('disabled',true); 
            $("#prev").prop('disabled',false);
            
        }else{
            $("#next").prop('disabled',false);            
            $("#prev").prop('disabled',false);
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
			if(document.getElementById("user_nome").value==''){
				document.getElementById("user_nome").focus();
				document.getElementById("user_nome").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("user_nome").style.border = "1px solid #ced4da";
				valida_primeira_pagina++;
			};



			if(document.getElementById("user_cpf").value==''){
				document.getElementById("user_cpf").focus();
				document.getElementById("user_cpf").style.border= "1px solid #ea2c00"; 
			}else{
				document.getElementById("user_cpf").style.border = "1px solid #ced4da";
				valida_primeira_pagina++;
			};


			if(document.getElementById("user_email").value==''){
				document.getElementById("user_email").focus();
				document.getElementById("user_email").style.border= "1px solid #ea2c00";
			}else{
                if(validateEmail(document.getElementById("user_email").value)){
                    document.getElementById("user_email").style.border = "1px solid #ced4da";
                    valida_primeira_pagina++; 
                }else{ 
                    document.getElementById("user_email").focus();
                    document.getElementById("user_email").style.border= "1px solid #ea2c00"; 
                }
			};



			if(document.getElementById("user_senha").value==''){
				document.getElementById("user_senha").focus();
				document.getElementById("user_senha").style.border= "1px solid #ea2c00"; 
			}else{
				document.getElementById("user_senha").style.border = "1px solid #ced4da";
				valida_primeira_pagina++;
			};



			if(document.getElementById("user_senha_confirm").value==''){
				document.getElementById("user_senha_confirm").focus();
				document.getElementById("user_senha_confirm").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("user_senha_confirm").style.border = "1px solid #ced4da";
				valida_primeira_pagina++;
			};
			if(valida_primeira_pagina < 5){
				$('.mensagem').show(); 
				$("#msg").html("Preencha os campos obrigatórios para proseguir"); 
				valida_primeira_pagina = 0; 
			};
		}; 
        if(pagina == 2){
            if(document.getElementById("ass_nome").value==''){
				document.getElementById("ass_nome").focus();
				document.getElementById("ass_nome").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("ass_nome").style.border = "1px solid #ced4da";
				valida_segunda_pagina++;
			};
            //
            if(document.getElementById("intranet_cartorio_id").value==''){
				document.getElementById("intranet_cartorio_id").focus();
				document.getElementById("intranet_cartorio_id").style.boxShadow = "0px 0px 0px 1px #ea2c00";
			}else{
				document.getElementById("intranet_cartorio_id").style.border = "none";
				valida_segunda_pagina++;
			};
            //
            if(document.getElementById("ass_data_nascimento").value==''){
				document.getElementById("ass_data_nascimento").focus();
				document.getElementById("ass_data_nascimento").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("ass_data_nascimento").style.border = "1px solid #ced4da";
				valida_segunda_pagina++;
			};
            //
            if(document.getElementById("ass_funcao").value==''){
				document.getElementById("ass_funcao").focus();
				document.getElementById("ass_funcao").style.boxShadow = "0px 0px 0px 1px #ea2c00";
			}else{
				document.getElementById("ass_funcao").style.boxShadow = "none";
				valida_segunda_pagina++;
			};
            //
            if(document.getElementById("ass_rg").value==''){
				document.getElementById("ass_rg").focus();
				document.getElementById("ass_rg").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("ass_rg").style.border = "1px solid #ced4da";
				valida_segunda_pagina++;
			};
            // 
            if(document.getElementById("ass_rg_emissor").value==''){
				document.getElementById("ass_rg_emissor").focus();
				document.getElementById("ass_rg_emissor").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("ass_rg_emissor").style.border = "1px solid #ced4da";
				valida_segunda_pagina++;
			};
            // 
            if(document.getElementById("ass_sexo").value==''){
				document.getElementById("ass_sexo").focus();
				document.getElementById("ass_sexo").style.boxShadow = "0px 0px 0px 1px #ea2c00";
			}else{
				document.getElementById("ass_sexo").style.border = "none";
				valida_segunda_pagina++;
			};
            // 
            if(document.getElementById("ass_cep").value==''){
				document.getElementById("ass_cep").focus();
				document.getElementById("ass_cep").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("ass_cep").style.border = "1px solid #ced4da";
				valida_segunda_pagina++;
			};
            // 
            if(document.getElementById("ass_logradouro").value==''){
				document.getElementById("ass_logradouro").focus();
				document.getElementById("ass_logradouro").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("ass_logradouro").style.border = "1px solid #ced4da";
				valida_segunda_pagina++;
			};
            // 
            if(document.getElementById("ass_telefone_1").value==''){
				document.getElementById("ass_telefone_1").focus();
				document.getElementById("ass_telefone_1").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("ass_telefone_1").style.border = "1px solid #ced4da";
				valida_segunda_pagina++;
			};
            // 
            if(document.getElementById("ass_email").value==''){
				document.getElementById("ass_email").focus();
				document.getElementById("ass_email").style.border = "1px solid #ea2c00";
			}else{
				document.getElementById("ass_email").style.border = "1px solid #ced4da";
				valida_segunda_pagina++;
			};
        };
	}; 
    let verificaSenha = function(){
        let user_senha = document.getElementById("user_senha").value;
        let user_senha_confirm = document.getElementById("user_senha_confirm").value;
        if (user_senha != user_senha_confirm){
            document.getElementById('user_senha').value='';
            document.getElementById('user_senha_confirm').value='';
            $('.mensagem').show(); 
            $("#msg").html("As senhas não estão iguais"); 
            senha_validada = false;
        }else if(document.getElementById("user_senha").length < 6){  
            alert(document.getElementById("user_senha").length);
            $('.mensagem').show(); 
            $("#msg").html("Preencha os campos obrigatórios para proseguir"); 
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
                passoexibido(); 
                valida_primeira_pagina = 0;
            };
        };
        if(pagina == 2){ 
            passoexibido()
            if(valida_segunda_pagina == 11){
                $(".step:visible").hide().next().show(); ; 
                valida_segunda_pagina = 0;
            }
        };
    });
    $("#prev").click(function(){
        $(".step:visible").hide().prev().show();
        passoexibido();
    });
 });