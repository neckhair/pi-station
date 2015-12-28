module PiStation
  module Outputs
    class Base
      include Commander::Methods

      def initialize(url)
        @url = URI.parse(url)
      end

      def write(data_bag)
        log "Writing #{data_bag.temperature} for #{data_bag.location}\n"
        req = Net::HTTP::Post.new(@url.to_s)
        req.body = data_bag.to_json
        Net::HTTP.start(@url.host, @url.port) { |http| http.request(req) }
      rescue Errno::ECONNREFUSED
        raise 'Not able to connect to Elasticsearch'
      end
    end
  end
end
