class CreateIntranetChamados < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_chamados do |t|
      t.string :assunto
      t.references :intranet_associado, null: false, foreign_key: true
      t.string :mensagem_pergunta
      t.string :mensagem_resposta
      t.integer :profissional_id
      t.boolean :visualizada
      t.datetime :visualizada_at

      t.timestamps
    end
  end
end
