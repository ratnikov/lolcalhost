require 'test_helper'

class Command::HelpTest < ActiveSupport::TestCase
  should("pass truthitest") { assert true }

  should("have #output return all current commands sorted by name") do
    assert_match Regexp.new(Command.commands.sort.join('.*'), Regexp::MULTILINE), Command::Help.new.output
  end

  should("include internal commands") do
    klass = Class.new(Command::Internal)
    def klass.name; 'InternalCommand' end

    assert_no_match /internal/i, Command::Help.new.output
  end
end
