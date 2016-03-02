re = Regexp.new(ARGV.shift)

class Jar

  attr_reader :path, :files, :matches

  def initialize(path)
    @path = path
    @files = %x[jar tf #{path} 2>&1 ].lines
  end

  def match?(re)
    @matches = @files.select{|f| f =~ re}
    not @matches.empty?
  end

  def to_s
    path + "\n" + matches.map{|line| " " + line}.join + "\n"
  end
end

Dir.glob('**/*').select do |path|
  path =~ /\.jar$/
end.map do |path|
  j = Jar.new path
  if j.match? re
    j
  else
    nil
  end
end.each do |j|
  puts j unless j.nil?
end