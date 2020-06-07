class Genre

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name

        @@all.push(self)
    end

    def self.all
        return @@all
    end

    def songs
        return Song.all.select {|song| song.genre == self}
    end

    def artists
        return songs.map {|song| song.artist}
    end

end