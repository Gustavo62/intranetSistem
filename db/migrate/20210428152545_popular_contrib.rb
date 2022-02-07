class PopularContrib < ActiveRecord::Migration[6.1] 
  Intranet::Contribuicao.create(descricao: "GRUPO 01", ativo: true, valor_base:0.0)
  Intranet::Contribuicao.create(descricao: "GRUPO 02", ativo: true, valor_base:400.0)
  Intranet::Contribuicao.create(descricao: "GRUPO 03", ativo: true, valor_base:150.0)
  Intranet::Contribuicao.create(descricao: "GRUPO 04", ativo: true, valor_base:300.0)
  Intranet::Contribuicao.create(descricao: "GRUPO 05", ativo: true, valor_base:100.0)
  Intranet::Contribuicao.create(descricao: "GRUPO 06", ativo: true, valor_base:70.0)
  Intranet::Contribuicao.create(descricao: "GRUPO 07", ativo: true, valor_base:50.0)
  Intranet::Contribuicao.create(descricao: "GRUPO 08", ativo: true, valor_base:0.0)
end
