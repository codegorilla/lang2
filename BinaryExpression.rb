require 'erb'
require_relative 'Expression'

class BinaryExpression < Expression
  attr_reader :op, :left, :right

  def initialize (op, left, right)
    @op = op
    @left = left
    @right = right
  end

  def render ()
    file = File.read("view/binary_expression.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
