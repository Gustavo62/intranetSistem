
$(document).ready(function(){  
    admin_avatar = document.getElementById("admin_avatar"); 
    $('.foto_edit_edit').click(function() {
        admin_avatar.click();
    });

    admin_avatar.onchange = function(event) {
        var output = document.getElementById('foto_edit');
        output.src = URL.createObjectURL(event.target.files[0]);
        output.onload = function() {
            URL.revokeObjectURL(output.src) // free memory
        }
    };
});