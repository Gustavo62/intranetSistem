document.addEventListener('keydown', function(event) { //pega o evento de precionar uma tecla
  if(event.keyCode != 46 && event.keyCode != 8){//verifica se a tecla precionada nao e um backspace e delete
    var i = document.getElementById("user_cpf").value.length; //aqui pega o tamanho do input
    if (i === 3 || i === 7) //aqui faz a divisoes colocando um ponto no terceiro e setimo indice
      document.getElementById("user_cpf").value = document.getElementById("user_cpf").value + ".";
    else if (i === 11) //aqui faz a divisao colocando o tracinho no decimo primeiro indice
      document.getElementById("user_cpf").value = document.getElementById("user_cpf").value + "-";
  };
});