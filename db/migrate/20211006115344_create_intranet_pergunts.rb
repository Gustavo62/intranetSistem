class CreateIntranetPergunts < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_pergunts do |t|
      t.string  :mensagem_pergunta
      t.string  :tipo
      t.references :intranet_associado, null: false, foreign_key: true
      t.string  :assunto
      t.string  :profissional_id
      t.string  :mensagem_resposta
      t.string  :status
      t.boolean :visualizada, default: false
      t.datetime :visualizada_at, default: nil
      t.timestamps
    end
  end
end
