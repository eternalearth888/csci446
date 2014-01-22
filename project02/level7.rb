
class Player
  def getHealth()
    if @health == nil
      return 20
    else
      return @health
    end
  end
  
  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    else
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
      else 
        if warrior.feel.enemy?
          warrior.attack!
        elsif warrior.feel.captive?
          warrior.rescue!
        end
      end
    end
    end
      @health = warrior.health
  end
end
  
