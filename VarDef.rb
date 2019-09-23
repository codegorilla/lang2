require 'erb'

class VarDef
  attr_reader :name, :type, :expression

  def initialize (name, type, expression)
    @name = name
    @type = type
    @expression = expression
  end

#  def renderHeader ()
#    file = File.read("function.h.erb")
#    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
#    template.result(binding)
#  end

  def renderSource ()
    file = File.read("view/var_def.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
