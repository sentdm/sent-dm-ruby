# typed: strong

module Sentdm
  module Models
    class SenderProfileUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::SenderProfileUpdateParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.nilable(String)) }
      attr_accessor :description

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
      # ORGANIZATION_AND_SENDER_PROFILE. Cannot be cleared — a supplied value must be
      # one of those.
      sig { returns(T.nilable(String)) }
      attr_accessor :notifications

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      sig { returns(T.nilable(String)) }
      attr_accessor :short_name

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          id: String,
          description: T.nilable(String),
          name: String,
          notifications: T.nilable(String),
          sandbox: T::Boolean,
          short_name: T.nilable(String),
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        description: nil,
        name: nil,
        # Who is notified about this profile's events: ORGANIZATION, SENDER_PROFILE, or
        # ORGANIZATION_AND_SENDER_PROFILE. Cannot be cleared — a supplied value must be
        # one of those.
        notifications: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        short_name: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            description: T.nilable(String),
            name: String,
            notifications: T.nilable(String),
            sandbox: T::Boolean,
            short_name: T.nilable(String),
            idempotency_key: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
