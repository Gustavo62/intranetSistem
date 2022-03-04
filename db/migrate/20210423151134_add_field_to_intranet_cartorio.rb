class AddFieldToIntranetCartorio < ActiveRecord::Migration[6.1]
  def change
    add_column :intranet_cartorios, :intranet_associado_id, :integer,null: true,array: true
    add_column :intranet_cartorios, :intranet_atividade_id, :integer,array: true, references: "atividade"
  end
end
