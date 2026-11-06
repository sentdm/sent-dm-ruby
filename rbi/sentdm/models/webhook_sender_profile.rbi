# typed: strong

module Sentdm
  module Models
    class WebhookSenderProfile < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::WebhookSenderProfile, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
      attr_accessor :event_filters

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :event_types

      sig { params(event_types: T::Array[String]).void }
      attr_writer :event_types

      # The events a version 1 webhook's sender profile clones receive, as a response
      # reports them.
      #
      # Its own type, field for field the same as the request's sender_profile. A
      # response is not a request, whatever it carries.
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
