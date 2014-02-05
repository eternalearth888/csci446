class Pet < ActiveRecord::Base
	validates :name, :gender, :presence => true
	validates :gender, inclusion: {in:%w{female male none}, 
		message: "%{value} is not a valid gender. Please input female, male or none"}
	validates :intell, :strength, :speed, :durab, :power, :combat, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
end
