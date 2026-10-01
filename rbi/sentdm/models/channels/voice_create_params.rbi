# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::VoiceCreateParams,
              Sentdm::Internal::AnyHash
            )
          end

        # Where Sent asks what to do with each call on this number: an absolute HTTP or
        # HTTPS URL on a public host. A signed question is POSTed here when a call arrives
        # or a caller presses a key, and the answer decides the call. Every question is
        # signed with the callback_secret the response returns, the same way your webhooks
        # are signed. Turning the number on again with a different URL replaces it and
        # keeps the secret.
        sig { returns(String) }
        attr_accessor :callback_url

        # One of your phone numbers, in E.164 format.
        sig { returns(String) }
        attr_accessor :number

        # Make this the line app-originated calls are placed from when a voice token names
        # no number. Omit it and your first voice number takes that role; a later one
        # leaves it where it is.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :default_for_app_calls

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            callback_url: String,
            number: String,
            default_for_app_calls: T.nilable(T::Boolean),
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Where Sent asks what to do with each call on this number: an absolute HTTP or
          # HTTPS URL on a public host. A signed question is POSTed here when a call arrives
          # or a caller presses a key, and the answer decides the call. Every question is
          # signed with the callback_secret the response returns, the same way your webhooks
          # are signed. Turning the number on again with a different URL replaces it and
          # keeps the secret.
          callback_url:,
          # One of your phone numbers, in E.164 format.
          number:,
          # Make this the line app-originated calls are placed from when a voice token names
          # no number. Omit it and your first voice number takes that role; a later one
          # leaves it where it is.
          default_for_app_calls: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              callback_url: String,
              number: String,
              default_for_app_calls: T.nilable(T::Boolean),
              sandbox: T::Boolean,
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
