require 'erb'

class Argument
  attr_reader :value

  def initialize (value)
    @value = value
  end
  
  def render ()
    file = File.read("view/argument.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
