# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::SMS#create
      class SMSCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute number_type
        #   Sender type. Decides the provisioning flow and what compliance is asked for.
        #
        #   [Required] so the published document says so. The validator has always demanded
        #   it, but requiredness reached the schema by matching a rule to a property name —
        #   which works for country, whose wire name is its camel-cased C# name, and
        #   silently does not for number_type. A client generating a request from our
        #   OpenAPI therefore sent what the document called sufficient and was answered 400.
        #
        #   @return [Symbol, Sentdm::Models::Channels::SMSCreateParams::NumberType]
        required :number_type, enum: -> { Sentdm::Channels::SMSCreateParams::NumberType }

        # @!attribute area_codes
        #   The area codes to put this sender in, in your own order of preference, e.g.
        #   ["415", "628"] for the US or ["20"] for London. Omit it and a number is claimed
        #   anywhere in the country.
        #
        #   Ordered, and the order is the request. The claim tries each code in turn and
        #   stops at the first that yields a number. Nothing sorts the list and a code
        #   listed twice is refused.
        #
        #   One to fifty entries, each the area code as digits: 415, with the trunk prefix
        #   as 020, or with the country's dialing prefix as +1415 (all are stored as the
        #   bare code). A dialing prefix from a different country than country is refused.
        #   Each code is checked against the country's numbering plan: it must start real
        #   local or mobile numbers there, so toll-free and premium ranges, service codes
        #   and another country's codes are refused with a reason.
        #
        #   LOCAL senders in any country, and US TEN_DLC senders. No other sender type has a
        #   geographic area code, and the list is refused with one rather than accepted and
        #   dropped.
        #
        #   Honoured exactly or not at all. Ask for 415 and you get a 415 number or you get
        #   none, never a neighbouring code you did not name. A miss leaves the market with
        #   no sender yet and the codes recorded on it, so it is filled when stock appears
        #   rather than filled now from somewhere else. Many countries outside North America
        #   require address or business documents before a local number can be bought, which
        #   can delay or prevent the fill.
        #
        #   @return [Array<String>, nil]
        optional :area_codes, Sentdm::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute compliance
        #   The compliance values a market registers with. `brand` and `campaign` apply to
        #   US `TEN_DLC`; other markets fill this map with the document keys their own
        #   requirements name.
        #
        #   @return [Sentdm::Models::Channels::MarketCompliance, nil]
        optional :compliance, -> { Sentdm::Channels::MarketCompliance }

        # @!attribute country
        #   ISO 3166-1 alpha-2 country the sender operates in.
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute numbers
        #   The numbers to assign, one entry per area code, e.g. [{"area_code": "212",
        #   "quantity": 2}, {"area_code": "415"}, {"quantity": 1}]: two numbers in 212, one
        #   in 415 and one in any area code. quantity defaults to 1, and an entry without
        #   area_code means any area code. Omit numbers for one number.
        #
        #   Only with LOCAL or TEN_DLC, and not together with area_codes. Each area code is
        #   validated against country the same way area_codes is and may appear once, and at
        #   most one entry may leave area_code out. On a LOCAL market you already hold, this
        #   adds the numbers to it. US TEN_DLC numbers are assigned when the campaign is
        #   approved, not at request time. Not available when the profile inherits the
        #   organization's campaign.
        #
        #   @return [Array<Sentdm::Models::Channels::SMSNumberRequest>, nil]
        optional :numbers,
                 -> {
                   Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::SMSNumberRequest]
                 },
                 nil?: true

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute sender_value
        #   The sender's identity where the caller chooses it. Required when number_type is
        #   ALPHANUMERIC; optional for carrier-assigned types, which are procured
        #   afterwards.
        #
        #   @return [String, nil]
        optional :sender_value, String, nil?: true

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(number_type:, area_codes: nil, compliance: nil, country: nil, numbers: nil, sandbox: nil, sender_value: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::SMSCreateParams} for more details.
        #
        #   @param number_type [Symbol, Sentdm::Models::Channels::SMSCreateParams::NumberType] Sender type. Decides the provisioning flow and what compliance is asked for.
        #
        #   @param area_codes [Array<String>, nil] The area codes to put this sender in, in your own order of preference, e.g. ["41
        #
        #   @param compliance [Sentdm::Models::Channels::MarketCompliance] The compliance values a market registers with. `brand` and `campaign` apply to U
        #
        #   @param country [String] ISO 3166-1 alpha-2 country the sender operates in.
        #
        #   @param numbers [Array<Sentdm::Models::Channels::SMSNumberRequest>, nil] The numbers to assign, one entry per area code, e.g.
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param sender_value [String, nil] The sender's identity where the caller chooses it. Required when number_type is
        #
        #   @param idempotency_key [String]
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

        # Sender type. Decides the provisioning flow and what compliance is asked for.
        #
        # [Required] so the published document says so. The validator has always demanded
        # it, but requiredness reached the schema by matching a rule to a property name —
        # which works for country, whose wire name is its camel-cased C# name, and
        # silently does not for number_type. A client generating a request from our
        # OpenAPI therefore sent what the document called sufficient and was answered 400.
        module NumberType
          extend Sentdm::Internal::Type::Enum

          # A geographic number for the country. The ordinary choice: recognisable to recipients, and available almost everywhere.
          LOCAL = :LOCAL

          # A toll-free number. High throughput and no per-country registration, but US toll-free traffic goes through its own verification.
          TOLL_FREE = :TOLL_FREE

          # A short code — five or six digits, leased rather than provisioned. Highest throughput, longest lead time, and the most expensive.
          SHORT_CODE = :SHORT_CODE

          # A sender name rather than a number, up to 11 characters. Recipients cannot reply. Not available in every country, and several require it to be pre-registered with documents.
          ALPHANUMERIC = :ALPHANUMERIC

          # A US 10-digit long code registered with The Campaign Registry. The only sender type that registers with a compliance regime, so it is the only one whose market declares `compliance.brand` and `compliance.campaign`.
          TEN_DLC = :TEN_DLC

          # A mobile number. Where a country distinguishes it from a landline, some carriers treat mobile traffic differently.
          MOBILE = :MOBILE

          # The industry's spelling of `TEN_DLC`, accepted so an integrator can send the term it knows. Resolves to the same market.
          NUMBER_TYPE_10_DLC = :"10DLC"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
