module Carrime

  class << self
    def carrier_from_tracking_number(tracking_number)
      carrier = Carrier.detect_carrier(tracking_number)
    end
  end

end

require 'lib/carrime/carrier'
