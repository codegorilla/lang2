require 'erb'

class Expression
  
  attr_reader :expression

  def initialize (expression)
    @expression = expression
  end

  def render ()
    file = File.read("view/expression.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
