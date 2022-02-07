class AddDepartamento < ActiveRecord::Migration[6.1]
  Intranet::Departamento.create(descricao: 'Financeiro', ativo:true) 
  Intranet::Departamento.create(descricao: 'Cerice', ativo:true) 
  Intranet::Departamento.create(descricao: 'Jurídico', ativo:true) 
  Intranet::Departamento.create(descricao: 'Suporte', ativo:true)  
end
