class CreateIntranetFixaFiliacaos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_fixa_filiacaos do |t| 
      t.references :user, null: false, foreign_key: true  
      t.references :intranet_cartorio, null: false, foreign_key: true  
      t.references :intranet_associado, null: false, foreign_key: true 
      t.boolean    :ativo, default: true
      t.timestamps
    end
  end
end
