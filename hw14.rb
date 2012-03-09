
class Dessert
  def initialize(name,calories)
    @name = name
    @calories = calories
  end
  
  def name
    @name
  end
  def name=(val)
    @name=val
  end
  def calories
    @calories
  end
  def calories=(val)
    @calories=val
  end
  
  def healthy?
    if @calories < 200
      return true
    end
    false
  end
  
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name,calories,flavor)
    super(name, calories)
    @flavor = flavor
  end
  def flavor
    @flavor
  end
  def flavor=(val)
    @flavor = val
  end
  
  def delicious?
    if @flavor == 'black licorice'
      return false
    end
    super()
  end
end
