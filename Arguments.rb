require 'erb'
require_relative 'Argument'

class Arguments

  def initialize ()
    @list = []
  end

  def add (value)
    arg = Argument.new(value)
    @list << arg
  end

  def render ()
    file = File.read("view/arguments.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
