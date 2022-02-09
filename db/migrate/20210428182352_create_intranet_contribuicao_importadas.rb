class CreateIntranetContribuicaoImportadas < ActiveRecord::Migration[6.1]
	def change
		create_table :intranet_contribuicao_importadas do |t|
		t.date   :ano,          null: false
		t.string :intranet_cartorio_id,    null: false
		t.string :descContrib,  null: false
		t.float  :valor,        null: false

		t.timestamps
		end
	end
end
