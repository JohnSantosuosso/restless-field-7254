# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    airline_1 = Airline.create(name: 'Delta')
    airline_2 = Airline.create(name: 'United')
    flight_1 = Flight.create(number: 'DL123', date: '01/01/2017', departure_city: 'Denver', arrival_city: 'New York', airline_id: airline_1.id)
    flight_2 = Flight.create(number: 'DL124', date: '01/01/2018', departure_city: 'Phoenix', arrival_city: 'New York', airline_id: airline_1.id)
    flight_3 = Flight.create(number: 'UA123', date: '01/01/2018', departure_city: 'Phoenix', arrival_city: 'New York', airline_id: airline_2.id)
    passenger_1 = Passenger.create(name: 'John Doe', age: 15)
    passenger_2 = Passenger.create(name: 'Jane Doe', age: 30)
    passenger_3 = Passenger.create(name: 'John Smith', age: 35)
    flight_passenger_1 = FlightPassenger.create(flight_id: flight_1.id, passenger_id: passenger_1.id)
    flight_passenger_2 = FlightPassenger.create(flight_id: flight_2.id, passenger_id: passenger_2.id)
    flight_passenger_3 = FlightPassenger.create(flight_id: flight_3.id, passenger_id: passenger_3.id)
