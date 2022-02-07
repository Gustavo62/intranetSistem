$(document).ready(function(){
    if(document.getElementById("intranet_associado_telefone_1").val != undefined){    
        IMask(
            document.getElementById("intranet_associado_telefone_1"),
            {mask:'(00) 0 0000-0000'}
        );
    }
    if(document.getElementById("intranet_associado_telefone_2").val != undefined){ 
        IMask(
            document.getElementById("intranet_associado_telefone_2"),
            {mask:'(00) 0 0000-0000'}
        );
    } 
    if(document.getElementById("intranet_associado_celular").val != undefined){ 
        IMask(
            document.getElementById("intranet_associado_celular"),
            {mask:'(00) 0 0000-0000'}
        ); 
    }
    function dadoAcessoMenu(){  
        document.getElementById("btn_menu_1").classList.add("active");
        document.getElementById("btn_menu_2").classList.remove("active"); 
        document.getElementById("btn_menu_4").classList.remove("active");
        
        $("#dados_acesso").fadeIn(); 
        $("#dados_para_contato").hide(); 
        $("#dados_pessoais").hide(); 
        $("#dados_financeiro").hide(); 
    }
    function dadoContatoMenu(){  
        document.getElementById("btn_menu_1").classList.remove("active");
        document.getElementById("btn_menu_2").classList.add("active"); 
        document.getElementById("btn_menu_4").classList.remove("active");

        $("#dados_acesso").hide(); 
        $("#dados_para_contato").fadeIn(); 
        $("#dados_pessoais").hide(); 
        $("#dados_financeiro").hide(); 
    };  
    function dadoFinanceiroMenu(){ 
        document.getElementById("btn_menu_1").classList.remove("active");
        document.getElementById("btn_menu_2").classList.remove("active"); 
        document.getElementById("btn_menu_4").classList.add("active");

        $("#dados_acesso").hide(); 
        $("#dados_para_contato").hide(); 
        $("#dados_pessoais").hide(); 
        $("#dados_financeiro").fadeIn(); 
    };   
    dadoAcessoMenu()
    
    $("#btn_menu_1").on("click", function(){
        dadoAcessoMenu(); 
    });
    $("#btn_menu_2").on("click", function(){
        dadoContatoMenu(); 
    });
    $("#btn_menu_4").on("click", function(){
        dadoFinanceiroMenu(); 
    });
}); 