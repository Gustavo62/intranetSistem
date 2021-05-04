class CreateIntranetAssociados < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_associados do |t|
      t.references :user, null: false, foreign_key: true
      t.string :matricula
      t.date :data_nascimento
      t.string :funcao
      t.string :nome
      t.string :rg
      t.string :rg_emissor
      t.boolean :sexo
      t.boolean :ativo
      t.string :cep
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :telefone_1
      t.string :telefone_2
      t.string :celular
      t.string :whatsapp
      t.string :email

      t.timestamps
    end
  end
end
