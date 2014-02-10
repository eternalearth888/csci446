CREATE TABLE pets (
	id INTEGER PRIMARY KEY UNIQUE,
	name TEXT NOT NULL,
	gender TEXT NOT NULL CHECK ("female" OR "male" OR "NA"),
	intell INTEGER CHECK ( intell >= 0 and intell <= 100 ),
	strength INTEGER CHECK ( strength >= 0 and strength <=0 ),
	speed INTEGER CHECK ( speed >= 0 and speed <= 0 ),
	durab INTEGER CHECK ( durability >= 0 and durability <= 0 ),
	power INTEGER CHECK ( power >= 0 and power <= 0),
	combat INTEGER CHECK ( combat >= 0 and combat <= 0),
);
