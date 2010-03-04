class Command::Base
  attr_accessor :args
  attr_reader :output, :prompt

  def initialize options = nil
    self.args = [ ]

    unless options.nil?
      options.each_pair do |attribute, value|
        send("#{attribute}=", value)
      end
    end
  end

  def to_json
    { :output => output, :prompt => prompt }.to_json
  end

  def self.command_name
    name.demodulize.underscore
  end
end
