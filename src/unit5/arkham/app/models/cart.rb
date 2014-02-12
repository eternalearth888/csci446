class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	def add_villain(villain_id)
		current_item = line_items.find_by_villain_id(villain_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(:villain_id => villain_id)
		end
	current_item
	end

	def total_items
		line_items.sum(:quantity)
	end
end
