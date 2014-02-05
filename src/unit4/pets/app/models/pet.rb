class Pet < ActiveRecord::Base
	default_scope :order => 'name'
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :name, :gender, :presence => true
	validates :gender, inclusion: {in:%w{female male none}, 
		message: "%{value} is not a valid gender. Please input female, male or none"}
	validates :intell, :strength, :speed, :durab, :power, :combat, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}

	private
		#ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
end
