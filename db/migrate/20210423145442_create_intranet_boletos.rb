class CreateIntranetBoletos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_boletos do |t| 
      t.references :intranet_associado, null: false, foreign_key: true 
      t.string   :valor
      t.date    :vencimento
      t.string  :descricao 
      t.string  :nosso_numero 
      t.string  :status
      t.string  :codigo_de_barras
      t.string  :token 
      t.string  :estornado 
      t.boolean :a_maior 
      t.string  :tipo  
      t.string  :metodo  
      t.string  :url  
      t.integer :id_boleto 
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
