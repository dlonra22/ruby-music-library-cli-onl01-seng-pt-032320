require 'artist.rb'
class Song
  attr_accessor :artist, :genre
  attr_reader :name
  @@all= []
  def initialize(name, artist =nil, genre =nil)
    @name = name 
    @artist = artist
    @genre = genre 
  end 
  
  def self.create(name, artist = nil, genre =nil)
    song = self.new(name)
    if artist!= nil
      artist.add_song(song.name)
    end
    if genre!= nil
      song.genre = Genre.new(genre)
    end
    song.save
    song
  end
  
  def name=(songname)
    @name = songname
  end
  
  def add_genre(genrename)
    genreexist = Genre.all.detect{|g| g.name == genrename}
    if genreexist
      self.genre = genreexist
    elsif genrename != nil
      gne = Genre.new(genrename)
      self.genre = gne
    end
    self.genre
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
end