class AddFieldToIntranetBoleto < ActiveRecord::Migration[6.1]
  def change
    add_reference :intranet_boletos, :intranet_cartorio, null: false, foreign_key: true
  end
end
