
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
    @index = WordIndex.new
  end

  def append(song)
    @songs.push(song)
    @index.add_to_index(song, song.name, song.artist)
    self
  end

  def lookup(word)
    @index.lookup(word)
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
        @index[word].push(obj) if @index[word].index(obj).nil?
      end
    end
  end

  def lookup(word)
    @index[word.downcase]
  end
end


class VU
  include Comparable
  attr :volume
  def initialize(volume)  # 0..9
    @volume = volume
  end
  
  def inspect
    '#' * @volume
  end
  
  # Support for other ranges
  def <=>(other)
    self.volume <=> other.volume
  end

  def succ
    raise(IndexError, "Volume too big") if @volume >= 9
    VU.new(@volume.succ)
  end
end
