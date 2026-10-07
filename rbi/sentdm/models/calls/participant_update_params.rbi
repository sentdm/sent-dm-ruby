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
