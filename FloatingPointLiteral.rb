require 'erb'

class FloatingPointLiteral
  attr_reader :value

  def initialize (value)
    @value = value
  end

  def render ()
    file = File.read("view/floating_point_literal.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
