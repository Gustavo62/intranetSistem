$(document).ready(function(){ 
    var regiao_select        = document.getElementById("regiao_select");
    var entrancia_select     = document.getElementById("entrancia_select");
    var contribuicao_select  = document.getElementById("contribuicaos_select");
    var atividade_select     = document.getElementById("atividade_select");
    var cartorios_select     = document.getElementById("intranet_mala_diretum_intranet_cartorio_id");
  
    var regiao_options       = regiao_select.options;      
    var entrancia_options    = entrancia_select.options;   
    var contribuicao_options = contribuicao_select.options;
    var atividade_options    = atividade_select.options;   
    var cartorios_options    = cartorios_select.options; 
  
    regiao_select.onchange = function (){ 
        atualizaSelect()
    };
    entrancia_select.onchange = function (){ 
        atualizaSelect()
    };
    contribuicao_select.onchange = function (){ 
        atualizaSelect()
    };
    atividade_select.onchange = function (){ 
        atualizaSelect()
    };
    function atualizaSelect(){   
        for(var i = 0; i < cartorios_options.length;i++){  
            cartorios_options[i].selected=false; 
        }
        $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: '/intranet/reunions/consulta/carts',
            data: { regiao:       regiao_options[regiao_select.selectedIndex].value,
                    entrancia:    entrancia_options[entrancia_select.selectedIndex].value,
                    contribuicao: contribuicao_options[contribuicao_select.selectedIndex].value,
                    atividade:    atividade_options[atividade_select.selectedIndex].value},
            success: function(data) {   
            if(data != null){
                for(var i = 0; i < cartorios_options.length;i++){ 
                    if(data.includes(parseInt(cartorios_options[i].value))){ 
                        cartorios_options[i].selected=true;
                    }
                } 
            }else{
                cartorios_options[1].selected=true;
            }
            }
        });
    }
});