class CreateIntranetAtividades < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_atividades do |t|
      t.string :descricao
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
