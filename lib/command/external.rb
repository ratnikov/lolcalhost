class Command::External < Command::Base
  def self.inherited(subclass)
    subclass.extend HasHelp

    subclass.help 'I am not documented :('

    Command.register subclass 
  end

  module HasHelp
    attr_reader :manual

    def help description, options = nil
      @manual = Command::Manual.new(description, options).freeze
    end
  end

  def internal?; false end
end
