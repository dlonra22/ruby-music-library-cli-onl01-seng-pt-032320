require_relative 'config/environment.rb'
class  Artist 
  attr_accessor :name, :songs
  @@all =[]
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
    
  def self.all
    @@all
  end
  
  def add_song(songname)
    songexist = Song.all.detect{|s| s.name == songname && s.artist == self}
    if songexist
      songexist.artist = self
    else
      sng = Song.create(songname,self)
    end
    self.song
  end
  
  def songs
    Song.all.each do |s| 
      if s.artist == self
        @songs << s
      end
    end
    @songs
  end
  
  def genres
    self.songs.collect{|s| s.genre}
  end
  
  def self.destroy_all
    @@all.clear
  end
      
end