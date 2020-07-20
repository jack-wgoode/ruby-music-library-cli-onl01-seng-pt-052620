include Concerns::Findable 
extend Concerns::Findable

class Genre
  
  attr_accessor  :name 
  attr_reader :artist, :genre
  
  @@all = [] 
  
  def self.all 
    @@all 
  end
  
  def initialize(name)
    @name = name 
    save
  end
  
  def save
    @@all << self 
  end
  
  def self.create(name)
    self.new(name)
    
  end
  
  def songs
    Song.all.select {|song| song.genre == self}
  end
  
  def artists
    songs.collect  {|song| song.artist}.uniq
  end
  
  
  def self.destroy_all 
    self.all.clear 
  end
  
  def self.count 
    @@all.count 
  end
  
  
    
  
end  
  
  