# typed: strong

module Sentdm
  module Models
    module Profiles
      class APIResponseOfBrandCampaign < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Profiles::APIResponseOfBrandCampaign,
              Sentdm::Internal::AnyHash
            )
          end

        # A 10DLC campaign registered for a brand.
        sig { returns(T.nilable(Sentdm::Profiles::BrandCampaign)) }
        attr_reader :data

        sig do
          params(data: T.nilable(Sentdm::Profiles::BrandCampaign::OrHash)).void
        end
        attr_writer :data

        # Error information
        sig { returns(T.nilable(Sentdm::ErrorDetail)) }
        attr_reader :error

        sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
        attr_writer :error

        # Request and response metadata
        sig { returns(T.nilable(Sentdm::APIMeta)) }
        attr_reader :meta

        sig { params(meta: Sentdm::APIMeta::OrHash).void }
        attr_writer :meta

        # Indicates whether the request was successful
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :success

        sig { params(success: T::Boolean).void }
        attr_writer :success

        # Standard API response envelope for all v3 endpoints
        sig do
          params(
            data: T.nilable(Sentdm::Profiles::BrandCampaign::OrHash),
            error: T.nilable(Sentdm::ErrorDetail::OrHash),
            meta: Sentdm::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # A 10DLC campaign registered for a brand.
          data: nil,
          # Error information
          error: nil,
          # Request and response metadata
          meta: nil,
          # Indicates whether the request was successful
          success: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(Sentdm::Profiles::BrandCampaign),
              error: T.nilable(Sentdm::ErrorDetail),
              meta: Sentdm::APIMeta,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
