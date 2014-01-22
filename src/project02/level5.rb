
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
        if warrior.feel.enemy?
          warrior.attack!
        elsif warrior.feel.captive?
          warrior.rescue!
        end
      end
    else 
      if warrior.health < 15
        warrior.rest!
      elsif warrior.feel.empty?
        warrior.walk!
      else 
        if warrior.feel.enemy?
          warrior.attack!
        elsif warrior.feel.captive?
          warrior.rescue!
        end
      end
    end
    @health = warrior.health
  end
end
  
