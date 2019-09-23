require 'erb'
require_relative 'Parameters'

class MethodDef
  attr_reader :owner, :name, :ret_type, :params

  def initialize (owner, name, ret_type)
    @owner = owner
    @name = name
    @ret_type = ret_type
    @params = Parameters.new()
  end

  def renderHeader ()
    file = File.read("view/method_def.h.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

  def renderSource ()
    file = File.read("view/method_def.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
