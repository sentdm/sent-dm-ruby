# typed: strong

module Sentdm
  module Models
    module Voice
      class APIResponseOfVoiceAgent < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Voice::APIResponseOfVoiceAgent,
              Sentdm::Internal::AnyHash
            )
          end

        # A voice agent as stored: what was written with every default filled in, plus the
        # signing secret the one time it is shown (on create, and on rotate). The one
        # shape every read of an agent answers with, on /v3/voice/agents and on the admin
        # API the dashboard uses, so the two cannot drift.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgent)) }
        attr_reader :data

        sig { params(data: T.nilable(Sentdm::Voice::VoiceAgent::OrHash)).void }
        attr_writer :data

        # Error information
        sig { returns(T.nilable(Sentdm::ErrorDetail)) }
        attr_reader :error

        sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
        attr_writer :error

        # Request and response metadata
        sig { returns(T.nilable(Sentdm::APIMeta)) }
        attr_reader :meta

        sig { params(meta: Sentdm::APIMeta::OrHash).void }
        attr_writer :meta

        # Indicates whether the request was successful
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :success

        sig { params(success: T::Boolean).void }
        attr_writer :success

        # Standard API response envelope for all v3 endpoints
        sig do
          params(
            data: T.nilable(Sentdm::Voice::VoiceAgent::OrHash),
            error: T.nilable(Sentdm::ErrorDetail::OrHash),
            meta: Sentdm::APIMeta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # A voice agent as stored: what was written with every default filled in, plus the
          # signing secret the one time it is shown (on create, and on rotate). The one
          # shape every read of an agent answers with, on /v3/voice/agents and on the admin
          # API the dashboard uses, so the two cannot drift.
          data: nil,
          # Error information
          error: nil,
          # Request and response metadata
          meta: nil,
          # Indicates whether the request was successful
          success: nil
        )
        end

        sig do
          override.returns(
            {
              data: T.nilable(Sentdm::Voice::VoiceAgent),
              error: T.nilable(Sentdm::ErrorDetail),
              meta: Sentdm::APIMeta,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
