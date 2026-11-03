# typed: strong

module Sentdm
  module Models
    class MessageResendResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::MessageResendResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # The result of a multi-recipient send.
      #
      # Declared here rather than in the service layer. POST /v3/messages used to
      # publish MessageSendResult — a type in Common.Services.Messaging.Contracts — so
      # the public contract was whatever the send service happened to return, and
      # changing that service for an internal reason changed the API. The service keeps
      # its result; this is what a caller sees, and the mapping between them is a
      # decision the endpoint makes.
      #
      # The shape of an immediate send: it never has a scheduled_at key. A send that
      # carried scheduled_at is a ScheduledSendMessageResponse, and the endpoint decides
      # which of the two to answer with. From always returns this type.
      sig { returns(T.nilable(Sentdm::MessageResendResponseData)) }
      attr_reader :data

      sig do
        params(data: T.nilable(Sentdm::MessageResendResponseData::OrHash)).void
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
          data: T.nilable(Sentdm::MessageResendResponseData::OrHash),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The result of a multi-recipient send.
        #
        # Declared here rather than in the service layer. POST /v3/messages used to
        # publish MessageSendResult — a type in Common.Services.Messaging.Contracts — so
        # the public contract was whatever the send service happened to return, and
        # changing that service for an internal reason changed the API. The service keeps
        # its result; this is what a caller sees, and the mapping between them is a
        # decision the endpoint makes.
        #
        # The shape of an immediate send: it never has a scheduled_at key. A send that
        # carried scheduled_at is a ScheduledSendMessageResponse, and the endpoint decides
        # which of the two to answer with. From always returns this type.
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
            data: T.nilable(Sentdm::MessageResendResponseData),
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
