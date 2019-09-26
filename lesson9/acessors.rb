module Acessors
  def attr_accessor_with_history(name)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |val|
      @hist ||= []
      instance_variable_set(var_name, val)
      @hist << val
      #create_hist_getter(name)
      define_singleton_method("#{name}_history") { @hist }
    end
  end

  private

  def create_hist_getter(name)
    define_method("#{name}_history") { @hist }
  end
end

class Test
  extend Acessors
  attr_accessor_with_history :s
end

t = Test.new
t.s = 10
t.s = 5
t.s = 3

puts t.s