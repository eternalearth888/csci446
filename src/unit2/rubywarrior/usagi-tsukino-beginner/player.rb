class Player
	def initialize
		@health = 20
		@seenWall = false
	end
	
	def getWall()
		return @seenWall
	end

	def getHealth()
		return @health
	end

	def moveWarrior(warrior)
		if warrior.health < getHealth
			if warrior.health <= 10
				warrior.walk!(:backward)
			else
				if warrior.feel.empty?
					warrior.walk!
				elsif warrior.feel.enemy?
					warrior.attack!
				elsif warrior.feel.captive?
					warrior.rescue!
				end
			end
		else
			if warrior.health < 20
				warrior.rest!
			elsif warrior.feel.empty?
				warrior.walk!
			elsif warrior.feel.wall?
				warrior.pivot!
			else 
				if warrior.feel.enemy?
					warrior.attack!
				elsif warrior.feel.captive?
					warrior.rescue!
				end
			end
		end
	end

	def chooseAction(warrior)
		count = 0
		warrior.look(:backward).each { |space|
			if space.empty?
				count += 1
				next
			elsif space.captive?
				return "captiveBack"
			elsif space.enemy?
				if space.to_s.include?("Thick Sludge") and count >=1
						next
				else
					return "killBitchTheSequel"
				end
			end
		}
		warrior.look.each { |space| 
			if space.empty?
				next
			elsif space.captive?
				return "captive"
			elsif space.enemy?
				if space.to_s.include?("Thick Sludge")
					return "killSludge"
				else
					return "killBitch"
				end
			end
		}	
		return "walk"
	end

	def play_turn(warrior)
	#	puts "WALL STATUS: #{getWall}"
		if warrior.feel.stairs?
			if getWall == false
				warrior.pivot!
			else
				if chooseAction(warrior) == "captive"
					warrior.rescue!
				else
					warrior.walk!
				end
			end
		elsif warrior.feel(:backward).wall?
			@seenWall = true
			moveWarrior(warrior)
		elsif warrior.feel.wall?
			@seenWall = true
			warrior.pivot!
		else
			if chooseAction(warrior) == "walk"
				warrior.walk!
			elsif chooseAction(warrior) == "killBitchTheSequel"
				warrior.pivot!
			elsif chooseAction(warrior) == "captiveBack"
				warrior.pivot!
			elsif chooseAction(warrior) =="captive"
				moveWarrior(warrior)	
			elsif chooseAction(warrior) == "killSludge"
				moveWarrior(warrior)
			elsif chooseAction(warrior) == "killBitch"
				warrior.shoot!
			end
		end
		@health = warrior.health
	end
end
