module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@commands = []
    def validate(atrr, validation, arg = nil)
      if arg.nil?
        @@commands << [validation, atrr]
      else
        @@commands << [validation, atrr, arg]
      end
    end

    def presence(atrr)
      return false if attr.nil? || atrr == ''

      true
    end

    def format(attr, reg_exp)
      return false if attr !~ reg_exp

      true
    end

    def type(attr, type)
      return false if attr.class != type

      true
    end

    def commands
      @@commands
    end
  end

  module InstanceMethods
    def validate!
      commands = self.class.commands
      send(commands[0], commands[1]) if commands.size == 2
      send(commands[0], commands[1], commands[2]) if commands.size == 3
      puts commands
    end
  end
end

class Test
  include Validation
  validate :s, :presence

  def initialize
    @s = ''
    validate!
  end
end

Test.new
