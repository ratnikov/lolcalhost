require 'test_helper'

class Command::UnknownTest < ActiveSupport::TestCase
  should("pass truthitest") { assert true }

  context "#output" do
    setup { @command = Command::Unknown.new :command => 'foobaristic' }
    should("mention the command") do
      assert_match /foobaristic/, @command.output
    end

    should("mention help command") do
      assert_match /help/, @command.output
    end
  end
end
