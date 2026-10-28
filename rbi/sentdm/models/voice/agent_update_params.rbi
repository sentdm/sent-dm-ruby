# typed: strong

module Sentdm
  module Models
    module Voice
      class AgentUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::AgentUpdateParams, Sentdm::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :id

        # Audio sessions: { sample_rate }; null restores the default.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentAudioSpec)) }
        attr_reader :audio

        sig do
          params(
            audio: T.nilable(Sentdm::Voice::VoiceAgentAudioSpec::OrHash)
          ).void
        end
        attr_writer :audio

        # A new fallback party, or null for none.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentPartySpec)) }
        attr_reader :fallback

        sig do
          params(
            fallback: T.nilable(Sentdm::Voice::VoiceAgentPartySpec::OrHash)
          ).void
        end
        attr_writer :fallback

        # A new greeting, or null for none.
        sig { returns(T.nilable(String)) }
        attr_accessor :greeting

        # The whole limits object; null restores the defaults.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec)) }
        attr_reader :limits

        sig do
          params(
            limits: T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec::OrHash)
          ).void
        end
        attr_writer :limits

        # A new name, 1 to 100 characters.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        # text or audio. Changing it drops the settings the other type cannot have
        # (speech, audio, greeting) unless the body sends them.
        sig { returns(T.nilable(String)) }
        attr_reader :session_type

        sig { params(session_type: String).void }
        attr_writer :session_type

        # Text sessions: { setting, voice, language }, replaced whole; null restores the
        # defaults.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentSpeechSpec)) }
        attr_reader :speech

        sig do
          params(
            speech: T.nilable(Sentdm::Voice::VoiceAgentSpeechSpec::OrHash)
          ).void
        end
        attr_writer :speech

        # The whole list of tools; null restores the default.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :tools

        # The whole transcripts object; null restores the defaults.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentTranscriptsSpec)) }
        attr_reader :transcripts

        sig do
          params(
            transcripts:
              T.nilable(Sentdm::Voice::VoiceAgentTranscriptsSpec::OrHash)
          ).void
        end
        attr_writer :transcripts

        # The whole list of parties; null clears it.
        sig { returns(T.nilable(T::Array[Sentdm::Voice::VoiceAgentPartySpec])) }
        attr_accessor :transfer_targets

        # A new wss:// URL, or null for an agent that dials in.
        sig { returns(T.nilable(String)) }
        attr_accessor :websocket_url

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
            audio: T.nilable(Sentdm::Voice::VoiceAgentAudioSpec::OrHash),
            fallback: T.nilable(Sentdm::Voice::VoiceAgentPartySpec::OrHash),
            greeting: T.nilable(String),
            limits: T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec::OrHash),
            name: String,
            sandbox: T::Boolean,
            session_type: String,
            speech: T.nilable(Sentdm::Voice::VoiceAgentSpeechSpec::OrHash),
            tools: T.nilable(T::Array[String]),
            transcripts:
              T.nilable(Sentdm::Voice::VoiceAgentTranscriptsSpec::OrHash),
            transfer_targets:
              T.nilable(T::Array[Sentdm::Voice::VoiceAgentPartySpec::OrHash]),
            websocket_url: T.nilable(String),
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Audio sessions: { sample_rate }; null restores the default.
          audio: nil,
          # A new fallback party, or null for none.
          fallback: nil,
          # A new greeting, or null for none.
          greeting: nil,
          # The whole limits object; null restores the defaults.
          limits: nil,
          # A new name, 1 to 100 characters.
          name: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          # text or audio. Changing it drops the settings the other type cannot have
          # (speech, audio, greeting) unless the body sends them.
          session_type: nil,
          # Text sessions: { setting, voice, language }, replaced whole; null restores the
          # defaults.
          speech: nil,
          # The whole list of tools; null restores the default.
          tools: nil,
          # The whole transcripts object; null restores the defaults.
          transcripts: nil,
          # The whole list of parties; null clears it.
          transfer_targets: nil,
          # A new wss:// URL, or null for an agent that dials in.
          websocket_url: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              audio: T.nilable(Sentdm::Voice::VoiceAgentAudioSpec),
              fallback: T.nilable(Sentdm::Voice::VoiceAgentPartySpec),
              greeting: T.nilable(String),
              limits: T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec),
              name: String,
              sandbox: T::Boolean,
              session_type: String,
              speech: T.nilable(Sentdm::Voice::VoiceAgentSpeechSpec),
              tools: T.nilable(T::Array[String]),
              transcripts: T.nilable(Sentdm::Voice::VoiceAgentTranscriptsSpec),
              transfer_targets:
                T.nilable(T::Array[Sentdm::Voice::VoiceAgentPartySpec]),
              websocket_url: T.nilable(String),
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
