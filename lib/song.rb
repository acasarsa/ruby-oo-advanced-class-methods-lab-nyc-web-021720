require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
    # def initialize(name, artist_name)
    #   @name = name
    #   @artist_name = artist_name
    # end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    # song.name = name
    # artist_name = artist_name
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    # if !self.all.include?(song)
    #   song.save
    # end
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    
    # if !self.find_by_name(name)  
    #     self.create_by_name(name) 
      # unless self.all.include?(name) # possible other solution
      # end
      # i think this code functions as expected but does not pass rspec. with the previous code in .create_by_name
  end
    
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song_data = filename.split(/ - |.mp3/)
    artist_name = song_data[0]
    song_name = song_data[1]
    
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(filename)
    song_data = filename.split(/ - |.mp3/)
    artist_name = song_data[0]
    song_name = song_data[1]
    # i could not get this to work with self.new_from_filename(filename)
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    # self.new_from_filename(filename)
    
    # song.save
    # song
    # binding
  end

  def self.destroy_all
    self.all.clear
  end
  
  # binding.pry

end

song1 = Song.create_by_name("Purple Rain")
song2 = Song.create_by_name("End of the World")

# binding.pry

"Did I do it?"