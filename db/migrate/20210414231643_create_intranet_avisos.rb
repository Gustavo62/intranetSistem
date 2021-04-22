class CreateIntranetAvisos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_avisos do |t|
      t.string :descricao
      t.references :atividade
      t.boolean :ativo, default: false

      t.timestamps
    end
  end
end
