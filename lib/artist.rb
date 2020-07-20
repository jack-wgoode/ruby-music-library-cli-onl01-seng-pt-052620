include Concerns::Findable 
extend Concerns::Findable
class Artist
  
  
  attr_accessor  :name, :genre, :songs
  
  @@all = [] 
  
  def self.all 
    @@all 
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self 
  end
  
  def self.create(artist)
   artist = self.new(artist)
    artist.save 
    artist
  end
  
   def add_song(song)
     song.artist = self unless song.artist 
    @songs.push unless @songs.include?(song)
  end
  #   if song.artist == nil 
  #     song.artist = self
  #   else
  #     nil 
  #   end
  #   @song << song
  # end
  
   def songs
    Song.all.select {|song| song.artist == self}
   end
   
   def genres
    songs.collect  {|song| song.genre}.uniq
   end
  
  
   def self.destroy_all 
     self.all.clear 
   end
  
end
