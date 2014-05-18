#!/usr/bin/env ruby

def say_goodnight(name)
  result = "Good night, " + name
  return result
end

# Time for bed

puts say_goodnight("John-Boy")
puts say_goodnight("Mary-Ellen")

puts "And good night, \nGrandma!"


def say_goodnight(name)
  result = "Good night, #{name}"
  return result
end

puts say_goodnight('Pa')


def say_goodnight(name)
  result = "Good night, #{name.capitalize}"
  return result
end

puts say_goodnight('uncle')


def say_goodnight(name)
  "Good night, #{name.capitalize}"
end

puts say_goodnight('ma')

