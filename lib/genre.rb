class Genre 
  attr_accessor :name
  @@all = []
  def initialize(name, songs=[])
    @name = name 
    @songs = songs
  end
  
  def self.all
    @@all
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def save
    @@all << self
  end

  
  def songs
    Song.all.each do |s|
      if s.genre == self
       @songs << s
      end
    end
    @songs
  end
  
  def artists
    self.songs.collect{|s| s.artist}
  end
  
  def self.destroy_all
    @@all.clear
  end
end
  
  
  