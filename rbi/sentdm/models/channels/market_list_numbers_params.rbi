# typed: strong

module Sentdm
  module Models
    module Channels
      class MarketListNumbersParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::MarketListNumbersParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :channel

        sig { returns(String) }
        attr_accessor :country

        sig { returns(String) }
        attr_accessor :type

        # Only the numbers of this campaign (US TEN_DLC); all of the market's when absent.
        sig { returns(T.nilable(String)) }
        attr_accessor :campaign_id

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            channel: String,
            country: String,
            type: String,
            campaign_id: T.nilable(String),
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          channel:,
          country:,
          type:,
          # Only the numbers of this campaign (US TEN_DLC); all of the market's when absent.
          campaign_id: nil,
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
              campaign_id: T.nilable(String),
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
