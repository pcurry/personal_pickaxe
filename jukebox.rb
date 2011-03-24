
class Song
  @@plays = 0

  attr_reader :name, :artist, :duration
  attr_writer :duration

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
  end

  def to_s
    "Song: #@name--#@artist (#@duration)"
  end

  def duration_in_minutes
    @duration/60.0  # force floating point
  end

  def play
    @plays += 1 
    @@plays += 1 
  end

end



class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics = lyrics
  end
  
  # Format ourselvs as a string by appending 
  # our lyrics to our parent's #to_s value.
  def to_s
    super + " [#@lyrics]"
  end
end


class SongList
  MAX_TIME = 5*60    # 5 minutes per song max
  
  def SongList.is_to_long(song)
    return song.duration > MAX_TIME
  end

  def initialize
    @songs = Array.new
  end

  def append(song)
    @songs.push(song)
  end

  def delete_first
    @songs.shift
  end

  def delete_last
    @songs.pop
  end

  def [](index)
    @songs[index]
  end

  def with_title(title)
    @song.find {|song| title == song.name}
  end

end


class MyLogger
  private_class_method :new
  @@logger = nil
  def MyLogger.create
    @@logger = new unless @@logger
    @@logger
  end
end


class WordIndex
  def initialize
    @index = {}
  end
  
  def add_to_index(obj, *phrases)
    phrases.each do |phrase|
      phrase.scan(/\w[-\w']+/) do |word|  # extract each word
        word.downcase!
        @index[word] = [] if @index[word].nil?
        @index[word].push(obj)
      end
    end
  end

  def lookup(word)
    @index[word.downcase]
  end
end



require 'test/unit'
class TestSongList < Test::Unit::TestCase
  def test_delete
    list = SongList.new
    s1 = Song.new('title1', 'artist1', 1)
    s2 = Song.new('title2', 'artist2', 2)
    s3 = Song.new('title3', 'artist3', 3)
    s4 = Song.new('title4', 'artist4', 4)
    
    list.append(s1).append(s2).append(s3).append(s4)

    assert_equal(s1, list[0])
    assert_equal(s3, list[2])
    assert_nil(list[9])

    assert_equal(s1, list.delete_first) 
    assert_equal(s2, list.delete_first) 
    assert_equal(s4, list.delete_last) 
    assert_equal(s3, list.delete_last) 
  end
end
