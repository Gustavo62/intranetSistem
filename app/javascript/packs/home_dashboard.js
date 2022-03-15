$(document).ready(function(){  
    dataset = "" 
    function getData(selector) {
        $.ajax({
            type: "get",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').last().attr('content'))},
            url: '/administrador/home/dashboard',
            dataType: 'json',
            data: {},
            async: false,
            success: function(data) {  
                dataset = data;
            }  
        }); 
        return dataset
    };
    getData() 
    var cart_adimplente             = parseInt(dataset['cart_adimplente'])
    var cartorio_cad                = parseInt(dataset['cartorio_cad'])
    var cartorio_cad_c_assoc        = parseInt(dataset['cartorio_cad_c_assoc'])
    var cartorio_cad_c_assoc_ativo  = parseInt(dataset['cartorio_cad_c_assoc_ativo'])
    var cartorios_cad_ok            = parseInt(dataset['cartorios_cad_ok'])
    var cartorios_cad_analise       = parseInt(dataset['cartorios_cad_analise'])
    var cartorios_cad_retencao      = parseInt(dataset['cartorios_cad_retencao'])
    var cartorios_cad_s_retencao    = parseInt(dataset['cartorios_cad_s_retencao'])
    var cartorios_c_associado_a     = parseInt(dataset['cartorios_c_associado_a'])
    var cartorios_s_associado_a     = parseInt(dataset['cartorios_s_associado_a'])
    //primeiro chart
    var ctx = document.getElementById('myChart');
    const data1 = {
        labels: [
            'Cadastrados',
            'Em Analise', 
        ],
        datasets: [{
            label: 'Cartórios - 1',
            data: [cartorios_cad_ok,cartorios_cad_analise],
            backgroundColor: [
            '#1e4779',
            '#e7ae00', 
            ],
            hoverOffset: 4
        }]
    };
    const config = {
        type: 'doughnut',
        data: data1,
        options: { 
            title: {
                display: true,
                text: 'Cartórios - Cadastrados X Análise'
            },
            legend: {
                display: true,
                position: 'bottom'
            }, 
            responsive: true,
            animation: {
                animateScale: true,
                animateRotate: true
            }, 
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var meta = dataset._meta[Object.keys(dataset._meta)[0]];
                        var total = meta.total;
                        var currentValue = dataset.data[tooltipItem.index];
                        var percentage = parseFloat((currentValue/total*100).toFixed(1));
                        return currentValue + ' (' + percentage + '%)';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
        }
    };
    var myChart = new Chart(ctx,config);

    
    //segundo chart
    var ctx2 = document.getElementById('myChart2');
    const data2 = {
    labels: [
        'Ativos',
        'Desativados', 
    ],
    datasets: [{
        label: 'Cartórios - 2',
        data: [cartorio_cad - cartorios_s_associado_a,cartorios_c_associado_a],
        backgroundColor: [
        '#1e4779',
        '#e7ae00', 
        ],
        hoverOffset: 4
    }]
    };
    const config2 = {
        type: 'doughnut',
        data: data2,
        options: { 
            title: {
                display: true,
                text: 'Cartórios - Associado Ativo x Sem associado'
            },
            legend: {
                display: true,
                position: 'bottom'
            },  
            responsive: true,
            animation: {
                animateScale: true,
                animateRotate: true
            }, 
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var meta = dataset._meta[Object.keys(dataset._meta)[0]];
                        var total = meta.total;
                        var currentValue = dataset.data[tooltipItem.index];
                        var percentage = parseFloat((currentValue/total*100).toFixed(1));
                        return currentValue + ' (' + percentage + '%)';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
        }
    };
    var myChart2 = new Chart(ctx2,config2);

    
    //terceiro chart
    var ctx3 = document.getElementById('myChart3');
    const data3 = {
    labels: [
        'Cadastrados',
        'Em Analise', 
    ],
    datasets: [{
        label: 'My First Dataset',
        data: [cartorios_cad_ok,cartorios_cad_analise],
        backgroundColor: [
        '#1e4779',
        '#e7ae00', 
        ],
        hoverOffset: 4
    }]
    };
    const config3 = {
        type: 'doughnut',
        data: data3,
        options: { 
            title: {
                display: true,
                text: 'Associados - Adimplentes X Inadimplentes'
            },
            legend: {
                display: true,
                position: 'bottom'
            }, 
            responsive: true,
            animation: {
                animateScale: true,
                animateRotate: true
            }, 
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var meta = dataset._meta[Object.keys(dataset._meta)[0]];
                        var total = meta.total;
                        var currentValue = dataset.data[tooltipItem.index];
                        var percentage = parseFloat((currentValue/total*100).toFixed(1));
                        return currentValue + ' (' + percentage + '%)';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
        }
    };
    var myChart3 = new Chart(ctx3,config3);

    //quarto chart
    var ctx4 = document.getElementById('myChart4');
    const data4 = {
    labels: [
        'Boleto',
        'Retenção', 
    ],
    datasets: [{
        label: 'My First Dataset',
        data: [cartorios_cad_s_retencao,cartorios_cad_retencao],
        backgroundColor: [
        '#1e4779',
        '#e7ae00', 
        ],
        hoverOffset: 4
    }]
    };
    const config4 = {
        type: 'doughnut',
        data: data4,
        options: { 
            title: {
                display: true,
                text: 'Financeiro - Boletos x Retenção TJ'
            },
            legend: {
                display: true,
                position: 'bottom'
            }, 
            responsive: true,
            animation: {
                animateScale: true,
                animateRotate: true
            }, 
            tooltips: {
                callbacks: {
                    label: function(tooltipItem, data) {
                        var dataset = data.datasets[tooltipItem.datasetIndex];
                        var meta = dataset._meta[Object.keys(dataset._meta)[0]];
                        var total = meta.total;
                        var currentValue = dataset.data[tooltipItem.index];
                        var percentage = parseFloat((currentValue/total*100).toFixed(1));
                        return currentValue + ' (' + percentage + '%)';
                    },
                    title: function(tooltipItem, data) {
                        return data.labels[tooltipItem[0].index];
                    }
                }
            },
        }
    };
    var myChart4 = new Chart(ctx4,config4);
    
    
    //top dash
    var text1_injections = cartorio_cad; 
    var text2_injections = cartorio_cad_c_assoc;
    var text3_injections = cart_adimplente;
    var text4_injections = cartorio_cad_c_assoc_ativo;
    function animate(obj, initVal, lastVal, duration) { 
        let startTime = null; 
        let currentTime = Date.now(); 
        const step = (currentTime ) => { 
            if (!startTime) {
                startTime = currentTime ;
            } 
            const progress = Math.min((currentTime  - startTime) / duration, 1); 
            obj.innerHTML = Math.floor(progress * (lastVal - initVal) + initVal); 
            if (progress < 1) {
                window.requestAnimationFrame(step);
            }
            else{
                window.cancelAnimationFrame(window.requestAnimationFrame(step));
            }
        }; 
        window.requestAnimationFrame(step);
    } 
    let text1 = document.getElementById('cartorio_cad');  
    let text2 = document.getElementById('cartorio_cad_c_assoc');  
    let text3 = document.getElementById('cart_adimplente');  
    let text4 = document.getElementById('cartorio_cad_c_assoc_ativo'); 

    const load = () => {
        animate(text1, 0, text1_injections , 3000); 
        animate(text2, 0, text2_injections , 3000); 
        animate(text3, 0, text3_injections , 3000); 
        animate(text4, 0, text4_injections , 3000); 
    }
    load(); 

});