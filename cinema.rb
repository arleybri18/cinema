class Cine
    attr_accessor :name, :address, :movie_rooms

    def initialize(name, address)
      @name = name
      @address = address
      @movie_rooms = []
    end

    def create_movie_room(movie, price_ticket)
        # crear un movie_room
        movie_room = MovieRoom.new(movie, price_ticket)
        # adicionar el movie_room al array de movie_rooms
        movie_rooms.push(movie_room)
    end

    def movie_rooms_number
        movie_rooms.size
    end
end


class Movie
    # setters y getters
    attr_accessor :title, :duration, :min_age, :director
    
    def initialize(title, duration, min_age, director)
        @title = title
        @duration = duration
        @min_age = min_age
        @director = director
    end
end

class MovieRoom
    @@room_identifier = 0
    attr_accessor :movie, :price_ticket, :identifier

    def initialize(movie, price_ticket)
        # TODO: Check if movie is an object from Movie class
        # raise an exception
        @movie = movie
        @price_ticket = price_ticket
        @identifier = self.class.generate_identifier
    end

    def self.generate_identifier
        #@@room_identifier = @@room_identifier + 1
        @@room_identifier += 1
    end
end

movie1 = Movie.new("Shrek", "2 hrs", 7, "Andrew Adamson")
cine = Cine.new("Astor", "Cra 30") # TODO: implement singleton pattern to avoid instance more than one object

cine.create_movie_room(movie1, 15000)
cine.create_movie_room(movie1, 25000)
p cine

p cine.movie_rooms

#puts cine.movie_rooms_number
