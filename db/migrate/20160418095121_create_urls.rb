class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |x|
			x.string :long_url
			x.string :short_url
			x.integer :click_count, default: 0
			x.timestamps null: false
		end
	end
end
