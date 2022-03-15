$(document).ready(function(){ 
    var cart_form = document.getElementById("intranet_associado_intranet_cartorio")
    var func_form = document.getElementById("intranet_associado_funcao"); 
    cart_form.classList.add("form-control");
    func_form.classList.add("form-control");
    $("form").bind("keypress", function (e) {
    if (e.keyCode == 13) {
        $("#btnSearch").attr('value');
            //add more buttons here
            return false;
        }
    });
});