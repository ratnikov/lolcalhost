class Command::External < Command::Base
  def self.inherited(subclass)
    Command.register subclass 
  end

  def internal?; false end
end
