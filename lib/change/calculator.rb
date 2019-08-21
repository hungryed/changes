module Change
  class Calculator
    attr_reader :cents
    US_CENTS = [
      25,
      10,
      5,
      1
    ]

    def initialize(cents)
      @cents = cents
    end

    def mapped_change
      cents_remaining = cents
      US_CENTS.each_with_object({}) do |current_coin, memo|
        memo[current_coin] = cents_remaining / current_coin

        cents_remaining = (cents_remaining % current_coin)
      end.reject { |_, v| v == 0 }
    end
  end
end

