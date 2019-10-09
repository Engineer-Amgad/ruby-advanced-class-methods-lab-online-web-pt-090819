class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song 
    return song
  end 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end 
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    song_object = self.find_by_name(name)
    
    if song_object
      return song_object
    else
      self.create_by_name(name)
    end 
  end 
  
  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end 
  
  def self.new_from_filename(file_name)
    artist_name = file_name.split(/[-,.]/)[0]
    name = file_name.split(/[-,.]/)[1]
  end 

end
