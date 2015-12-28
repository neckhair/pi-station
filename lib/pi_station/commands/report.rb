module PiStation
  module Commands
    class Report
      def initialize(args, options)
        @args = args
        @options = options
      end

      def run
        inputs.each_pair do |location, input|
          data_bag = input.read
          data_bag.location = location
          output.write data_bag
        end
      end

      def inputs
        @inputs ||= {
          aussen: PiStation::Inputs::MeteoSchweiz.new('BUS'),
          wohnzimmer: PiStation::Inputs::Serial.new(@options.serial),
        }
      end

      def output
        @output ||= PiStation::Outputs::Base.new @options.url
      end
    end
  end
end
