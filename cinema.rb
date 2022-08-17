class Cine
    # setter y getters
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
    # class variable
    @@room_identifier = 0
    attr_accessor :movie, :price_ticket, :identifier, :seats

    def initialize(movie, price_ticket)
        # TODO: Check if movie is an object from Movie class
        # raise an exception
        @movie = movie
        @price_ticket = price_ticket
        @identifier = self.class.generate_identifier
        @seats = []
    end

    def generate_seats(columns, rows)
        # deberia recibir un numero de columnas y de filas, y generar la matriz de sillas
        # ej generate_seats(5, 5)  --> columnas 5, ['A', 'B', 'C', 'D', 'E']
                                   # --> filas 5 , [1,2,3,4,5]
                                   # ej sillas A1, A2, A3 ... B1, B2 ...

        columns_array = ('A'..'Z').to_a.take(columns)
        rows_array = (1..rows).to_a

        columns_array.each do |column|
            rows_array.each do |row|
                seat = Seat.new(column, row)
                seats.push(seat)
            end
        end
    end

    def assign_seat(user_to_sit)
        # 1- Obtener todas las sillas desocupadas
        seats_unoccupied = seats.select {|seat| !seat.occupied?}
        puts "Las sillas desocupadas son:"
        p seats_unoccupied
        # 2- si hay sillas desocupadas, randomicamente obtener una silla y pasar a 3
            # sino, mostrar un mensaje
        # 3- asignar la silla al usuario
        if seats_unoccupied.empty?
            puts "No hay sillas"
        else
            seat = seats_unoccupied.sample
            seat.user = user_to_sit
        end

    end

    def self.generate_identifier
        #@@room_identifier = @@room_identifier + 1
        @@room_identifier += 1
    end
end

class Seat
    # setters y getters
    # setter es un metodo que me permite asignar un valor a la variable de instancia
        # nombre_variable_instancia=
    # getter es un metodo que me permite obtener el valor de una variable de instancia
        # nombre_variable_instancia
    attr_accessor :column, :row, :user

    def initialize(column, row, user= nil)
        @column = column
        @row = row
        @user = user
    end

    def occupied?
        !user.nil?
    end
end

class User
    attr_accessor :name, :age, :money

    def initialize(name, age, money)
        @name = name
        @age = age
        @money = money
    end
end



movie1 = Movie.new("Shrek", "2 hrs", 7, "Andrew Adamson")
movie2 = Movie.new("Matrix", "2,5 hrs", 13, "Pepe Grillo")
cine = Cine.new("Astor", "Cra 30") # TODO: implement singleton pattern to avoid instance more than one object

cine.create_movie_room(movie1, 15000)
cine.create_movie_room(movie1, 25000)
cine.create_movie_room(movie2, 25000)

movie_room1 = cine.movie_rooms[0]
movie_room2 = cine.movie_rooms[1]
movie_room3 = cine.movie_rooms[2]

puts "ANTES"
p movie_room1.seats

movie_room1.generate_seats(8, 9)
puts "DESPUES"
p movie_room1.seats

# movie_room1.generate_seats([1,2,3,10])
# p movie_room1.seats
# jose = User.new("Jose", 20, 5000)
# movie_room1.assign_seat(jose)
# p movie_room1.seats

# nico = User.new("Nico", 18, 5000)
# movie_room1.assign_seat(nico)
# p movie_room1.seats

# migue = User.new("Migue", 18, 5000)
# movie_room1.assign_seat(migue)
# p movie_room1.seats

# yony = User.new("Yony", 39, 5000)
# movie_room1.assign_seat(yony)
# p movie_room1.seats


# juan = User.new("juan", 39, 5000)
# movie_room1.assign_seat(juan)
# p movie_room1.seats
# a1 = Seat.new('A', 1)
# a2 = Seat.new('A', 2)
# p a1
# jose = User.new("Jose", 20, 5000)
# p jose

# a1.user = jose

# p a1
# p a1.user
# p a2.user
# puts a1.occupied?
# puts a2.occupied?

#p cine

#p cine.movie_rooms

#puts cine.movie_rooms_number

#RETO
# Hacer un menu, que permita ejecutar las acciones del programa
# opcion para crear un cine
# opcion para crear una pelicula
# opcion para crear salas de cine
# opcion para generar sillas
# opcion para crear usuarios
# opcion para asignar usuarios a las sillas
# ver como esta la sala de cine (diseño)


