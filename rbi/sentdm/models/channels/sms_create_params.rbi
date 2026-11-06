# typed: strong

module Sentdm
  module Models
    module Channels
      class SMSCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::SMSCreateParams, Sentdm::Internal::AnyHash)
          end

        # Sender type. Decides the provisioning flow and what compliance is asked for.
        #
        # [Required] so the published document says so. The validator has always demanded
        # it, but requiredness reached the schema by matching a rule to a property name —
        # which works for country, whose wire name is its camel-cased C# name, and
        # silently does not for number_type. A client generating a request from our
        # OpenAPI therefore sent what the document called sufficient and was answered 400.
        sig { returns(Sentdm::Channels::SMSCreateParams::NumberType::OrSymbol) }
        attr_accessor :number_type

        # The area codes to put this sender in, in your own order of preference, e.g.
        # ["415", "628"] for the US or ["20"] for London. Omit it and a number is claimed
        # anywhere in the country.
        #
        # Ordered, and the order is the request. The claim tries each code in turn and
        # stops at the first that yields a number. Nothing sorts the list and a code
        # listed twice is refused.
        #
        # One to fifty entries, each the area code as digits: 415, with the trunk prefix
        # as 020, or with the country's dialing prefix as +1415 (all are stored as the
        # bare code). A dialing prefix from a different country than country is refused.
        # Each code is checked against the country's numbering plan: it must start real
        # local or mobile numbers there, so toll-free and premium ranges, service codes
        # and another country's codes are refused with a reason.
        #
        # LOCAL senders in any country, and US TEN_DLC senders. No other sender type has a
        # geographic area code, and the list is refused with one rather than accepted and
        # dropped.
        #
        # Honoured exactly or not at all. Ask for 415 and you get a 415 number or you get
        # none, never a neighbouring code you did not name. A miss leaves the market with
        # no sender yet and the codes recorded on it, so it is filled when stock appears
        # rather than filled now from somewhere else. Many countries outside North America
        # require address or business documents before a local number can be bought, which
        # can delay or prevent the fill.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :area_codes

        # The compliance values a market registers with. `brand` and `campaign` apply to
        # US `TEN_DLC`; other markets fill this map with the document keys their own
        # requirements name.
        sig { returns(T.nilable(Sentdm::Channels::MarketCompliance)) }
        attr_reader :compliance

        sig do
          params(compliance: Sentdm::Channels::MarketCompliance::OrHash).void
        end
        attr_writer :compliance

        # ISO 3166-1 alpha-2 country the sender operates in.
        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        # The numbers to assign, one entry per area code, e.g. [{"area_code": "212",
        # "quantity": 2}, {"area_code": "415"}, {"quantity": 1}]: two numbers in 212, one
        # in 415 and one in any area code. quantity defaults to 1, and an entry without
        # area_code means any area code. Omit numbers for one number.
        #
        # Only with LOCAL or TEN_DLC, and not together with area_codes. Each area code is
        # validated against country the same way area_codes is and may appear once, and at
        # most one entry may leave area_code out. On a LOCAL market you already hold, this
        # adds the numbers to it. US TEN_DLC numbers are assigned when the campaign is
        # approved, not at request time. Not available when the profile inherits the
        # organization's campaign.
        sig { returns(T.nilable(T::Array[Sentdm::Channels::SMSNumberRequest])) }
        attr_accessor :numbers

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        # The sender's identity where the caller chooses it. Required when number_type is
        # ALPHANUMERIC; optional for carrier-assigned types, which are procured
        # afterwards.
        sig { returns(T.nilable(String)) }
        attr_accessor :sender_value

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            number_type:
              Sentdm::Channels::SMSCreateParams::NumberType::OrSymbol,
            area_codes: T.nilable(T::Array[String]),
            compliance: Sentdm::Channels::MarketCompliance::OrHash,
            country: String,
            numbers:
              T.nilable(T::Array[Sentdm::Channels::SMSNumberRequest::OrHash]),
            sandbox: T::Boolean,
            sender_value: T.nilable(String),
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Sender type. Decides the provisioning flow and what compliance is asked for.
          #
          # [Required] so the published document says so. The validator has always demanded
          # it, but requiredness reached the schema by matching a rule to a property name —
          # which works for country, whose wire name is its camel-cased C# name, and
          # silently does not for number_type. A client generating a request from our
          # OpenAPI therefore sent what the document called sufficient and was answered 400.
          number_type:,
          # The area codes to put this sender in, in your own order of preference, e.g.
          # ["415", "628"] for the US or ["20"] for London. Omit it and a number is claimed
          # anywhere in the country.
          #
          # Ordered, and the order is the request. The claim tries each code in turn and
          # stops at the first that yields a number. Nothing sorts the list and a code
          # listed twice is refused.
          #
          # One to fifty entries, each the area code as digits: 415, with the trunk prefix
          # as 020, or with the country's dialing prefix as +1415 (all are stored as the
          # bare code). A dialing prefix from a different country than country is refused.
          # Each code is checked against the country's numbering plan: it must start real
          # local or mobile numbers there, so toll-free and premium ranges, service codes
          # and another country's codes are refused with a reason.
          #
          # LOCAL senders in any country, and US TEN_DLC senders. No other sender type has a
          # geographic area code, and the list is refused with one rather than accepted and
          # dropped.
          #
          # Honoured exactly or not at all. Ask for 415 and you get a 415 number or you get
          # none, never a neighbouring code you did not name. A miss leaves the market with
          # no sender yet and the codes recorded on it, so it is filled when stock appears
          # rather than filled now from somewhere else. Many countries outside North America
          # require address or business documents before a local number can be bought, which
          # can delay or prevent the fill.
          area_codes: nil,
          # The compliance values a market registers with. `brand` and `campaign` apply to
          # US `TEN_DLC`; other markets fill this map with the document keys their own
          # requirements name.
          compliance: nil,
          # ISO 3166-1 alpha-2 country the sender operates in.
          country: nil,
          # The numbers to assign, one entry per area code, e.g. [{"area_code": "212",
          # "quantity": 2}, {"area_code": "415"}, {"quantity": 1}]: two numbers in 212, one
          # in 415 and one in any area code. quantity defaults to 1, and an entry without
          # area_code means any area code. Omit numbers for one number.
          #
          # Only with LOCAL or TEN_DLC, and not together with area_codes. Each area code is
          # validated against country the same way area_codes is and may appear once, and at
          # most one entry may leave area_code out. On a LOCAL market you already hold, this
          # adds the numbers to it. US TEN_DLC numbers are assigned when the campaign is
          # approved, not at request time. Not available when the profile inherits the
          # organization's campaign.
          numbers: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          # The sender's identity where the caller chooses it. Required when number_type is
          # ALPHANUMERIC; optional for carrier-assigned types, which are procured
          # afterwards.
          sender_value: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              number_type:
                Sentdm::Channels::SMSCreateParams::NumberType::OrSymbol,
              area_codes: T.nilable(T::Array[String]),
              compliance: Sentdm::Channels::MarketCompliance,
              country: String,
              numbers: T.nilable(T::Array[Sentdm::Channels::SMSNumberRequest]),
              sandbox: T::Boolean,
              sender_value: T.nilable(String),
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Sender type. Decides the provisioning flow and what compliance is asked for.
        #
        # [Required] so the published document says so. The validator has always demanded
        # it, but requiredness reached the schema by matching a rule to a property name —
        # which works for country, whose wire name is its camel-cased C# name, and
        # silently does not for number_type. A client generating a request from our
        # OpenAPI therefore sent what the document called sufficient and was answered 400.
        module NumberType
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Sentdm::Channels::SMSCreateParams::NumberType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A geographic number for the country. The ordinary choice: recognisable to recipients, and available almost everywhere.
          LOCAL =
            T.let(
              :LOCAL,
              Sentdm::Channels::SMSCreateParams::NumberType::TaggedSymbol
            )

          # A toll-free number. High throughput and no per-country registration, but US toll-free traffic goes through its own verification.
          TOLL_FREE =
            T.let(
              :TOLL_FREE,
              Sentdm::Channels::SMSCreateParams::NumberType::TaggedSymbol
            )

          # A short code — five or six digits, leased rather than provisioned. Highest throughput, longest lead time, and the most expensive.
          SHORT_CODE =
            T.let(
              :SHORT_CODE,
              Sentdm::Channels::SMSCreateParams::NumberType::TaggedSymbol
            )

          # A sender name rather than a number, up to 11 characters. Recipients cannot reply. Not available in every country, and several require it to be pre-registered with documents.
          ALPHANUMERIC =
            T.let(
              :ALPHANUMERIC,
              Sentdm::Channels::SMSCreateParams::NumberType::TaggedSymbol
            )

          # A US 10-digit long code registered with The Campaign Registry. The only sender type that registers with a compliance regime, so it is the only one whose market declares `compliance.brand` and `compliance.campaign`.
          TEN_DLC =
            T.let(
              :TEN_DLC,
              Sentdm::Channels::SMSCreateParams::NumberType::TaggedSymbol
            )

          # A mobile number. Where a country distinguishes it from a landline, some carriers treat mobile traffic differently.
          MOBILE =
            T.let(
              :MOBILE,
              Sentdm::Channels::SMSCreateParams::NumberType::TaggedSymbol
            )

          # The industry's spelling of `TEN_DLC`, accepted so an integrator can send the term it knows. Resolves to the same market.
          NUMBER_TYPE_10_DLC =
            T.let(
              :"10DLC",
              Sentdm::Channels::SMSCreateParams::NumberType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Sentdm::Channels::SMSCreateParams::NumberType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
