class CreatesPage < ActiveRecord::Migration
	def change
		create_table :pages do |t|
			t.integer :parent_id
			t.boolean :conclusion
		end
	end
end