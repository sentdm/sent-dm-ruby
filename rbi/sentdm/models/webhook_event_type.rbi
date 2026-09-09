# typed: strong

module Sentdm
  module Models
    class WebhookEventType < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookEventType, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig { returns(T.nilable(String)) }
      attr_reader :display_name

      sig { params(display_name: String).void }
      attr_writer :display_name

      sig { returns(T.nilable(String)) }
      attr_accessor :event_type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_active

      sig { params(is_active: T::Boolean).void }
      attr_writer :is_active

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(T::Array[Sentdm::WebhookEventType])) }
      attr_accessor :sub_types

      sig do
        params(
          description: T.nilable(String),
          display_name: String,
          event_type: T.nilable(String),
          is_active: T::Boolean,
          name: String,
          sub_types: T.nilable(T::Array[Sentdm::WebhookEventType])
        ).returns(T.attached_class)
      end
      def self.new(
        description: nil,
        display_name: nil,
        event_type: nil,
        is_active: nil,
        name: nil,
        sub_types: nil
      )
      end

      sig do
        override.returns(
          {
            description: T.nilable(String),
            display_name: String,
            event_type: T.nilable(String),
            is_active: T::Boolean,
            name: String,
            sub_types: T.nilable(T::Array[Sentdm::WebhookEventType])
          }
        )
      end
      def to_hash
      end
    end
  end
end
