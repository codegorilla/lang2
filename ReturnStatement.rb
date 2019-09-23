require 'erb'

class ReturnStatement
  attr_reader :name, :type, :expression

  def initialize (expression)
    @expression = expression
  end

  def render ()
    file = File.read("view/return_statement.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
