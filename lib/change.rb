require_relative "change/errors"
require_relative "change/cli"
require_relative "change/calculator"

module Change
  class << self
    def change_for(cents)
      Calculator.new(cents).mapped_change
    end
  end
end

