class CreateIntranetFinanceiroPortadores < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_financeiro_portadores do |t|
      t.text :arquivo
      t.string :cnpj
      t.string :codigo_banco
      t.string :agencia
      t.string :carteira
      t.string :conta
      t.boolean :aceite
      t.string :empresa
      t.string :especie_titulo
      t.string :moeda
      t.integer :numero_inicial_1
      t.integer :numero_inicial_2
      t.integer :numero_final
      t.string :registro_online
      t.string :nome_certificado
      t.string :senha_certificado

      t.timestamps
    end
  end
end
