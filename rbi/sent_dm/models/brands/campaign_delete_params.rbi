# typed: strong

module SentDm
  module Models
    module Brands
      class CampaignDeleteParams < SentDm::Internal::Type::BaseModel
        extend SentDm::Internal::Type::RequestParameters::Converter
        include SentDm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              SentDm::Brands::CampaignDeleteParams,
              SentDm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :brand_id

        # Request to delete a campaign from a brand
        sig { returns(SentDm::Brands::CampaignDeleteParams::Body) }
        attr_reader :body

        sig do
          params(body: SentDm::Brands::CampaignDeleteParams::Body::OrHash).void
        end
        attr_writer :body

        sig do
          params(
            brand_id: String,
            body: SentDm::Brands::CampaignDeleteParams::Body::OrHash,
            request_options: SentDm::RequestOptions::OrHash
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
              body: SentDm::Brands::CampaignDeleteParams::Body,
              request_options: SentDm::RequestOptions
            }
          )
        end
        def to_hash
        end

        class Body < SentDm::Models::MutationRequest
          OrHash =
            T.type_alias do
              T.any(
                SentDm::Brands::CampaignDeleteParams::Body,
                SentDm::Internal::AnyHash
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
