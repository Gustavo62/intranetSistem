class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :senhaPadrao, :boolean, default: false
    add_column :users, :nome, :string, null: false, default: ""
    add_column :users, :cpf, :string, null: false, default: ""
    add_column :users, :acesso, :boolean, null: false, default: false
    add_column :users, :lembrete, :text, null: true
    add_column :users, :aux_cartorio_id, :integer 
    add_column :users, :adimplente, :boolean, default: true
    add_column :users, :current_login_token, :string
    add_column :users, :termo_de_uso, :boolean, default: true
  end
end
