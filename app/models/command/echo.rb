class Command::Echo < Command::External
  def output
    args.blank? ? '' : args.join(' ')
  end
end
