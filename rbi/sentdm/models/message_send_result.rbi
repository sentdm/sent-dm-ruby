# typed: strong

module Sentdm
  module Models
    class MessageSendResult < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageSendResult, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Array[Sentdm::MessageRecipient])) }
      attr_reader :recipients

      sig do
        params(recipients: T::Array[Sentdm::MessageRecipient::OrHash]).void
      end
      attr_writer :recipients

      # QUEUED: the batch is accepted. A request that carried scheduled_at is QUEUED
      # here too; each message moves to SCHEDULED once it is held, as GET
      # /v3/messages/{id} and the message.scheduled webhook report.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :template_id

      sig { params(template_id: String).void }
      attr_writer :template_id

      sig { returns(T.nilable(String)) }
      attr_reader :template_name

      sig { params(template_name: String).void }
      attr_writer :template_name

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
      sig do
        params(
          recipients: T::Array[Sentdm::MessageRecipient::OrHash],
          status: String,
          template_id: String,
          template_name: String
        ).returns(T.attached_class)
      end
      def self.new(
        recipients: nil,
        # QUEUED: the batch is accepted. A request that carried scheduled_at is QUEUED
        # here too; each message moves to SCHEDULED once it is held, as GET
        # /v3/messages/{id} and the message.scheduled webhook report.
        status: nil,
        template_id: nil,
        template_name: nil
      )
      end

      sig do
        override.returns(
          {
            recipients: T::Array[Sentdm::MessageRecipient],
            status: String,
            template_id: String,
            template_name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
