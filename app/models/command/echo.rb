class Command::Echo < Command::External
  help 'Outputs a string', :usage => 'echo [ string ] ...'

  def output
    args.blank? ? '' : args.join(' ')
  end
end
