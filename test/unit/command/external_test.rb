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

  context "setting up help" do
    setup do
      @klass = Class.new(Command::External) do |klass|
        def klass.name; to_s end

      end

      @klass.help 'Does something', :usage => 'do something'
    end

    should("allow specifying a help message") do
      assert_equal 'Does something', @klass.manual.description
    end

    should("allow specifying usage") do
      assert_equal 'do something', @klass.manual.usage
    end
  end

  context "default help" do
    setup do
      @klass = Class.new(Command::External) do |klass| 
        def klass.name; to_s end
      end
    end

    should("return a message about not being documented") do
      assert_match /not documented/i, @klass.manual.description
    end

    should("return nil as default usage message") do
      assert_equal nil, @klass.manual.usage
    end
  end
end
