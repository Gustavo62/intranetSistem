class CreateIntranetEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_events do |t|
      t.date    :periodo_ini
      t.date    :periodo_fim
      t.date    :insc_ini
      t.date    :insc_fim
      t.string  :titulo
      t.string  :cabecalho_1
      t.string  :cabecalho_2
      t.date    :data_max_pagamento
      t.integer :qtd_insc_total 
      t.integer :qtd_insc_cart 
      t.string  :tipo
      t.boolean :ativo, default: true
      t.boolean :pago 
      t.float   :valor 
      t.string  :link

      t.timestamps
    end
  end
end
