# typed: strong

module Sentdm
  module Models
    class MessageSendParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageSendParams, Sentdm::Internal::AnyHash)
        end

      # Channels to broadcast on, e.g. ["whatsapp", "sms"]. Each channel produces a
      # separate message per recipient. "sent" = auto-detect, "rcs" = reserved
      # (skipped). Defaults to ["sent"] (auto-detect) if omitted.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :channel

      # Template reference (by id or name, with optional parameters)
      sig { returns(T.nilable(Sentdm::MessageSendParams::Template)) }
      attr_reader :template

      sig { params(template: Sentdm::MessageSendParams::Template::OrHash).void }
      attr_writer :template

      # Test mode flag - when true, the operation is simulated without side effects
      # Useful for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :test_mode

      sig { params(test_mode: T::Boolean).void }
      attr_writer :test_mode

      # List of recipient phone numbers in E.164 format (multi-recipient fan-out)
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :to

      sig { params(to: T::Array[String]).void }
      attr_writer :to

      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          channel: T.nilable(T::Array[String]),
          template: Sentdm::MessageSendParams::Template::OrHash,
          test_mode: T::Boolean,
          to: T::Array[String],
          idempotency_key: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Channels to broadcast on, e.g. ["whatsapp", "sms"]. Each channel produces a
        # separate message per recipient. "sent" = auto-detect, "rcs" = reserved
        # (skipped). Defaults to ["sent"] (auto-detect) if omitted.
        channel: nil,
        # Template reference (by id or name, with optional parameters)
        template: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
        # List of recipient phone numbers in E.164 format (multi-recipient fan-out)
        to: nil,
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            channel: T.nilable(T::Array[String]),
            template: Sentdm::MessageSendParams::Template,
            test_mode: T::Boolean,
            to: T::Array[String],
            idempotency_key: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Template < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::MessageSendParams::Template,
              Sentdm::Internal::AnyHash
            )
          end

        # Template ID (mutually exclusive with name)
        sig { returns(T.nilable(String)) }
        attr_accessor :id

        # Template name (mutually exclusive with id)
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # Template variable parameters for personalization
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_accessor :parameters

        # Template reference (by id or name, with optional parameters)
        sig do
          params(
            id: T.nilable(String),
            name: T.nilable(String),
            parameters: T.nilable(T::Hash[Symbol, String])
          ).returns(T.attached_class)
        end
        def self.new(
          # Template ID (mutually exclusive with name)
          id: nil,
          # Template name (mutually exclusive with id)
          name: nil,
          # Template variable parameters for personalization
          parameters: nil
        )
        end

        sig do
          override.returns(
            {
              id: T.nilable(String),
              name: T.nilable(String),
              parameters: T.nilable(T::Hash[Symbol, String])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
