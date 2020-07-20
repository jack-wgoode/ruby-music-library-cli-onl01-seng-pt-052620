
class MusicLibraryController 
  
  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end
  
   
  def call
    input = ""
    while input != 'exit'
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip.downcase
   end
  end 
  
  
  # def list_songs
  #   Song.sort_by_name
  #   Song.list_by_name
  # end
  
  # def list_artists
  #   Artist.sort_by_name
  #   #Artist.list_by_name
  # end
  
  def list_songs
    Song.sort_by_name.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

   def list artists
     Artist.sort_by_name
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
    end
  end
  
  
  
  
  
  def list_artist
    puts "What artist by name you like to list songs for?"
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |s,i|
        puts "#{i}. #{s}"
      end
    end
  end

  def list_genres
    genres = Genre.all.sort {|a,b| a.name <=> b.name}
    genres.each.with_index(1) {|genre, i| puts "#{i}. #{genre.name}"}
  end
   
  end
  


  
 