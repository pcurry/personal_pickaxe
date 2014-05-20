#!/usr/bin/env ruby

## Page 16
# song1 = Song.new("Ruby Tuesday")
# song2 = Song.new("Enveloped in Python")
## and so on
## und zo weiter

puts "gin joint".length
puts "Rick".index("c")
puts 42.even?
# puts sam.play(song)

## Page 17
num      = -1234   # => -1234
positive = num.abs # => 1234

## Chapter 2.3
## Page 20

a = [ 1, 'cat', 3.14 ] # array of three elements
puts "The first element is #{a[0]}"
# set the third element
a[2] = nil
puts "The array is now #{a.inspect}"

a = [ 'ant', 'bee', 'cat', 'dog', 'elk' ]
a[0]   # => 'ant'
a[3]   # => 'dog'
# this is the same
a = %w{ ant bee cat dog elk }
a[0]   # => 'ant'
a[3]   # => 'dog'

inst_section = {
  'cello'    => 'string',
  'clarinet' => 'woodwind',
  'drum'     => 'percussion',
  'oboe'     => 'woodwind',
  'trumpet'  => 'brass',
  'violin'   => 'string'
}

p inst_section['oboe']
p inst_section['cello']
p inst_section['bassoon']

histogram = Hash.new(0)  # The default value is 0
histogram['ruby'] # => 0
histogram['ruby'] = histogram['ruby'] + 1
histogram['ruby'] # => 1


inst_section = {
  :cello    => 'string',
  :clarinet => 'woodwind',
  :drum     => 'percussion',
  :oboe     => 'woodwind',
  :trumpet  => 'brass',
  :violin   => 'string'
}
inst_section[:oboe]  # => 'woodwind'
inst_section[:cello] # => 'string'


