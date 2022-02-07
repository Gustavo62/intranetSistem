class CreateIntranetRegiaos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_regiaos do |t|
      t.string :descricao
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
