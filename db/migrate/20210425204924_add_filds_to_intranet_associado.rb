class AddFildsToIntranetAssociado < ActiveRecord::Migration[6.1]
  def change
    add_column :intranet_associados, :intranet_cartorio, :integer,array: true 
  end
end
