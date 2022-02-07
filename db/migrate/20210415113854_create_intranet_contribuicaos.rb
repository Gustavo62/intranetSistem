class CreateIntranetContribuicaos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_contribuicaos do |t|
      t.string :descricao
      t.boolean :ativo, default: true
      t.float :valor_base

      t.timestamps
    end
  end
end
