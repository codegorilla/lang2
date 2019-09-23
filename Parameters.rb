require 'erb'
require_relative 'Parameter'

class Parameters

  def initialize ()
    @list = []
  end

  def add (name, type)
    param = Parameter.new(name, type)
    @list << param
  end

  def render ()
    file = File.read("view/parameters.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
