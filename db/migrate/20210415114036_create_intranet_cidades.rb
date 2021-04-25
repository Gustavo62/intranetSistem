class CreateIntranetCidades < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_cidades do |t|
      t.string :municipio
      t.string :estado
      t.integer    :cod_ibge
      t.timestamps
    end
  end
end
