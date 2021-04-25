$(document).ready(function(){
	let pagina;
	let valida_primeira_pagina = 0;
	let senha_validada;
    $('.step').hide();
	$('.mensagem').hide(); 
    $('.step').first().show();
    var passoexibido = function(){
        var index = parseInt($(".step:visible").index());   
        if(index == 3){
            $("#prev").prop('disabled',true);
        }else if(index == 5){ 
            $("#next").prop('disabled',true); 
            $("#prev").prop('disabled',false);
            
        }else{
            $("#next").prop('disabled',false);            
            $("#prev").prop('disabled',false);
        };
        $("#passo").html(index - 1);
		pagina = index - 1 ;
    };
    passoexibido();
    var validaPagina = function(){ 
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
				document.getElementById("user_email").style.border = "1px solid #ced4da";
				valida_primeira_pagina++;
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
	}; 
    var verificaSenha = function(){
        var user_senha = document.getElementById("user_senha").value;
        var user_senha_confirm = document.getElementById("user_senha_confirm").value;
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
        verificaSenha(); 
        if(pagina == 1){
            if(valida_primeira_pagina == 5 && senha_validada == true){
                $(".step:visible").hide().next().show(); 
                passoexibido(); 
                valida_primeira_pagina = 0;
            };
        };
        if(pagina == 1){
            if(valida_primeira_pagina == 5 && senha_validada == true){
                $(".step:visible").hide().next().show(); 
                passoexibido(); 
                valida_primeira_pagina = 0;
            };
        };
    });
    $("#prev").click(function(){
        $(".step:visible").hide().prev().show();
        passoexibido();
    });
 });