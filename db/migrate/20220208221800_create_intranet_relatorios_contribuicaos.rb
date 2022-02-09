class CreateIntranetRelatoriosContribuicaos < ActiveRecord::Migration[6.1]
  def change
    create_table :intranet_relatorios_contribuicaos do |t|
      t.string :errors_logs
      t.date :data
      t.string :status
      t.string :url_link

      t.timestamps
    end
  end
end
