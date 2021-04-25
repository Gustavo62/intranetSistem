class AddFieldToIntranetCartorio < ActiveRecord::Migration[6.1]
  def change
    add_reference :intranet_cartorios, :intranet_associado, null: false, foreign_key: true
  end
end
