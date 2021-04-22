class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nome, :string, null: false, default: ""
    add_column :users, :cpf, :string, null: false, default: ""
    add_column :users, :acesso, :boolean, null: false, default: false
    add_column :users, :lembrete, :text, null: true
  end
end
