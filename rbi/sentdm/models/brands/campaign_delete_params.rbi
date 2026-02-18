# typed: strong

module Sentdm
  module Models
    module Brands
      class CampaignDeleteParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Brands::CampaignDeleteParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :brand_id

        # Request to delete a campaign from a brand
        sig { returns(Sentdm::Brands::CampaignDeleteParams::Body) }
        attr_reader :body

        sig do
          params(body: Sentdm::Brands::CampaignDeleteParams::Body::OrHash).void
        end
        attr_writer :body

        sig do
          params(
            brand_id: String,
            body: Sentdm::Brands::CampaignDeleteParams::Body::OrHash,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          brand_id:,
          # Request to delete a campaign from a brand
          body:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              brand_id: String,
              body: Sentdm::Brands::CampaignDeleteParams::Body,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Body < Sentdm::Models::MutationRequest
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Brands::CampaignDeleteParams::Body,
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
