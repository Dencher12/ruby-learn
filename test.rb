module A
  @@t = 1
  def a 
    puts 'sfgsfg'
  end  
end

class B
  extend A
  def self.ib
    puts @@t
  end
end

B.ib
