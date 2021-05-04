class CreateIntranetCartorios < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_cartorios do |t|
      t.boolean :possui_cnpj
      t.string :cei
      t.string :cnpj
      t.string :cod_tj
      t.string :cod_cnj
      t.string :nome
      t.string :nome_fant
      t.string :nome_res
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :complemento
      t.string :telefone_fixo
      t.string :telefone_celular
      t.string :whatsapp
      t.string :email
      t.string :forma_branca
      t.text :observacao 
      t.references :intranet_regiao, null: true, foreign_key: true
      t.references :intranet_contribuicao, null: true, foreign_key: true
      t.references :intranet_entrancia, null: true, foreign_key: true
      t.references :intranet_boleto, null: true, foreign_key: true
      t.references :intranet_cidade, null: true, foreign_key: true
      t.references :intranet_substituto, null: true, foreign_key: true
      t.references :intranet_tabeliao, null: true, foreign_key: true

      t.timestamps
    end
  end
end
