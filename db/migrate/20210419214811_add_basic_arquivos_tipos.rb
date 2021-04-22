class AddBasicArquivosTipos < ActiveRecord::Migration[6.1] 
  Intranet::ArquivosTipo.create(descricao: 'Altas', ativo:true)
  Intranet::ArquivosTipo.create(descricao: 'Balanços', ativo:true)
  Intranet::ArquivosTipo.create(descricao: 'Documentos Diversos', ativo:true)
  Intranet::ArquivosTipo.create(descricao: 'Ofícios', ativo:true)
end
