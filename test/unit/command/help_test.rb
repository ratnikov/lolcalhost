require 'test_helper'

class Command::HelpTest < ActiveSupport::TestCase
  should("pass truthitest") { assert true }

  context "with no arguments" do
    should("have #output return all current commands sorted by name") do
      assert_match Regexp.new(Command.commands.sort.join('.*'), Regexp::MULTILINE), Command::Help.new.output
    end

    should("not include internal commands") do
      klass = Class.new(Command::Internal)
      def klass.name; 'InternalCommand' end

      assert_no_match /internal/i, Command::Help.new.output
    end
  end

  context "with a command argument" do
    setup do
      @klass = Class.new(Command::External) do |klass|
        def klass.name; to_s end
      end

      @klass.help 'Some help message', :usage => 'be used in some way'
      @output = Command::Help.new(:args => [ @klass.command_name ]).output
    end

    should("mention the name of the command in output") do
      assert_match @klass.command_name, @output
    end

    should("mention the description of the command in output") do
      assert_match /Some help message/, @output
    end

    should("mention the usage") do
      assert_match /be used in some way/, @output
    end
  end

  context "with an unknown command argument" do
    should("return unknown command's output") do
      assert_equal Command::Unknown.new(:command => 'some_command').output, Command::Help.new(:args => [ 'some_command' ]).output
    end
  end
end
