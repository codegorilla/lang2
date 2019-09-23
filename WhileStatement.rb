require 'erb'

class WhileStatement
  attr_reader :condition, :body

  def initialize (condition, body)
    @condition = condition
    @body = body
  end

  def render ()
    file = File.read("view/while_statement.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
