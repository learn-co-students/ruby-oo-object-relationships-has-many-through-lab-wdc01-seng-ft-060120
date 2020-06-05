class Genre
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end 

    def self.all
        @@all
    end 

    def songs
        Song.all
    end 

    def artists
        songs.map{|song|song.artist}
    end 



end 