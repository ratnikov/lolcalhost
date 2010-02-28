class Command::Unknown < Command::Base
  attr_accessor :command

  def output
    "#{command}: Unknown command. Use 'help' for help"
  end
end
