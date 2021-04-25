class CreateIntranetSubstitutos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_substitutos do |t|
      t.date :dt_inicio
      t.date :dt_final
      t.string :cpf
      t.string :rg
      t.string :nome
      t.string :telefone
      t.boolean :whatsapp
      t.string :email
      t.boolean :atual?

      t.timestamps
    end
  end
end
