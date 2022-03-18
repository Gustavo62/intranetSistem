class AddContentTypeToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :avatar_content_type, :string
  end
end
