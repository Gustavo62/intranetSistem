class PopularAtividades < ActiveRecord::Migration[6.1]			
    Intranet::Atividade.create(id: "1" ,descricao: "Notas", ativo: true)
    Intranet::Atividade.create(id: "3" ,descricao: "Protesto de Títulos" , ativo: true)
    Intranet::Atividade.create(id: "11",descricao: "Registro Civil das Pessoas Jurídicas" , ativo: true)
    Intranet::Atividade.create(id: "6" ,descricao: "Registro Civil das Pessoas Naturais" , ativo: true)
    Intranet::Atividade.create(id: "2" ,descricao: "Registro de Contratos Marítimos" , ativo: true)
    Intranet::Atividade.create(id: "7" ,descricao: "Registro de Distribuição" , ativo: true)
    Intranet::Atividade.create(id: "4" ,descricao: "Registro de Imóveis" , ativo: true)
    Intranet::Atividade.create(id: "9" ,descricao: "Registro de Imóveis e Títulos e Documentos" , ativo: true)
    Intranet::Atividade.create(id: "8" ,descricao: "Registro de Interdições e Tutelas" , ativo: true)
    Intranet::Atividade.create(id: "10",descricao: "Registro de Títulos e Documentos" , ativo: true)
    Intranet::Atividade.create(id: "5" ,descricao: "Registro de Títulos e Documentos e Civis das Pessoas Jurídicas" , ativo: true)
end
