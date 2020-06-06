require_relative './song.rb'
require_relative './genre.rb'
class Artist
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name 
    @@all << self
  end

  def self.all 
    @@all
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def new_song(name, genre)
    Song.new(name, self, genre)
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

end