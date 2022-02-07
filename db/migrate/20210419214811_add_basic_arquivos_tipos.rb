class AddBasicArquivosTipos < ActiveRecord::Migration[6.1] 
  Intranet::ArquivosTipo.create(id:5,descricao: 'Altas', ativo:true)
  Intranet::ArquivosTipo.create(id:6,descricao: 'Balanços', ativo:true)
  Intranet::ArquivosTipo.create(id:7,descricao: 'Documentos Diversos', ativo:true)
  Intranet::ArquivosTipo.create(id:8,descricao: 'Ofícios', ativo:true)
end
