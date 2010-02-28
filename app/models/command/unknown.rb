class Command::Unknown < Command::Internal
  attr_accessor :command

  def output
    "#{command}: Unknown command. Use 'help' for help"
  end
end
