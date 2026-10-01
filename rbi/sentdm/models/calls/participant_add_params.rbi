# typed: strong

module Sentdm
  module Models
    module Calls
      class ParticipantAddParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Calls::ParticipantAddParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # The number shown to a phone participant as the caller, in E.164 format. Must be
        # one of your numbers. The call's owning number when omitted
        sig { returns(T.nilable(String)) }
        attr_accessor :caller_id

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        # A participant to add to a call
        sig { returns(T.nilable(Sentdm::Calls::CallParticipantTarget)) }
        attr_reader :to

        sig { params(to: Sentdm::Calls::CallParticipantTarget::OrHash).void }
        attr_writer :to

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
            caller_id: T.nilable(String),
            sandbox: T::Boolean,
            to: Sentdm::Calls::CallParticipantTarget::OrHash,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # The number shown to a phone participant as the caller, in E.164 format. Must be
          # one of your numbers. The call's owning number when omitted
          caller_id: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          # A participant to add to a call
          to: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              caller_id: T.nilable(String),
              sandbox: T::Boolean,
              to: Sentdm::Calls::CallParticipantTarget,
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
