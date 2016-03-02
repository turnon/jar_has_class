require 'colorize'

class Jar

  attr_reader :path, :files

  def initialize(path)
    @path = path
    @files = %x[jar tf #{path} 2>&1 ].lines
  end

  def match?(re)
    @matches = @files.select{|f| f =~ re}
    not @matches.empty?
  end

  def matches
    path.colorize(:light_blue) + "\n" + @matches.join + "\n"
  end
end