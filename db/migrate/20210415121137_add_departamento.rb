class AddDepartamento < ActiveRecord::Migration[6.1]
  Intranet::Departamento.create(descricao: 'Diretoria Executiva', ativo:true)
  Intranet::Departamento.create(descricao: 'Eventos', ativo:true)
  Intranet::Departamento.create(descricao: 'Financeiro', ativo:true)
  Intranet::Departamento.create(descricao: 'Jurídico', ativo:true)
  Intranet::Departamento.create(descricao: 'Suporte DUT', ativo:true)
  Intranet::Departamento.create(descricao: 'Suporte Sisca', ativo:true)
  Intranet::Departamento.create(descricao: 'Todos os Departamentos', ativo:true)
end
