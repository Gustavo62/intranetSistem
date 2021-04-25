$(document).ready(function(){
	let pagina;
	let valida_primeira_pagina = 0;
	let erros = []
    $('.step').hide();
	$('.mensagem').hide(); 
    $('.step').first().show();
    var passoexibido = function(){
        var index = parseInt($(".step:visible").index()); 
        if(index == 2){
            $("#prev").hide();
        }else if(index == (parseInt($(".step").length)+1)){
            $("#next").prop('disabled',true);
        }else{
            $("#next").prop('disabled',false);            
            $("#prev").prop('disabled',false);
        }
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
    $("#next").click(function(){
		validaPagina()
		if(valida_primeira_pagina == 5){
			passoexibido(); 
			$(".step:visible").hide().next().show();
			};
    });
    $("#prev").click(function(){
        $(".step:visible").hide().prev().show();
        passoexibido();
    });
 });