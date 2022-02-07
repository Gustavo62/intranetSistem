class CreateIntranetAvisos < ActiveRecord::Migration[6.1]
  def change
    create_table    :intranet_avisos do |t|
      t.string      :titulo
      t.string      :descricao
      t.references  :intranet_atividade, :integer,array: true
      t.boolean     :ativo, default: true
      t.integer     :recipient_id
      t.datetime    :read_at
      t.boolean     :master, default: false
      t.integer     :master_id
      t.timestamps
    end
  end
end
