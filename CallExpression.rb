require 'erb'
require_relative 'Arguments'

class CallExpression
  attr_reader :name, :args

  def initialize (name)
    @name = name
    @args = Arguments.new()
  end

  def render ()
    file = File.read("view/call_expression.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
