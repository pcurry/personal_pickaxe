

def stringtest_songdata
  File.open("songdata") do |song_file|
    songs = SongList.new
    song_file.each do |line|
      file, length, name, title = line.chomp.split(/\s*\|\s*/)
      name.squeeze!(" ")
      mins, secs = length.scan(/\d+/)
      songs.append(Song.new(title, name, mins.to_i*60+secs.to_i))
    end
    puts songs.lookup("Fats")
    puts songs.lookup("ain't")
    puts songs.lookup("RED")
    puts songs.lookup("WoRlD")
  end
end

def show_regexp(a, re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end


class VowelFinder
  include Enumerable
  
  def initialize(string)
    @string = string
    end

  def each
    @string.scan(/[aeiou]/) do |vowel|
      yield vowel
    end
  end
end

module Summable
  def sum
    inject {|v,n| v+n}
  end
end

module Observable
  # Naively implemented code to enable observer pattern?
  def observers
    @observer_list ||= []
  end
  
  def add_observer(obj)
    observers << obj
    end

  def notify_observers
    observers.each {|o| o.update }
  end
end

class TelescopeScheduler
  # other classes can register to get notifications
  # when the schedule changes
  include Observable
  def initialize
    @observer_list = [] # folks with telescope time
  end

  def add_viewer(viewer)
    @observer_list << viewer
  end
  # ... Here's where it could all go badly wrong.
end

module Test
  State = {}
  def state=(value)
    State[object_id] = value
  end
  def state
    State[object_id]
  end
end

class Client 
  include Test
end
