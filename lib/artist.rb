class Artist

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
        return Song.all.select {|song| song.artist == self}
    end

    def new_song(song_name, song_genre)
        new_song = Song.new(song_name, self, song_genre)
    end

    def genres
        return songs.map {|song| song.genre}.uniq
    end

end