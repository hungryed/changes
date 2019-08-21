module Change
  class Errors
    class BaseError < StandardError; end
    class NoCentsProvided < BaseError; end
  end
end
