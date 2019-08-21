module Change
  class Cli
    attr_reader :args

    class << self
      def change_for(args)
        new(*args).display_change
      end
    end

    def initialize(*args)
      @args = args
    end

    def display_change
      validate!
      p Change.change_for(cents.to_i)
    end

    private

    def validate!
      unless cents
        raise Errors::NoCentsProvided.new("You must provide an amount of cents")
      end
    end

    def cents
      args.first
    end
  end
end
