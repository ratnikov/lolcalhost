class Command::Help < Command::External
  def output
    "Try typing in one of the following commands:\n#{Command.commands.sort.map { |name| '  ' + name }.join("\n")}"
  end
end
