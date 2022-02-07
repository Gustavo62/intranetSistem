class CreateIntranetArquivos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_arquivos do |t|
      t.references :intranet_arquivos_tipo, null: false
      t.references :intranet_cartorio, null: false
      t.boolean    :ativo, default: true
      t.string     :descricao
      t.boolean    :baixado 
      t.integer    :cart_visualizados_ids,array: true, default: [] 

      t.timestamps
    end
  end
end
