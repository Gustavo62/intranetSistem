class AddPrivilegio < ActiveRecord::Migration[6.1]
  Intranet::Privilegio.create(descricao: 'Operador Developer', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Avisos', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Eventos', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Arquivos', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Reuniões', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Perguntas', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Financeiro', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Mala Direta', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Cartórios', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador do Sistema', ativo: true)
end
