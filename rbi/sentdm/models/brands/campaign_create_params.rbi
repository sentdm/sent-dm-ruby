# typed: strong

module Sentdm
  module Models
    module Brands
      class CampaignCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Brands::CampaignCreateParams,
              Sentdm::Internal::AnyHash
            )
          end

        # Campaign data
        sig { returns(Sentdm::Brands::CampaignData) }
        attr_reader :campaign

        sig { params(campaign: Sentdm::Brands::CampaignData::OrHash).void }
        attr_writer :campaign

        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :test_mode

        sig { params(test_mode: T::Boolean).void }
        attr_writer :test_mode

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig do
          params(
            campaign: Sentdm::Brands::CampaignData::OrHash,
            test_mode: T::Boolean,
            idempotency_key: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Campaign data
          campaign:,
          # Test mode flag - when true, the operation is simulated without side effects
          # Useful for testing integrations without actual execution
          test_mode: nil,
          idempotency_key: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              campaign: Sentdm::Brands::CampaignData,
              test_mode: T::Boolean,
              idempotency_key: String,
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
