class CombineItemsInCart < ActiveRecord::Migration
	def change
	end

	def self.up
		#replace multiple items for a single product in a cart with a single item
		Cart.all.each do |cart|
			#count the number of each villain in the cart
			sums = cart.line_items.group(:villain_id).sum(:quantity)

			sums.each do |villain_id, quantity|
				if quantity > 1
					#remove individual items
					cart.line_items.where(:villain_id=>villain_id).delete_all

					#replace with a single item
					cart.line_items.create(:villain_id=>villain_id, :quantity=>quantity)
				end
			end
		end
	end

	def self.down
		#split items with quantity>1 into multiple items
		LineItem.where("quantity>1").each do |line_item|
			#add individual items
			line_item.quantity.times do
				LineItem.create :cart_id=>line_item.cart_id,
					:villain_id=>line_item.villain_id, :quantity=>1
			end
			#remove original item
			line_item.destroy
		end
	end
end
