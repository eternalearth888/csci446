
class Player
  def getHealth()
    if @health == nil
      return 20
    else
      return @health
    end
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
    #[nothing, Captive, Wizard]
    warrior.look.each { |space| 
      if space.empty?
        next
      elsif space.captive?
        return "captive"
      elsif space.enemy?
        return "killBitch"
      end
    }
    return "walk"
  end
  
  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    else
      if chooseAction(warrior) == "walk"
        warrior.walk!
      elsif chooseAction(warrior) =="captive"
        moveWarrior(warrior)
      elsif chooseAction(warrior) == "killBitch"
        warrior.shoot!
      end
    end
    @health = warrior.health
  end
end
  
