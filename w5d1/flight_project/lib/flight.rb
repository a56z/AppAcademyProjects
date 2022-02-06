class Flight
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length >= @capacity
            return true
        else
            return false
        end
    end

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end
    end
    
    def list_passengers
        passenger_names = []
        @passengers.each do |passenger|
            passenger_names << passenger.name
        end
        return passenger_names
    end

    def [](num)
        @passengers[num]
    end

    def <<(passenger)
        board_passenger(passenger)
    end

end