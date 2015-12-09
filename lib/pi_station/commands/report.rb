module PiStation
  module Commands
    class Report
      def initialize(args, options)
        @args = args
        @options = options
      end

      def run
        inputs = { aussen: PiStation::Inputs::MeteoSchweiz.new('BUS') }
        output = PiStation::Outputs::Base.new

        inputs.each_pair do |location, input|
          data_bag = input.read
          data_bag.location = location
          output.write data_bag
        end
      end
    end
  end
end
