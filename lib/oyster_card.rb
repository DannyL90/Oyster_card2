class OysterCard

    attr_reader :balance, :in_use
    attr_accessor :limit
    DEFAULT_LIMIT = 90

    def initialize
        @balance = 0
				@in_use = false
        @limit = DEFAULT_LIMIT
    end

    def top_up(value)
        fail "The maximum limit of £#{@limit} is reached" if full?
        @balance += value
    end

    def full?
      @balance >= @limit
    end

    def deduct(value)
      @balance -= value
    end

    def touch_in
			@in_use = true
    end

		def touch_out
			@in_use = false
    end

		def in_journey?
			@in_use
		end
end