require 'test_helper'

class PetTest < ActiveSupport::TestCase
	test "values cannot be empty" do
		pet = Pet.new
		assert pet.invalid?
		assert pet.errors[:name].any?
		assert pet.errors[:gender].any?
		assert pet.errors[:strength].any?
		assert pet.errors[:intell].any?
		assert pet.errors[:durab].any?
		assert pet.errors[:combat].any?
		assert pet.errors[:power].any?
	end

	def makeTestVillain(gender)
		pet = Pet.new(
			:name => 'Androgenous',
			:gender => gender,
			:strength => 5,
			:intell => 5,
			:durab => 5,
			:combat => 5,
			:speed => 5,
			:power => 5,
			:image_url => 'images/harley.jpg'
		)
	end

	test "gender values must be valid" do
		good = %w{male female none}
		bad = %w{pan cake toothpick}

		good.each do |gender| 
			assert makeTestVillain(gender).valid?, "#{gender} is not valid."
		end
		bad.each do |gender|
			assert makeTestVillain(gender).invalid?
		end
	end

	def makeTestStat(stat)
		pet = Pet.new(
			:name => "Androgenous",
			:gender => "none",
			:strength => 5,
			:intell => stat,
			:durab => 5,
			:combat => 5,
			:speed => 5,
			:power => 5,
			:image_url => 'images/harley.jpg'
		)
	end

	test "stat values must be valid" do
		good = [0, 1, 5, 100, 92]
		bad = [-1, 105, 200, -50]

		good.each do |stat|
			assert makeTestStat(stat).valid?, "#{stat} is invalid."
		end
		bad.each do |stat|
			assert makeTestStat(stat).invalid?
		end
	end	
		
end
