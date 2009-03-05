module Carrime
  class Carrier
    attr_reader :name
    attr_reader :url
    attr_reader :phone

    def initialize(opts={})
      @name                 = opts[:name]
      @url                  = opts[:url]
      @phone_number         = opts[:phone_number]
    end

    class << self
      def fedex
        self.new( 
                  :name => "FedEx",
                  :url  => "http://fedex.com/Tracking?ascend_header=1&clienttype=dotcom&cntry_code=us&language=english&tracknumbers=%s",
                  :phone_number => "1-800-238-5355",
                )
      end

      def fedex_freight
        self.new( 
                  :name => "FedEx Freight",
                  :url  => "http://www.fedexfreight.fedex.com/track.jsp?link=1",
                  :phone_number => "1-800-332-0807",
                )
      end

      def dhl
        self.new( 
                  :name => "DHL",
                  :url  => "http://fedex.com/Tracking?ascend_header=1&clienttype=dotcom&cntry_code=us&language=english&tracknumbers=%s",
                  :phone_number => "1-800-332-0807",
                )
      end

    end #class << self

    def detect_fedex(tracking_number)
      tracking_number =~ /^(961301|732|365|JKT|03722|01086|14232|216423|360670|005417|420629|712|944|865)/ ? return true : return false
    end

    def detect_fedex_freight(tracking_number)
    end

    def detect_fedex_dhl(tracking_number)
    end

  end
end
