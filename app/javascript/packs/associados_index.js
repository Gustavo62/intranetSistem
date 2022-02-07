$(document).ready(function(){
    var serv_form   = document.getElementById("intranet_cartorio_id"); 
	var cidade_form = document.getElementById("cidade"); 
	var acesso_form = document.getElementById("acesso");
	var situa_form  = document.getElementById("situa__o"); 
	if(serv_form){ 
		serv_form.classList.add("form-control"); 
	}  
	if(cidade_form){ 
		cidade_form.classList.add("form-control"); 
	}
	if(acesso_form){ 
		acesso_form.classList.add("form-control"); 
	} 
	if(situa_form){ 
		situa_form.classList.add("form-control"); 
	} 
}); 