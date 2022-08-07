require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  it 'shows all flight numbers and the name of the airline next to each' do
    airline_1 = Airline.create(name: 'Delta')
    airline_2 = Airline.create(name: 'United')
    flight_1 = Flight.create(number: 'DL123', date: '01/01/2017', departure_city: 'Denver', arrival_city: 'New York', airline_id: airline_1.id)
    flight_2 = Flight.create(number: 'UA123', date: '01/01/2018', departure_city: 'Phoenix', arrival_city: 'New York', airline_id: airline_2.id)
    passenger_1 = Passenger.create(name: 'John Doe')
    passenger_2 = Passenger.create(name: 'Jane Doe')
    flight_passenger_1 = FlightPassenger.create(flight_id: flight_1.id, passenger_id: passenger_1.id)
    flight_passenger_2 = FlightPassenger.create(flight_id: flight_2.id, passenger_id: passenger_1.id)
    flight_passenger_3 = FlightPassenger.create(flight_id: flight_2.id, passenger_id: passenger_2.id)

    visit '/flights'

    within("#flight-#{flight_1.id}") do
      expect(page).to have_content(flight_1.number)
      expect(page).to have_content(flight_1.airline.name)
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_no_content(flight_2.number)
      expect(page).to have_no_content(flight_2.airline.name)
      expect(page).to have_no_content(passenger_2.name)
    end

    within("#flight-#{flight_2.id}") do
      expect(page).to have_content(flight_2.number)
      expect(page).to have_content(flight_2.airline.name)
      expect(page).to have_content(passenger_1.name)
      expect(page).to have_content(passenger_2.name)
      expect(page).to have_no_content(flight_1.number)
      expect(page).to have_no_content(flight_1.airline.name)
    end
  end

  it 'allows me to remove a passenger from a flight' do
    airline_1 = Airline.create(name: 'Delta')
    airline_2 = Airline.create(name: 'United')
    flight_1 = Flight.create(number: 'DL123', date: '01/01/2017', departure_city: 'Denver', arrival_city: 'New York', airline_id: airline_1.id)
    flight_2 = Flight.create(number: 'UA123', date: '01/01/2018', departure_city: 'Phoenix', arrival_city: 'New York', airline_id: airline_2.id)
    passenger_1 = Passenger.create(name: 'John Doe')
    passenger_2 = Passenger.create(name: 'Jane Doe')
    flight_passenger_1 = FlightPassenger.create(flight_id: flight_1.id, passenger_id: passenger_1.id)
    flight_passenger_2 = FlightPassenger.create(flight_id: flight_2.id, passenger_id: passenger_1.id)
    flight_passenger_3 = FlightPassenger.create(flight_id: flight_2.id, passenger_id: passenger_2.id)

    visit '/flights'

    within("#flight-#{flight_2.id}") do
      expect(page).to have_button("Remove Passenger #{passenger_1.name}")

      click_button "Remove Passenger #{passenger_1.name}"

      expect(page).to have_no_content(passenger_1.name)
    end

    within("#flight-#{flight_1.id}") do
      expect(page).to have_content(passenger_1.name)
    end
  end

end
