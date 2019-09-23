require 'erb'
require_relative 'Parameters'

class StructDef
  attr_reader :name, :ret_type, :params

  def initialize (name)
    @name = name
  end

#  def renderHeader ()
#    file = File.read("view/struct.h.erb")
#    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
#    template.result(binding)
#  end

  def renderSource ()
    file = File.read("view/struct.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
