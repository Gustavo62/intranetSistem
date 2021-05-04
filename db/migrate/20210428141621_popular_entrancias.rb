class PopularEntrancias < ActiveRecord::Migration[6.1]
  Intranet::Entrancium.create(id: 20,descricao: "INICIAL", ativo: true)
  Intranet::Entrancium.create(id: 31,descricao: "INTERMEDIÁRIA", ativo: true)
  Intranet::Entrancium.create(id: 124,descricao: "FINAL", ativo: true)
end
