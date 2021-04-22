class AddPrivilegio < ActiveRecord::Migration[6.1]
  Intranet::Privilegio.create(descricao: 'Administrador', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Cadastros', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Banco de Perguntas', ativo: true)
  Intranet::Privilegio.create(descricao: 'Eventos', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Eventos - Credenciamento', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador de Suporte', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador Financeiro', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador Mala Direta', ativo: true)
  Intranet::Privilegio.create(descricao: 'Operador Serviços', ativo: true)
  Intranet::Privilegio.create(descricao: 'Acesso Total', ativo: true)
end
