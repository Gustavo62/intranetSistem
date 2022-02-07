class CreateIntranetArquivosTipos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_arquivos_tipos do |t|
      t.string :descricao
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
