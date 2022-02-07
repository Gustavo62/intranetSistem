$(document).ready(function(){
        
    let recip_name = document.getElementById("recipient-name");
    IMask(
        document.getElementById("codigoDeBarras"),
        {mask:'00000.00000 00000.000000 00000.000000 0 00000000000000'}
    );  
    function isEmpty(str) {
        return (!str || str.length === 0 );
    }
    function seInscreve() { 
    if(isEmpty(recip_name.value) == false){  
        $.ajax({
        type: "get",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
        url: '/intranet/adicionar/presenca',
        dataType: 'json',
        data: {ingresso_nome: recip_name.value,m_name: "evento",intranet_associado_id: "<%= @dados_assoc.try(:id) %>",m_id: "<%= @intranet_event.id%>"},
        success: function(data) {    
            if(data){
            document.location.reload(true);
            }
        }  
        }); 
    }else{
        recip_name.focus();
        return false
    }
}
});