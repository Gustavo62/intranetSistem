class AddFieldToIntranetCartorio < ActiveRecord::Migration[6.1]
  def change
    add_reference :intranet_cartorios, :intranet_associado,null: true,foreign_key: true 
    add_column :intranet_cartorios, :intranet_atividade_id, :integer,array: true, references: "atividade"
  end
end
