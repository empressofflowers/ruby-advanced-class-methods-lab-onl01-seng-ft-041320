require "pry"

class Song
  attr_accessor :name, :artist_name, :s_format
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
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
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    rows = filename.split(" ")
    song_array = rows.map do |row|
      data = row.split(", ")
      artist_name = data[0]
      name = data[1]
      s_format = data[2]
      song = self.new
      song.artist_name = artist_name
      song.name = name
      song.s_format = s_format
      binding.pry
    end
    song_array
  end

  def self.destroy_all
    @@all.clear
  end

end

#binding.pry
0
