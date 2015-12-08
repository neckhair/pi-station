module PiStation
  module Inputs
    class Base
      def read
        fail NotImplementedError
      end
    end
  end
end
