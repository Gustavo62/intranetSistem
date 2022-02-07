class CreateIntranetAssociados < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_associados do |t|
      t.references :user, foreign_key: true  
      t.string :data_nascimento
      t.string :funcao
      t.string :nome 
      t.boolean :ativo, default: false
      t.string :cep
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :telefone_1
      t.string :telefone_2
      t.string :celular
      t.boolean :whatsapp
      t.string :email 
      t.boolean :substituto, default: false
      
      t.timestamps
    end
  end
end
