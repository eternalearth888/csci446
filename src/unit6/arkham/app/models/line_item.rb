class LineItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :villain
	belongs_to :cart
end
