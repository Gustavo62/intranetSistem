class AddFileNaToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :avatar_file_name, :string
  end
end
