$(document).ready(function(){ 
    var status_form   = null;
    var count_regras  = null;
    var admin_avatar  = document.getElementById("admin_avatar");
    $('.foto_edit_edit').click(function() {
        admin_avatar.click();
    }); 
    admin_avatar.onchange = function(event) {
        var output = document.getElementById('foto_edit');
        output.src = URL.createObjectURL(event.target.files[0]);
        output.onload = function() {
            URL.revokeObjectURL(output.src)
        }
    };
    var cpf                  = document.getElementById("admin_cpf");
    var cpf_errors           = document.getElementById("admin_cpf_errors");
    var password             = document.getElementById("admin_password"); 
    var password_c_errors    = document.getElementById("admin_password_c_errors"); 
    var progress_bar         = document.getElementById("progress-bar");
    var password_confirm     = document.getElementById("admin_password_c"); 
    cpf.onchange = function(){
        if(cpf.value.length == 14){
            $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: '/administrador/operador/novo/admin',
            data: {cpf: cpf.value},
            success: function(data) { 
                if(data == '1'){
                cpf.placeholder      = cpf.value
                cpf.value            = null
                cpf_errors.innerHTML = "CPF já cadastrado" 
                }else{    
                cpf.placeholder      = "Informe o CPF"
                cpf_errors.innerHTML = "" 
                }
            }
            });
        }
    }
    IMask(
        cpf,
        {mask:'000.000.000-00'}
    );
    password.onkeyup =  function(){
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
    password_confirm.onkeyup =  function(){ 
        if(password_confirm.value != password.value){
            password_c_errors.innerHTML = "As senhas não coincidem"  
        }else{
            password_c_errors.innerHTML = ""   
        }
    };
});