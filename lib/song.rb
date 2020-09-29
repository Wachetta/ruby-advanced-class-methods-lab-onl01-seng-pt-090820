require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = Song.new
    song.save
  end
  

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
    end 
  
   def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    end 
  

    def self.find_by_name(name)
      @@all.find{|title| title.name == name}
    end
 
    def self.find_or_create_by_name(name)
      self.create_by_name(name)
      self.find_by_name(name)
    end
    
    def self.alphabetical
      @@all.sort_by{|x| x.name}
      #binding.pry
    end

    def self.new_from_filename(mp3)
      songs = mp3
      data = songs.split(" - ")
      artist = data[0]
      song = data[1].chomp(".mp3")
      Song.name = song
      Song.artist_name = artist
      end
end
