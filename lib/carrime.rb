module Carrime

  class << self
    def carrier_from_tracking_number(tracking_number)
      carrier = get_carrier_from_tracking_number(tracking_number)
    end

    private
    def get_carrier_from_tracking_number(tracking_number)
      tn = TrackingNumber.new(:tracking_number => tracking_number)
      carrier = Carrier.find_from_tracking_number(tn.tracking_number)
    end

    #def create_tracking_number_obj(tracking_number)
      #obj = TrackingNumber.new(:tracking_number => tracking_number)
    #end
  end

end

require 'lib/carrime/carrier'
require 'lib/carrime/tracking_number'
