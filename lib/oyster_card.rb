class OysterCard

    attr_reader :balance, :in_use, :entry_station
    attr_accessor :limit
    DEFAULT_LIMIT = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
				@in_use = false
        @limit = DEFAULT_LIMIT
        @minimum_fare = MINIMUM_FARE
				@entry_station = entry_station
    end

    def top_up(value)
        fail "The maximum limit of £#{@limit} is reached" if full?
        @balance += value
    end

    def full?
      @balance >= @limit
    end

    def touch_in(station)
			@entry_station = station
      fail "Not enough fund" if @balance < @minimum_fare
    end

	  def touch_out
			deduct(MINIMUM_FARE)
		  @entry_station = nil
    end

	  def in_journey?
		  !!entry_station
	  end

		private

		def deduct(value)
      @balance -= value
    end
end