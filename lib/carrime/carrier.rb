module Carrime
  class Carrier
    attr_reader :name
    attr_reader :url
    attr_reader :phone

    @@carrier_to_valid_tracking_number = {
      "fedex"                      => /^(961301|732|365|JKT|03722|01086|14232|216423|360670|005417|420629|712|944|865)/,
      "old_dominion"               => /^(17200|900|05505|63)/,
      "central_freight"            => /^(6154)/,
      "dhl"                        => /^(867)/,
      "fedex_freight"              => /^(160|167|168|02610|177)/,
      "ups"                        => /^1Z/i,
      "ups_freight"                => /^(582|224|564)/,
      "yellow_freight"             => /^(274|088|340)/,
      "averitt_express"            => /^(01093|0309|309)/,
      "benton_express"             => /^JKN/i,
      "usf"                        => /^(145199|5081)/,
      "aaa_cooper"                 => /^529/,
      "milan_express"              => /^(0011|00120|0073)/,
      "estes_express"              => /^(037|135|225|076|077|01096|188)/,
      "southeastern_freight_lines" => /^(183|184|180|366|367|185|408|409|187)/,
      "a_duie_pyle_freight"        => /^(144)/,
      "volunteer_express"          => /^(107)/,
      "abf_freight_systems"        => /^(0125|0508)/,
      "vitran_express"             => /^(003)/,
      "dayton_freight"             => /^(00128)/,
      "roadrunner_dawes"           => /^(129155)/,
      "roadway"                    => /^(931|435)/
    }

    def initialize(opts={})
      @name                 = opts[:name]
      @url                  = opts[:url]
      @phone_number         = opts[:phone_number]
    end

    class << self
      def detect_carrier(tracking_number)
        @@carrier_to_valid_tracking_number.each do |carrier, valid_tracking_number|
          begin
            return self.send(carrier) if (tracking_number =~ valid_tracking_number)
          rescue NoMethodError
            return nil
          end
        end
        nil
      end

      # Describe all possible carriers
      def fedex
        self.new( 
                  :name => "FedEx",
                  :url  => "http://fedex.com/Tracking?ascend_header=1&clienttype=dotcom&cntry_code=us&language=english&tracknumbers=%s",
                  :phone_number => "1-800-238-5355"
                )
      end
      def fedex

      end

      def old_dominion
        self.new( 
                  :name => "Old Dominion",
                  :url  => "http://www.odfl.com/trace/Trace10.jsp",
                  :phone_number => "1-800-235-5569"
                )
      end

      def central_freight
        self.new( 
                  :name => "Central Freight",
                  :url  => "http://www.centralfreight.com/portal/mkoi55.aspx?freightbill=",
                  :phone_number => "1-800-235-5569"
                )
      end

      def dhl
        self.new( 
                  :name => "DHL",
                  :url  => "http://fedex.com/Tracking?ascend_header=1&clienttype=dotcom&cntry_code=us&language=english&tracknumbers=",
                  :phone_number => "1-800-332-0807"
                )
      end

      def fedex_freight
        self.new( 
                  :name => "FedEx Freight",
                  :url  => "http://www.fedexfreight.fedex.com/track.jsp?link=1",
                  :phone_number => "1-800-332-0807"
                )
      end

      def ups
        self.new( 
                  :name => "UPS",
                  :url  => "http://wwwapps.ups.com/WebTracking/processInputRequest?sort_by=status&tracknums_displayed=1&TypeOfInquiryNumber=T&loc=en_US&InquiryNumber1=",
                  :phone_number => "1-800-742-5877"
                )
      end

      def ups_freight
        self.new( 
                  :name => "UPS Freight",
                  :url  => "http://ltl.upsfreight.com/shipping/tracking/index.aspx",
                  :phone_number => "1-800-333-7400"
                )
      end

      def yellow_freight
        self.new( 
                  :name => "Yellow Freight",
                  :url  => "http://www.myyellow.com/dynamic/services/yfsgentracking/trackpro.jsp",
                  :phone_number => "1-800-610-6500"
                )
      end

      def averitt_express
        self.new( 
                  :name => "Averitt Express",
                  :url  => "http://fedex.com/Tracking?ascend_header=1&clienttype=dotcom&cntry_code=us&language=english&tracknumbers=%s",
                  :phone_number => "1-800-332-0807"
                )
      end

      def benton_express
        self.new( 
                  :name => "Benton Express",
                  :url  => "http://www.accessbenton.com/Tracking/Search",
                  :phone_number => "1-888-4BENTON"
                )
      end

      def usf
        self.new( 
                  :name => "USF",
                  :url  => "http://usfreightways.com/shipmentStatus/advanced_track_shipments_validations.jsp?trackType=H&zipType=D&PO=&ZP=&mode=1&proNumber=",
                  :phone_number => "1-866-465-5263"
                )
      end

      def aaa_cooper
        self.new( 
                  :name => "AAA Cooper",
                  :url  => "http://www.aaacooper.com/tts/anontts.html",
                  :phone_number => "1-800-633-7571"
                )
      end

      def milan_express
        self.new( 
                  :name => "Milan Express",
                  :url  => "http://milanexpress.com/dynamic/shiptrac.asp",
                  :phone_number => "1-800-231-7303"
                )
      end

      def estes_express
        self.new( 
                  :name => "Estes Express",
                  :url  => "http://www.estesexpress.com/cgi-dta/edn419.mbr/output?search_type=F&search_criteria=%s&submit=Submit",
                  :phone_number => "1-877-268-4555"
                )
      end

      def southeatern_freight_lines
        self.new( 
                  :name => "Southeastern Freight Lines",
                  :url  => "https://www.sefl.com/seflWebsite/shipping/Tracing.jsp",
                  :phone_number => "1-800-637-7335"
                )
      end

      def a_duie_pyle_freight
        self.new( 
                  :name => "A. Duie Pyle Freight",
                  :url  => "http://www.aduiepyle.com/pyleco/PublicDocs/LTLPROTracking.html"
                )
      end

      def volunteer_express
        self.new( 
                  :name => "Volunteer Express",
                  :url  => "http://apps.volunteerexpress.com/data/singlesearch.asp",
                  :phone_number => "1-800-251-1015"
                )
      end

      def abf_freight_systems
        self.new( 
                  :name => "ABF Freight systems",
                  :url  => "https://www.abfs.com/tools/trace/default.asp?hidSubmitted=Y&refno0=%s&reftype0=A",
                  :phone_number => "1-800-610-5544"
                )
      end

      def vitran_express
        self.new( 
                  :name => "Vitran Express",
                  :url  => "http://www.vitranexpress.com/tracing/tracing2.aspx?epr=",
                  :phone_number => "1-800-967-3331"
                )
      end

      def dayton_freight
        self.new( 
                  :name => "Dayton Freight",
                  :url  => "http://www.daytonfreight.com/customerTools/proTrack.aspx?proNum=",
                  :phone_number => "1-800-860-5102"
                )
      end

      def roadrunner_dawes
        self.new( 
                  :name => "Roadrunner Dawes",
                  :url  => "http://www.rdfs.com/tools/tracing/TraceMultipleResults.aspx?PROS=",
                  :phone_number => "1-414-615-1500"
                )
      end

      def roadway
        self.new( 
                  :name => "Roadway",
                  :url  => "http://www.quiktrak.roadway.com/cgi-bin/quiktrak"
                )
      end

    end #class << self

  end
end
