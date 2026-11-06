# typed: strong

module Sentdm
  module Models
    class APIResponseOfMessage < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::APIResponseOfMessage, Sentdm::Internal::AnyHash)
        end

      # Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      # The shape of a message that was sent immediately: it never has a scheduled_at
      # key. A message that is or was held for a later instant is a
      # ScheduledMessageResponse, and the endpoint decides which of the two to answer
      # with. From always returns this type.
      sig { returns(T.nilable(Sentdm::Message)) }
      attr_reader :data

      sig { params(data: T.nilable(Sentdm::Message::OrHash)).void }
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
          data: T.nilable(Sentdm::Message::OrHash),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Message response for v3 API — same shape as v2 with snake_case JSON conventions.
        #
        # The shape of a message that was sent immediately: it never has a scheduled_at
        # key. A message that is or was held for a later instant is a
        # ScheduledMessageResponse, and the endpoint decides which of the two to answer
        # with. From always returns this type.
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
            data: T.nilable(Sentdm::Message),
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
