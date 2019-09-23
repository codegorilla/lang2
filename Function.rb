require 'erb'
require_relative 'Parameters'

class Function
  attr_reader :name, :ret_type, :params

  def initialize (name, ret_type)
    @name = name
    @ret_type = ret_type
    @params = Parameters.new()
  end

  def renderHeader ()
    file = File.read("view/function.h.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

  def renderSource ()
    file = File.read("view/function.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
