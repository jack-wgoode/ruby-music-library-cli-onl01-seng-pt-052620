include  Concerns::Findable

extend Concerns::Findable
class Song 
  
  attr_accessor :name, :genre, :artist 
  
  @@all = [] 
  
  def self.all 
    @@all 
  end
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist if artist != nil
    @genre = genre if genre != nil
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  # def self.find_or_create_by_name(name)
  #     find_by_name(name) ? find_by_name(name) : self.create(name)
  
  # end
    
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)  
  end
   
  
  # def self.initialize_with_artist_name(name, artist)
  #   @name = name 
  #   @artist = artist
  #   save
  # end 
    
  
  def save
    @@all << self 
  end
  
  
  
  def self.find_by_name(name)
      @@all.find{|song| song.name == name}
  end
  
  def self.create_from_filename(filename)
     self.new_from_filename(filename)
   end
    
  
  # def self.new_from_filename(filename)
  #   array = filename.split(" - ")
  #   song_name = array[1]
  #   artist_name = array[0]
  #   genre_name = array[2].split(".mp3").join
  #   artist = Artist.find_or_create_by_name(artist_name)
  #   genre = Genre.find_or_create_by_name(genre_name)
  #   self.new(song_name, artist, genre)
  #end
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre).save
  end
  
  def self.sort_by_name
    self.all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
  end 

def self.list_by_name
self.all.each.with_index(1) do |song, index|
  puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
  end
end
  
  
  
  
  def self.destroy_all 
    self.all.clear 
  end
  
  
end 
