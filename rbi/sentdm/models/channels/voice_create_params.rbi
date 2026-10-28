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

        # One of your voice agents (GET /v3/voice/agents), such as
        # agent_9f2ab000-0000-4000-8000-000000000001, to answer calls to this number. It
        # wins over callback_url for calls to the number, and both may be sent; calls your
        # app places from the number still follow your app. Send it instead of
        # callback_url for a number only an agent answers.
        sig { returns(T.nilable(String)) }
        attr_accessor :agent_id

        # The US area code a new number should be in, as 212. Only for a request that
        # leaves number out — sending both says two different things about which number to
        # use, and is refused. Omit it too and the number comes from anywhere in the
        # country.
        sig { returns(T.nilable(String)) }
        attr_accessor :area_code

        # Where Sent asks what to do with each call on this number: an absolute HTTP or
        # HTTPS URL on a public host. A signed question is POSTed here when a call arrives
        # or a caller presses a key, and the answer decides the call. Every question is
        # signed with the callback_secret the response returns, the same way your webhooks
        # are signed. Turning the number on again with a different URL replaces it and
        # keeps the secret. Required unless agent_id is sent.
        sig { returns(T.nilable(String)) }
        attr_accessor :callback_url

        # Make this the line app-originated calls are placed from when a voice token names
        # no number. Omit it and your first voice number takes that role; a later one
        # leaves it where it is.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :default_for_app_calls

        # One of your phone numbers, in E.164 format. Leave the field out entirely to be
        # given a new one instead; sending it empty is a refused request rather than a
        # request for a new number.
        sig { returns(T.nilable(String)) }
        attr_accessor :number

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
            agent_id: T.nilable(String),
            area_code: T.nilable(String),
            callback_url: T.nilable(String),
            default_for_app_calls: T.nilable(T::Boolean),
            number: T.nilable(String),
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # One of your voice agents (GET /v3/voice/agents), such as
          # agent_9f2ab000-0000-4000-8000-000000000001, to answer calls to this number. It
          # wins over callback_url for calls to the number, and both may be sent; calls your
          # app places from the number still follow your app. Send it instead of
          # callback_url for a number only an agent answers.
          agent_id: nil,
          # The US area code a new number should be in, as 212. Only for a request that
          # leaves number out — sending both says two different things about which number to
          # use, and is refused. Omit it too and the number comes from anywhere in the
          # country.
          area_code: nil,
          # Where Sent asks what to do with each call on this number: an absolute HTTP or
          # HTTPS URL on a public host. A signed question is POSTed here when a call arrives
          # or a caller presses a key, and the answer decides the call. Every question is
          # signed with the callback_secret the response returns, the same way your webhooks
          # are signed. Turning the number on again with a different URL replaces it and
          # keeps the secret. Required unless agent_id is sent.
          callback_url: nil,
          # Make this the line app-originated calls are placed from when a voice token names
          # no number. Omit it and your first voice number takes that role; a later one
          # leaves it where it is.
          default_for_app_calls: nil,
          # One of your phone numbers, in E.164 format. Leave the field out entirely to be
          # given a new one instead; sending it empty is a refused request rather than a
          # request for a new number.
          number: nil,
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
              agent_id: T.nilable(String),
              area_code: T.nilable(String),
              callback_url: T.nilable(String),
              default_for_app_calls: T.nilable(T::Boolean),
              number: T.nilable(String),
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
