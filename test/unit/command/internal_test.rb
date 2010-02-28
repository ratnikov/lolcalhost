require 'test_helper'

class Command::InternalTest < ActiveSupport::TestCase
  should("pass truthitest") { assert true }

  context "sub-classing an internal command" do
    setup do
      @klass = Class.new(Command::Internal) do |klass|
        def klass.name; 'InternalCommand' end
      end
    end

    should("not parse it as a command") do
      assert !Command.parse('internal_command').kind_of?(@klass), "Should not parse as a command"
    end
  end
end
