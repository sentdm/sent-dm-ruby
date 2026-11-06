# typed: strong

module Sentdm
  module Models
    class WebhookSenderProfileConfig < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookSenderProfileConfig, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
      attr_accessor :event_filters

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :event_types

      sig { params(event_types: T::Array[String]).void }
      attr_writer :event_types

      # Request-only: the events an organization webhook's sender profile clones
      # receive, one clone per existing and future profile. A version 1 webhook's
      # responses report it as WebhookSenderProfileV3Response.
      sig do
        params(
          event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
          event_types: T::Array[String]
        ).returns(T.attached_class)
      end
      def self.new(event_filters: nil, event_types: nil)
      end

      sig do
        override.returns(
          {
            event_filters: T.nilable(T::Hash[Symbol, T::Array[String]]),
            event_types: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
