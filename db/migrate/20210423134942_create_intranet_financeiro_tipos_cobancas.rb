class CreateIntranetFinanceiroTiposCobancas < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_financeiro_tipos_cobancas do |t|
      t.string :descricao
      t.string :tipo_valor
      t.boolean :sindical
      t.boolean :ativo

      t.timestamps
    end
  end
end
