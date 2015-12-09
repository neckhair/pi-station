module PiStation
  module Outputs
    class Base
      def initialize
        @url = URI.parse('http://es.neckhair.ch/measurements/temperature')
      end

      def write(data_bag)
        req = Net::HTTP::Post.new(@url.to_s)
        req.body = data_bag.to_json
        Net::HTTP.start(@url.host, @url.port) { |http| http.request(req) }
      end
    end
  end
end
