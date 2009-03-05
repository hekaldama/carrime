module Carrime
  class TrackingNumber
    attr_accessor :tracking_number

    def initialize(opts={})
      @tracking_number = opts[:tracking_number]
    end

  end
end
