
class Player
  def getHealth()
    if @health == nil
      return 20
    else
      return @health
    end
  end
  
  def play_turn(warrior)
    if warrior.health < getHealth
      if warrior.feel.empty?
        warrior.walk!
      else
        warrior.attack!
      end
    else 
      if warrior.health < 15
        warrior.rest!
      elsif warrior.feel.empty?
        warrior.walk!
      else 
        warrior.attack!
      end
    end
    @health = warrior.health
  end
end
  
