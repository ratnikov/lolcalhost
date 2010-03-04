class Command::Manual
  attr_reader :description, :usage

  def initialize(description = 'No help for this command', options = nil)
    @description = description
    @usage = options && options.has_key?(:usage) ? options[:usage] : nil
  end
end
