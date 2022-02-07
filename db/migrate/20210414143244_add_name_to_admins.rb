class AddNameToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :senhaPadrao, :boolean, default: false
    add_column :admins, :isAdmin, :boolean, default: false
    add_column :admins, :nome, :string, default: ""
    add_column :admins, :cpf, :string, default: ""
    add_column :admins, :acesso, :boolean, default: true
    add_column :admins, :lembrete, :text
    add_column :admins, :privilegio_id, :integer,array: true, references: "privilegio", default: ['6']
    add_column :admins, :departamento_id, :integer,array: true, references: "departamento", default: ['5','6']
  end
end 