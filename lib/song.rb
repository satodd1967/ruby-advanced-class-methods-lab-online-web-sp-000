require "pry"

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
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find {|songs| songs.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
  else
    Song.find_by_name(name)
  end
end

  def self.alphabetical
    @@all.sort_by {|songs| songs.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.split(" - ")[1].split(".")[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(" - ")[0]
    song.name = filename.split(" - ")[1].split(".")[0]
    @@all << song
  end
  
  def self.destroy_all
    @@all.clear
  end

#binding.pry
end
