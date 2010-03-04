class Command::Help < Command::External
  help "Shows help", :usage => "help [ command ]"

  def output
    if command = args.first
      command_help(command)
    else
      general_help
    end
  end

  private

  def general_help
    "Try typing in one of the following commands:\n#{Command.commands.sort.map { |name| '  ' + name }.join("\n")}"
  end

  def command_help(command)
    if command_klass = Command.command_space[command]
      output = "Help for command #{command_klass.command_name.inspect}:\n"

      manual = command_klass.manual
      output += "\nUsage: #{manual.usage}" unless manual.usage.nil?

      output += "\nDescription:\n\n#{manual.description}"
      output
    else
      Command::Unknown.new(:command => command).output
    end
  end
end
