class CreateIntranetCidades < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_cidades do |t|
      t.string :descricao
      t.string :estado

      t.timestamps
    end
  end
end
