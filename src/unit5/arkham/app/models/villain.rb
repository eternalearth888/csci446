class Villain < ActiveRecord::Base
	#validation that name and gender have value
	validates :name, :gender, :presence => true
	#validates that name is unique
	validates :name, :uniqueness => true
	#validation that stats are in correct 0..100 scale
	validates :intel, :str, :speed, :durab, :power, :combat, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
	#validation that gender is either female, male or none
	validates :gender, inclusion: {in:%w{female male none},message: "%{value} is invalid gender. Input: female, male or none"}
	#validation that image has correct extension
	validates :image_url, allow_blank:true, :format => {
		:with => %r{\.(gif|jpg|png)\z}i, 
		message: "Image must be gif, jpg, or png."
	}

end
