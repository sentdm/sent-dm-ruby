# typed: strong

module Sentdm
  module Models
    VoiceAgent = Voice::VoiceAgent

    module Voice
      class VoiceAgent < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::VoiceAgent, Sentdm::Internal::AnyHash)
          end

        # The agent's id, agent\_ and a UUID. It is also what the agent connects to the
        # gateway as.
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Audio sessions: the sample rate in use.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentAudio)) }
        attr_reader :audio

        sig do
          params(audio: T.nilable(Sentdm::Voice::VoiceAgentAudio::OrHash)).void
        end
        attr_writer :audio

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentParty)) }
        attr_reader :fallback

        sig do
          params(
            fallback: T.nilable(Sentdm::Voice::VoiceAgentParty::OrHash)
          ).void
        end
        attr_writer :fallback

        sig { returns(T.nilable(String)) }
        attr_accessor :greeting

        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentLimits)) }
        attr_reader :limits

        sig { params(limits: Sentdm::Voice::VoiceAgentLimits::OrHash).void }
        attr_writer :limits

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # text or audio.
        sig { returns(T.nilable(String)) }
        attr_reader :session_type

        sig { params(session_type: String).void }
        attr_writer :session_type

        # The whsec\_ secret the gateway signs its handshake to websocket_url with.
        # Present on create and after a rotate-secret; absent on every other read. Store
        # it now.
        sig { returns(T.nilable(String)) }
        attr_accessor :signing_secret

        # Text sessions: the speech setting, voice and language in use.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentSpeech)) }
        attr_reader :speech

        sig do
          params(
            speech: T.nilable(Sentdm::Voice::VoiceAgentSpeech::OrHash)
          ).void
        end
        attr_writer :speech

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tools

        sig { params(tools: T::Array[String]).void }
        attr_writer :tools

        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentTranscripts)) }
        attr_reader :transcripts

        sig do
          params(transcripts: Sentdm::Voice::VoiceAgentTranscripts::OrHash).void
        end
        attr_writer :transcripts

        sig { returns(T.nilable(T::Array[Sentdm::Voice::VoiceAgentParty])) }
        attr_reader :transfer_targets

        sig do
          params(
            transfer_targets: T::Array[Sentdm::Voice::VoiceAgentParty::OrHash]
          ).void
        end
        attr_writer :transfer_targets

        sig { returns(T.nilable(Time)) }
        attr_accessor :updated_at

        # Where the gateway dials the agent; null when the agent dials in with your API
        # key.
        sig { returns(T.nilable(String)) }
        attr_accessor :websocket_url

        # A voice agent as stored: what was written with every default filled in, plus the
        # signing secret the one time it is shown (on create, and on rotate). The one
        # shape every read of an agent answers with, on /v3/voice/agents and on the admin
        # API the dashboard uses, so the two cannot drift.
        sig do
          params(
            id: String,
            audio: T.nilable(Sentdm::Voice::VoiceAgentAudio::OrHash),
            created_at: Time,
            fallback: T.nilable(Sentdm::Voice::VoiceAgentParty::OrHash),
            greeting: T.nilable(String),
            limits: Sentdm::Voice::VoiceAgentLimits::OrHash,
            name: String,
            session_type: String,
            signing_secret: T.nilable(String),
            speech: T.nilable(Sentdm::Voice::VoiceAgentSpeech::OrHash),
            tools: T::Array[String],
            transcripts: Sentdm::Voice::VoiceAgentTranscripts::OrHash,
            transfer_targets: T::Array[Sentdm::Voice::VoiceAgentParty::OrHash],
            updated_at: T.nilable(Time),
            websocket_url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The agent's id, agent\_ and a UUID. It is also what the agent connects to the
          # gateway as.
          id: nil,
          # Audio sessions: the sample rate in use.
          audio: nil,
          created_at: nil,
          fallback: nil,
          greeting: nil,
          limits: nil,
          name: nil,
          # text or audio.
          session_type: nil,
          # The whsec\_ secret the gateway signs its handshake to websocket_url with.
          # Present on create and after a rotate-secret; absent on every other read. Store
          # it now.
          signing_secret: nil,
          # Text sessions: the speech setting, voice and language in use.
          speech: nil,
          tools: nil,
          transcripts: nil,
          transfer_targets: nil,
          updated_at: nil,
          # Where the gateway dials the agent; null when the agent dials in with your API
          # key.
          websocket_url: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              audio: T.nilable(Sentdm::Voice::VoiceAgentAudio),
              created_at: Time,
              fallback: T.nilable(Sentdm::Voice::VoiceAgentParty),
              greeting: T.nilable(String),
              limits: Sentdm::Voice::VoiceAgentLimits,
              name: String,
              session_type: String,
              signing_secret: T.nilable(String),
              speech: T.nilable(Sentdm::Voice::VoiceAgentSpeech),
              tools: T::Array[String],
              transcripts: Sentdm::Voice::VoiceAgentTranscripts,
              transfer_targets: T::Array[Sentdm::Voice::VoiceAgentParty],
              updated_at: T.nilable(Time),
              websocket_url: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
