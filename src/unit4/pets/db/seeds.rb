Pet.delete_all

Pet.create!(
	:name => 'Harley Quinn',
	:gender => 'female',
	:intell => 81,
	:strength => 12,
	:speed => 23,
	:durab => 42,
	:power => 30,
	:combat => 80,
	:image_url => '/images/harley.jpg'
)

Pet.create!(
	:name => 'Poison Ivy',
	:gender => 'female',
	:intell => 69,
	:strength => 12,
	:speed => 23,
	:durab => 14,
	:power => 71,
	:combat => 36,
	:image_url => '/images/poison.jpg'
)

Pet.create!(
	:name => 'Penguin',
	:gender => 'male',
	:intell => 75,
	:strength => 10,
	:speed => 12,
	:durab => 28,
	:power => 30,
	:combat => 45,
	:image_url => '/images/penguin.jpg'
)

Pet.create!(
	:name=>'Killer Croc',
	:gender => 'none',
	:intell => 25,
	:strength => 48,
	:speed => 33,
	:durab => 85,
	:power => 36,
	:combat => 60,
	:image_url => '/images/croc.jpg'
)
