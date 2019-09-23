require 'erb'
require_relative 'Expression'

class Name < Expression
  attr_reader :text

  def initialize (text)
    @text = text
  end

  def render ()
    file = File.read("view/name.c.erb")
    template = ERB.new(file, nil, trim_mode=">", eoutvar='_sub01')
    template.result(binding)
  end

end
