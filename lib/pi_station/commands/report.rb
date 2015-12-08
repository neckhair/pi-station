module PiStation
  module Commands
    class Report
      def initialize(args, options)
        @args = args
        @options = options
      end

      def run
        o = PiStation::Outputs::Base.new
        o.write
      end
    end
  end
end
