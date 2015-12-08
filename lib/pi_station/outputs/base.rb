module PiStation
  module Outputs
    class Base
      def write
        fail NotImplementedError
      end
    end
  end
end
