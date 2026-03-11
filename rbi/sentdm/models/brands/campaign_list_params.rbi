# typed: strong

module Sentdm
  module Models
    module Brands
      class CampaignListParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Sentdm::Brands::CampaignListParams, Sentdm::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :brand_id

        sig do
          params(
            brand_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(brand_id:, request_options: {})
        end

        sig do
          override.returns(
            { brand_id: String, request_options: Sentdm::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
