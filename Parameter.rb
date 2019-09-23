require 'erb'

class Parameter
  attr_reader :name, :type

  def initialize (name, type)
    @name = name
    @type = type
  end
  
  def render ()
    file = File.read("view/parameter.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
