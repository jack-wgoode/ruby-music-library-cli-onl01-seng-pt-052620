class MusicImporter
  extend Concerns::Findable
  attr_accessor :path
  
  @@all = []
  
  def initialize(file_path)
    @path = file_path
    @@all << self
  end
  
  def path 
    @path 
  end
  
  def files 
    Dir.entries(path).delete_if do |char| char.size < 3 end 
  end 
  
  def import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end



  
end