require 'jar'
require 'array'

re = Regexp.new(ARGV.shift)

result = Dir.glob('**/*').select do |path|
  path =~ /\.jar$/
end.map(4) do |path|
  Jar.new path
end.select do |j|
  j.match? re
end.map do |j|
  j.matches
end

puts result