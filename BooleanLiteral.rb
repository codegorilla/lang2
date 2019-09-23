require 'erb'
require_relative 'Expression'

class BooleanLiteral < Expression
  attr_reader :value

  def initialize (value)
    @value = value
  end

  def render ()
    file = File.read("view/boolean_literal.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
