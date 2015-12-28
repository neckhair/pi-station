require 'json'
require 'time'
require 'serialport'

module PiStation
  module Inputs
    class Serial
      BAUD_RATE = 9600
      DATA_BITS = 8
      STOP_BITS = 1
      PARITY = SerialPort::NONE
      MAX_TRIES = 10

      def initialize(port_string)
        @port_string = port_string
      end

      def read
        tries = 0
        temperature = nil
        until !temperature.nil? || tries == MAX_TRIES
          tries = tries + 1
          response = serial_port.readline("\r").chomp
          temperature = parse_data(response)
        end
        close_port
        PiStation::DataBag.new temperature: temperature, timestamp: Time.now
      end

      def close_port
        serial_port.close
      end

      def parse_data(raw)
        parsed = raw.match(/TEMP:([+-]?\d\d?\.?\d*)/)
        parsed ? parsed[1].to_f : nil
      end

      private

      def serial_port
        @serial_port ||= SerialPort.new(@port_string, BAUD_RATE, DATA_BITS, STOP_BITS, PARITY)
      end
    end
  end
end
