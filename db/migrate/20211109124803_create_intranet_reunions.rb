class CreateIntranetReunions < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_reunions do |t|
      t.date    :data
      t.string  :assunto
      t.string  :local
      t.string  :link
      t.integer    :intranet_cartorio_id,array: true, default: []
      t.boolean :ativo, default: true 

      t.timestamps
    end
  end
end
