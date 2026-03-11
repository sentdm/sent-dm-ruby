# typed: strong

module Sentdm
  module Models
    module Profiles
      class CampaignDeleteParams < Sentdm::Internal::Type::BaseModel
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

        # Request to delete a campaign from a brand
        sig { returns(Sentdm::Profiles::CampaignDeleteParams::Body) }
        attr_reader :body

        sig do
          params(
            body: Sentdm::Profiles::CampaignDeleteParams::Body::OrHash
          ).void
        end
        attr_writer :body

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            profile_id: String,
            campaign_id: String,
            body: Sentdm::Profiles::CampaignDeleteParams::Body::OrHash,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          profile_id:,
          campaign_id:,
          # Request to delete a campaign from a brand
          body:,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              profile_id: String,
              campaign_id: String,
              body: Sentdm::Profiles::CampaignDeleteParams::Body,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Body < Sentdm::Models::MutationRequestBase
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Profiles::CampaignDeleteParams::Body,
                Sentdm::Internal::AnyHash
              )
            end

          # Request to delete a campaign from a brand
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end
      end
    end
  end
end
