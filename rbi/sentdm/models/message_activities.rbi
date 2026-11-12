# typed: strong

module Sentdm
  module Models
    class MessageActivities < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageActivities, Sentdm::Internal::AnyHash)
        end

      # List of activity events ordered by most recent first
      sig { returns(T.nilable(T::Array[Sentdm::MessageActivity])) }
      attr_reader :activities

      sig { params(activities: T::Array[Sentdm::MessageActivity::OrHash]).void }
      attr_writer :activities

      # The message ID these activities belong to
      sig { returns(T.nilable(String)) }
      attr_reader :message_id

      sig { params(message_id: String).void }
      attr_writer :message_id

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # Response for GET /messages/{id}/activities
      sig do
        params(
          activities: T::Array[Sentdm::MessageActivity::OrHash],
          message_id: String,
          pagination: Sentdm::PaginationMeta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # List of activity events ordered by most recent first
        activities: nil,
        # The message ID these activities belong to
        message_id: nil,
        # Pagination metadata for list responses
        pagination: nil
      )
      end

      sig do
        override.returns(
          {
            activities: T::Array[Sentdm::MessageActivity],
            message_id: String,
            pagination: Sentdm::PaginationMeta
          }
        )
      end
      def to_hash
      end
    end
  end
end
