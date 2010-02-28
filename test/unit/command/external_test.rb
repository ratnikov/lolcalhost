require 'test_helper'

class Command::ExternalTest < ActiveSupport::TestCase
  should("pass truthitest") { assert true }

  should("register a subclass as a public command") do
    klass = Class.new(Command::External) do |klass|
      def klass.name; 'SpecialCommand' end
    end

    assert Command.defined?('special_command'), "Should have the command 'defined'"
    assert Command.parse('special_command').is_a?(klass), "Should be able to parse the command"
  end
end
