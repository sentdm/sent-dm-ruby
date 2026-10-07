# typed: strong

module Sentdm
  module Models
    module Calls
      class ParticipantUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Calls::ParticipantUpdateParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :participant_id

        # API key from the x-api-key header, or empty when the caller sent it as
        # Authorization: Bearer instead.
        #
        # Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
        # header, and [FromHeader] is required by default, so a Bearer-only request would
        # authenticate and then be refused with a 400 for a header it never needed.
        # Endpoints read the customer from the CustomerId claim, not from this value.
        sig { returns(T.nilable(String)) }
        attr_reader :api_key

        sig { params(api_key: String).void }
        attr_writer :api_key

        # true to mute the participant, false to unmute them
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :muted

        sig { params(muted: T::Boolean).void }
        attr_writer :muted

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
            id: String,
            participant_id: String,
            api_key: String,
            muted: T::Boolean,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          participant_id:,
          # API key from the x-api-key header, or empty when the caller sent it as
          # Authorization: Bearer instead.
          #
          # Optional on purpose. CustomerV3AuthenticationHandler accepts the key in either
          # header, and [FromHeader] is required by default, so a Bearer-only request would
          # authenticate and then be refused with a 400 for a header it never needed.
          # Endpoints read the customer from the CustomerId claim, not from this value.
          api_key: nil,
          # true to mute the participant, false to unmute them
          muted: nil,
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
              id: String,
              participant_id: String,
              api_key: String,
              muted: T::Boolean,
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
