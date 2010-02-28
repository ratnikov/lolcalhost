require 'test_helper'

class Command::EchoTest < ActiveSupport::TestCase
  should("pass truthitest") { assert true }

  context "#output" do
    should("return concatenated arguments") do
      assert_equal 'Hello world', Command::Echo.new(:args => [ 'Hello', 'world' ]).output
    end

    should("return blank line if no arguments are specified") do
      assert_equal '', Command::Echo.new.output
    end
  end
end
