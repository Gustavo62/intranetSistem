class CreateIntranetDepartamentos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_departamentos do |t|
      t.string :descricao
      t.boolean :ativo

      t.timestamps
    end
  end
end
