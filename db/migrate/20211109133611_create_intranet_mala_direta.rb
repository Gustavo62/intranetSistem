class CreateIntranetMalaDireta < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_mala_direta do |t| 
      t.text    :intranet_cartorio_id,array: true, default: []
      t.string :layout
      t.string :assunto 
      t.string :sub_assunto 

      t.timestamps
    end
  end
end
