class MockCapistrano < Capistrano::Configuration

  def transfer(direction, from, to, options={})
    transfers.push(:direction => direction, :from => from, :to => to, :options => options)
  end

  def run(command, options={})
    invocations.push(:command => command, :options => options)
  end

  def transfers
    @transfers ||= []
  end

  def invocations
    @invocations ||= []
  end
end
