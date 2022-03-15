$(document).ready(function(){ 
    IMask(
        document.getElementById("intranet_associado_data_nascimento"),
        {mask:'00/00'}
    );
	IMask(
        document.getElementById("intranet_associado_telefone_1"),
        {mask:'(00) 0 0000-0000'}
    );
	IMask(
        document.getElementById("intranet_associado_telefone_2"),
        {mask:'(00) 0 0000-0000'}
    );
	IMask(
        document.getElementById("intranet_associado_celular"),
        {mask:'(00) 0 0000-0000'}
    );  
    function dadoAcessoMenu(){  
        document.getElementById("btn_menu_1").classList.add("active");
        document.getElementById("btn_menu_2").classList.remove("active");  
        
        $("#dados_acesso").fadeIn(); 
        $("#dados_para_contato").hide(); 
        $("#dados_pessoais").hide(); 
        $("#dados_financeiro").hide(); 
    }  
    $("#btn_menu_1").on("click", function(){
        dadoAcessoMenu(); 
    });
    $("#btn_menu_2").on("click", function(){
        dadoContatoMenu(); 
    });
    function dadoContatoMenu(){  
        document.getElementById("btn_menu_1").classList.remove("active");
        document.getElementById("btn_menu_2").classList.add("active");  

        $("#dados_acesso").hide(); 
        $("#dados_para_contato").fadeIn(); 
        $("#dados_pessoais").hide(); 
        $("#dados_financeiro").hide(); 
    };   
    dadoAcessoMenu()
});