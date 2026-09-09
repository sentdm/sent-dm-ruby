# typed: strong

module Sentdm
  module Models
    module Profiles
      class CampaignDeleteParams < Sentdm::Models::MutationRequest
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Profiles::CampaignDeleteParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :profile_id

        sig { returns(String) }
        attr_accessor :campaign_id

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            profile_id: String,
            campaign_id: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          profile_id:,
          campaign_id:,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              profile_id: String,
              campaign_id: String,
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
