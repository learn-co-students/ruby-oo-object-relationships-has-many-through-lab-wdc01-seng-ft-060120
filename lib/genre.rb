class Genre

    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select{|song|song.genre == self}
    end

    def artists
        artists = []
        self.songs.each do |song|
            if !artists.include? song.artist
               artists << song.artist
            end 
        end
        artists
    end

end