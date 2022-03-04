class CreateIntranetPresencs < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_presencs do |t|
      t.integer     :m_id
      t.string      :m_name
      t.string      :ingresso_nome
      t.string      :cracha_nome
      t.string      :funcao
      t.string      :numero, null: false
      t.string      :email
      t.string      :telefone
      t.boolean     :whatsapp,default: false
      t.boolean     :pago 
      t.string      :status
      t.references  :intranet_cartorio, null: false, foreign_key: true
      t.references  :intranet_associado, null: false, foreign_key: true
      t.references  :intranet_boleto, foreign_key: true

      t.timestamps
    end
  end
end
