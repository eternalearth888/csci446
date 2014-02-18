require 'test_helper'

class VillainTest < ActiveSupport::TestCase
	test "villain attributes must not be empty" do
		villain = Villain.new 
		assert villain.invalid?
		assert villain.errors[:name].any?
		assert villain.errors[:gender].any?
		assert villain.errors[:intel].any?
		assert villain.errors[:str].any?
		assert villain.errors[:speed].any?
		assert villain.errors[:durab].any?
		assert villain.errors[:power].any?
		assert villain.errors[:combat].any?
	end

	def validVillainGender(gender)
		Villain.new(
			:name => "Androgenous",
			:gender => gender,
			:intel => 10,
			:str => 5,
			:speed => 25,
			:durab => 15,
			:power => 30,
			:combat => 20,
			:image_url => 'images/harley.jpg'
		)
	end
	

	def validVillainStat(stat)
		Villain.new(
			:name => "Androgenous",
			:gender => "none",
			:intel => 10,
			:str => stat,
			:speed => 25,
			:durab => 15,
			:power => 30,
			:combat => 20,
			:image_url => 'images/harley.jpg'
		)
	end

	def validVillainImage(image)
		Villain.new(
			:name => "Androgenous",
			:gender => "none",
			:intel => 10,
			:str => 5,
			:speed => 25,
			:durab => 15,
			:power => 30,
			:combat => 20,
			:image_url => image
		)
	end

	test "villain gender must be valid" do
		good = %w{female male none}
		bad = %w{pan cake ball}

		good.each do |good|
			assert validVillainGender(good).valid?, "#{good} is invalid and should not be."
		end

		bad.each do |bad|
			assert validVillainGender(bad).invalid?, "#{bad} is valid and should not be."
		end
	end
	
	test "villain stats must be valid" do
		good = [0, 50, 92, 3, 5, 26, 100]
		bad = [-1, -50, 105, 200, 3000, -100]

		good.each do |good|
			assert validVillainStat(good).valid?, "#{good} is invalid and should not be."
		end

		bad.each do |bad|
			assert validVillainStat(bad).invalid?, "#{bad} is valid and should not be."
		end
	end

	test "villain image must be valid" do
		good = %w{fred.jpg fred.gif fred.png WILMA.JPG WILMA.GIF WILMA.PNG images/BARNEY.JPG images/BARNEY.gif image/barney.png}
		bad = %w{fred.doc fred.png/more WILMA.GIF.more}

		good.each do |good|
			assert validVillainImage(good).valid?, "#{good} is invalid and should not be."
		end

		bad.each do |bad|
			assert validVillainImage(bad).invalid?, "#{bad} is valid and should not be."
		end
	end
end
