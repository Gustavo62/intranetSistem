class AddFilenameToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :file_name, :string
  end
end
