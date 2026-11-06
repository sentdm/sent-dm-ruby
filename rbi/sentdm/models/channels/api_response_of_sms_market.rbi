# typed: strong

module Sentdm
  module Models
    module Channels
      class APIResponseOfSMSMarket < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::APIResponseOfSMSMarket,
              Sentdm::Internal::AnyHash
            )
          end

        # One SMS market the profile sends in — its sender, where that sender stands, and
        # what the market wants.
        #
        # A profile may send in several: it is a tenant, not a market. Each carries its
        # own status, because a profile can be live in one country and mid-registration in
        # another — and each carries what it still owes, rather than that being reported
        # in a separate array a caller has to join on.
        sig { returns(T.nilable(Sentdm::Channels::SMSMarket)) }
        attr_reader :data

        sig do
          params(data: T.nilable(Sentdm::Channels::SMSMarket::OrHash)).void
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
            data: T.nilable(Sentdm::Channels::SMSMarket::OrHash),
            error: T.nilable(Sentdm::ErrorDetail::OrHash),
            meta: Sentdm::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # One SMS market the profile sends in — its sender, where that sender stands, and
          # what the market wants.
          #
          # A profile may send in several: it is a tenant, not a market. Each carries its
          # own status, because a profile can be live in one country and mid-registration in
          # another — and each carries what it still owes, rather than that being reported
          # in a separate array a caller has to join on.
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
              data: T.nilable(Sentdm::Channels::SMSMarket),
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
