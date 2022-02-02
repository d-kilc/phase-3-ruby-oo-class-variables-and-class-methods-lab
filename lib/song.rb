class Song
    attr_reader :name, :artist, :genre

    @@count = 0
    @@artists = []
    @@genres = []

    def initialize name, artist, genre
        @name = name
        @artist = artist
        @genre = genre

        @@count += 1
        @@artists.push artist
        @@genres.push genre
    end

    def self.count
        @@count
    end

    def self.artists
        @@artists.uniq
    end

    def self.genres
        @@genres.uniq
    end

    def self.genre_count
        @@genres.group_by(&:itself).transform_values!(&:size)
    end

    def self.artist_count
        @@artists.group_by(&:itself).transform_values!(&:size)
    end

end

test = Song.new 'jet lag','future and juice wrld ft young scooter', 'rap'
test1 = Song.new 'mambo no 5','lou bega', 'idk dude'
test2 = Song.new 'vengabus','vengaboys', 'electronic'

pp Song.genre_count
