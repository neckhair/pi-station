require 'spec_helper'
require 'pi_station/inputs/serial'
require 'pi_station/data_bag'

RSpec.describe PiStation::Inputs::Serial do
  let(:instance) { described_class.new '/dev/tty1' }
  let(:data) { 'TEMP:21.2' }
  let(:serial_port) { instance_double SerialPort, readline: 'TEMP:21.2', close: true }

  before do
    allow(instance).to receive(:serial_port).and_return(serial_port)
  end

  describe '#read' do
    subject { instance.read }

    it 'returns a databag' do
      expect(subject).to be_a PiStation::DataBag
      expect(subject.temperature).to eq 21.2
    end
  end

  describe '#parse_data' do
    it 'parses correctly formated data' do
      expect(instance.parse_data('TEMP:21.2')).to eq 21.2
    end

    it 'parses integer values' do
      expect(instance.parse_data('TEMP:21')).to eq 21.0
    end

    it 'parses below zero temperatures' do
      expect(instance.parse_data('TEMP:-1.0')).to eq(-1.0)
    end

    it 'is nil when the data is not parseable' do
      expect(instance.parse_data('TEM')).to be_nil
    end
  end
end
