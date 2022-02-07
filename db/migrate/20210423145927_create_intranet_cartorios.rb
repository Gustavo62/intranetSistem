class CreateIntranetCartorios < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_cartorios do |t|
      t.boolean :possui_cnpj, null: false
      t.string :cei
      t.string :cnpj
      t.string :cod_tj
      t.string :cod_cns
      t.string :nome
      t.string :situacao, null: false, default: 'ok'
      t.string :nome_fant
      t.string :nome_res
      t.string :cep
      t.string :logradouro
      t.string :numero
      t.string :bairro
      t.string :complemento
      t.string :telefone_fixo
      t.string :telefone_celular
      t.boolean :whatsapp
      t.string :email 
      t.boolean :ativo, default: true
      t.string :alt_usuario
      t.string :cad_analise
      t.string :encontrado_tj
      t.string :em_acordo
      t.string :retencao_tj
      t.string :pg_retencao_tj
      t.text   :observacao   
      t.boolean :adimplente, default: true
      t.references :intranet_regiao, foreign_key: true
      t.references :intranet_contribuicao, foreign_key: true
      t.references :intranet_entrancia, foreign_key: true
      t.references :intranet_cidade, foreign_key: true
      t.references :intranet_substituto,  foreign_key: true
      t.references :intranet_tabeliao, foreign_key: true 

      t.timestamps
    end
  end
end
