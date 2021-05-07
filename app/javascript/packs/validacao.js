document.addEventListener('keydown', function(event) { //pega o evento de precionar uma tecla
  if(event.keyCode != 46 && event.keyCode != 8){//verifica se a tecla precionada nao e um backspace e delete
    var i = document.getElementById("user_cpf").value.length; //aqui pega o tamanho do input
    if (i === 3 || i === 7) //aqui faz a divisoes colocando um ponto no terceiro e setimo indice
      document.getElementById("user_cpf").value = document.getElementById("user_cpf").value + ".";
    else if (i === 11) //aqui faz a divisao colocando o tracinho no decimo primeiro indice
      document.getElementById("user_cpf").value = document.getElementById("user_cpf").value + "-";
  }; 
  
});
$(function(){
    $('#ass_rg').keyup(function(){ 
        this.value=this.value.replace(/\D/g,"");
        this.value=this.value.replace(/(\d{2})(\d{3})(\d{3})(\d{1})$/,"$1.$2.$3-$4");
        return this.value;
    });
});
$(function(){
    $('#ass_cep').keyup(function(){ 
        this.value=this.value.replace(/\D/g,"");
        this.value=this.value.replace(/^(\d{5})(\d)/,"$1-$2") 
        return this.value;
    });
});
//  $("#telefone").mask("(99) 9999-9999"); 
//  $("#cep").mask("99999-999");   
//  $("#data").mask("99/99/9999");  
//  $("#cnpj").mask("99.999.999/9999-99");  
//  $('#rg').mask('99.999.999-9');  
//  $('#agencia').mask('9999-9'); 
//  $('#conta').mask('99.999-9');