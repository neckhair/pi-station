require 'net/http'
require 'json'
require 'time'

module PiStation
  module Inputs
    class MeteoSchweiz
      def initialize(station_name)
        @station_name = station_name
        @url = URI.parse("http://opendata.netcetera.com/smn/smn/#{@station_name}")
      end

      def read
        req = Net::HTTP::Get.new(@url.to_s)
        res = Net::HTTP.start(@url.host, @url.port) { |http| http.request(req) }

        data = JSON.parse(res.body)
        PiStation::DataBag.new temperature: data['temperature'],
                               timestamp: Time.parse(data['dateTime'])
      end
    end
  end
end
