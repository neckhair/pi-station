require 'json'

module PiStation
  class DataBag
    attr_accessor :timestamp, :location, :temperature

    def initialize(options = {})
      @timestamp = options[:timestamp] || Time.now
      @location = options[:location]
      @temperature = options[:temperature].to_f
    end

    def to_json
      {
        timestamp: @timestamp.to_i * 1000,
        location: @location,
        value: @temperature,
      }.to_json
    end
  end
end
