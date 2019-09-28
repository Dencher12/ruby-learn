module Acessors
  def attr_accessor_with_history(name)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |val|
      @hist ||= []
      instance_variable_set(var_name, val)
      @hist << val
      define_singleton_method("#{name}_history") { @hist }
    end
  end

  def strong_attr_acessor(name, type)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |val|
      if val.class == type
        instance_variable_set(var_name, val)
      else
        puts "Значение дожно быть типа #{type}"
      end
    end
  end
end

class Test
  extend Acessors
  strong_attr_acessor :s, String
end

t = Test.new
t.s = 10
t.s = 5
t.s = "75"

puts t.s