Villain.delete_all

Villain.create!(
	:name => 'Harley Quinn',
	:gender => 'female',
	:intel => 81,
	:str => 12,
	:speed => 23,
	:durab => 42,
	:power => 30,
	:combat => 80,
	:image_url => '/images/harley.jpg'
)

Villain.create!(
	:name => 'Poison Ivy',
	:gender => 'female',
	:intel => 69,
	:str => 12,
	:speed => 23,
	:durab => 14,
	:power => 71,
	:combat => 36,
	:image_url => '/images/poison.jpg'
)

Villain.create!(
	:name => 'Penguin',
	:gender => 'male',
	:intel => 75,
	:str => 10,
	:speed => 12,
	:durab => 28,
	:power => 30,
	:combat => 45,
	:image_url => '/images/penguin.jpg'
)

Villain.create!(
	:name=>'Killer Croc',
	:gender => 'none',
	:intel => 25,
	:str => 48,
	:speed => 33,
	:durab => 85,
	:power => 36,
	:combat => 60,
	:image_url => '/images/croc.jpg'
)
