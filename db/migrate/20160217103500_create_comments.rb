class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.text :content, null: false
			t.string :commentable_type, null: false
			t.integer :commentable_id
			t.integer :user_id
			
			t.timestamps(null: false)
		end
	end
end
