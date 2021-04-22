class AddBasicAtividades < ActiveRecord::Migration[6.1] 
  Intranet::Atividade.create(descricao: 'Distribuição de Protestos e Escrituras. e Atos', ativo:true)
  Intranet::Atividade.create(descricao: 'Distrito', ativo:true)
  Intranet::Atividade.create(descricao: 'Notas', ativo:true)
  Intranet::Atividade.create(descricao: 'Protestos e Títulos', ativo:true)
  Intranet::Atividade.create(descricao: 'Registro Civil das Pessoas Naturais', ativo:true)
  Intranet::Atividade.create(descricao: 'Registro de Imóveis', ativo:true)
  Intranet::Atividade.create(descricao: 'Registro de Interdições e Tutelas', ativo:true)
  Intranet::Atividade.create(descricao: 'Registro de Titulos, Documentos e Pessoa Jurídica', ativo:true)
end
