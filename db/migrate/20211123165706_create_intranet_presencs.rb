class CreateIntranetPresencs < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_presencs do |t|
      t.integer     :m_id
      t.string      :m_name
      t.string      :ingresso_nome
      t.boolean     :pago
      
      t.references  :intranet_associado, null: false, foreign_key: true
      t.references  :intranet_boleto, foreign_key: true

      t.timestamps
    end
  end
end
