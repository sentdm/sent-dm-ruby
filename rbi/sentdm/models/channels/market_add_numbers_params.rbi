# typed: strong

module Sentdm
  module Models
    module Channels
      class MarketAddNumbersParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::MarketAddNumbersParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :channel

        sig { returns(String) }
        attr_accessor :country

        sig { returns(String) }
        attr_accessor :type

        # The numbers, one entry per area code, e.g. [{"area_code": "415", "quantity": 2},
        # {"quantity": 1}]. quantity defaults to 1, and an entry without area_code means
        # any area code. Required.
        #
        # POST adds them to what the market or campaign already asks for; PATCH replaces
        # that list with them, and has to cover every number already held, since none is
        # ever released.
        sig { returns(T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest)]) }
        attr_accessor :numbers

        sig { returns(String) }
        attr_accessor :idempotency_key

        # The campaign to add the numbers to, as campaigns[].id reports it. Required on
        # SMS US TEN_DLC, where every number belongs to a campaign; refused on a market
        # without campaigns.
        sig { returns(T.nilable(String)) }
        attr_accessor :campaign_id

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            channel: String,
            country: String,
            type: String,
            numbers:
              T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest::OrHash)],
            idempotency_key: String,
            campaign_id: T.nilable(String),
            sandbox: T::Boolean,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          channel:,
          country:,
          type:,
          # The numbers, one entry per area code, e.g. [{"area_code": "415", "quantity": 2},
          # {"quantity": 1}]. quantity defaults to 1, and an entry without area_code means
          # any area code. Required.
          #
          # POST adds them to what the market or campaign already asks for; PATCH replaces
          # that list with them, and has to cover every number already held, since none is
          # ever released.
          numbers:,
          idempotency_key:,
          # The campaign to add the numbers to, as campaigns[].id reports it. Required on
          # SMS US TEN_DLC, where every number belongs to a campaign; refused on a market
          # without campaigns.
          campaign_id: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              channel: String,
              country: String,
              type: String,
              numbers: T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest)],
              idempotency_key: String,
              campaign_id: T.nilable(String),
              sandbox: T::Boolean,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
