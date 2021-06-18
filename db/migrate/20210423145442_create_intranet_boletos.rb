class CreateIntranetBoletos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_boletos do |t|
      t.references :intranet_financeiro_tipos_cobanca, null: false, foreign_key: true
      t.references :intranet_financeiro_portadores
      t.references :intranet_regiao, null: false, foreign_key: true
      t.references :intranet_entrancium, null: false, foreign_key: true
      t.references :intranet_contribuicao, null: false, foreign_key: true
      t.references :intranet_atividade
      t.float :valor
      t.integer :vencimento
      t.string :descricao
      t.string :observacao_email
      t.string :forma_cobranca
      t.boolean :apenas_titular
      t.boolean :pago

      t.timestamps
    end
  end
end
