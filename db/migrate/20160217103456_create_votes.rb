class CreateVotes < ActiveRecord::Migration
	def change
		create_table :votes do |t|
			t.integer :value, null: false
			t.string :votable_type, null: false
			t.integer :votable_id
			t.integer :user_id
			
			t.timestamps(null: false)
		end
	end
end
