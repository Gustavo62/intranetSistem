$(document).ready(function(){
    var progress_bar          = document.getElementById("progress-bar");
	var user_password         = document.getElementById("user_password")
	var user_password_confirm = document.getElementById("user_password_confirmation")
  	var password_c_errors     = document.getElementById("user_password_c_errors");  
  	var user_avatar           = document.getElementById("user_avatar"); 

	$('.foto_edit_edit').click(function() {
		user_avatar.click();
	});
	user_avatar.onchange = function(event) {
		var output = document.getElementById('foto_edit');
		output.src = URL.createObjectURL(event.target.files[0]);
		output.onload = function() {
		URL.revokeObjectURL(output.src) // free memory
		}
	}; 
	user_password.onkeyup =  function(){
		user_password_confirm.value = ""
		password_c_errors.innerHTML = ""   
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
		if(user_password.value.length != 0 ){
			user_password_confirm.required = true
		}else{ 
			user_password_confirm.value    = ""
			user_password_confirm.required = false  
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
	    user_password_confirm.onkeyup =  function(){ 
		if(user_password_confirm.value.length != 0){ 
			if(user_password_confirm.value != user_password.value){
				password_c_errors.innerHTML = "As senhas não coincidem"  
			}else{
				password_c_errors.innerHTML = ""   
			}
		}else{ 
			password_c_errors.innerHTML = ""   
		}
	}; 
});