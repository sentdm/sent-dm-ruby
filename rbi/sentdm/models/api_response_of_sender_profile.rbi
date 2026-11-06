# typed: strong

module Sentdm
  module Models
    class APIResponseOfSenderProfile < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::APIResponseOfSenderProfile, Sentdm::Internal::AnyHash)
        end

      # A sender profile as the API reports it — the same document the create call
      # accepts, plus the read-only facts it cannot: each market's status and what it
      # still owes.
      #
      # No status at the profile, brand or campaign level. Brand and campaign are
      # identity, and identity has no lifecycle. What has one is the registration of a
      # sender in a market, and the approval of a channel — so status lives there, where
      # it says which specific thing is blocked rather than flattening several answers
      # into one.
      sig { returns(T.nilable(Sentdm::SenderProfile)) }
      attr_reader :data

      sig { params(data: T.nilable(Sentdm::SenderProfile::OrHash)).void }
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
          data: T.nilable(Sentdm::SenderProfile::OrHash),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # A sender profile as the API reports it — the same document the create call
        # accepts, plus the read-only facts it cannot: each market's status and what it
        # still owes.
        #
        # No status at the profile, brand or campaign level. Brand and campaign are
        # identity, and identity has no lifecycle. What has one is the registration of a
        # sender in a market, and the approval of a channel — so status lives there, where
        # it says which specific thing is blocked rather than flattening several answers
        # into one.
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
            data: T.nilable(Sentdm::SenderProfile),
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
