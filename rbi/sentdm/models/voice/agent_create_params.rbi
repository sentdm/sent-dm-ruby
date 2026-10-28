# typed: strong

module Sentdm
  module Models
    module Voice
      class AgentCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::AgentCreateParams, Sentdm::Internal::AnyHash)
          end

        # Audio sessions only: the sound format.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentAudioSpec)) }
        attr_reader :audio

        sig do
          params(
            audio: T.nilable(Sentdm::Voice::VoiceAgentAudioSpec::OrHash)
          ).void
        end
        attr_writer :audio

        # Who takes the call when the agent cannot: a phone number (kind: number). Omit it
        # and such a call hangs up.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentPartySpec)) }
        attr_reader :fallback

        sig do
          params(
            fallback: T.nilable(Sentdm::Voice::VoiceAgentPartySpec::OrHash)
          ).void
        end
        attr_writer :fallback

        # Text sessions only: what the caller hears as soon as the call is answered,
        # before the agent's first turn. 1 to 4,096 characters. Omit it and the agent
        # speaks first.
        sig { returns(T.nilable(String)) }
        attr_accessor :greeting

        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec)) }
        attr_reader :limits

        sig do
          params(
            limits: T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec::OrHash)
          ).void
        end
        attr_writer :limits

        # A name for your own reference, 1 to 100 characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        # text: Sent turns the caller's speech into text and the agent's text into speech,
        # so the agent exchanges text frames. audio: the agent receives and sends the
        # sound itself.
        sig { returns(T.nilable(String)) }
        attr_accessor :session_type

        # Text sessions only: how the caller is spoken to and listened to.
        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentSpeechSpec)) }
        attr_reader :speech

        sig do
          params(
            speech: T.nilable(Sentdm::Voice::VoiceAgentSpeechSpec::OrHash)
          ).void
        end
        attr_writer :speech

        # What the agent may do to the call: any of transfer, hangup, send_dtmf and hold.
        # Default ["hangup"]. transfer needs at least one transfer_targets entry.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :tools

        sig { returns(T.nilable(Sentdm::Voice::VoiceAgentTranscriptsSpec)) }
        attr_reader :transcripts

        sig do
          params(
            transcripts:
              T.nilable(Sentdm::Voice::VoiceAgentTranscriptsSpec::OrHash)
          ).void
        end
        attr_writer :transcripts

        # Where the agent may transfer a call to, up to 20 parties: a phone number (kind:
        # number, E.164), one of your app users (kind: user, the identity) or another of
        # your agents (kind: agent, its id). The agent can only transfer to a party listed
        # here.
        sig { returns(T.nilable(T::Array[Sentdm::Voice::VoiceAgentPartySpec])) }
        attr_accessor :transfer_targets

        # Where the gateway connects to the agent for each call: an absolute wss:// URL on
        # a public host, at most 2,048 characters. The handshake is signed with the
        # agent's signing_secret. Leave it out and the agent dials in instead, connecting
        # to the gateway with your API key.
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
            audio: T.nilable(Sentdm::Voice::VoiceAgentAudioSpec::OrHash),
            fallback: T.nilable(Sentdm::Voice::VoiceAgentPartySpec::OrHash),
            greeting: T.nilable(String),
            limits: T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec::OrHash),
            name: T.nilable(String),
            sandbox: T::Boolean,
            session_type: T.nilable(String),
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
          # Audio sessions only: the sound format.
          audio: nil,
          # Who takes the call when the agent cannot: a phone number (kind: number). Omit it
          # and such a call hangs up.
          fallback: nil,
          # Text sessions only: what the caller hears as soon as the call is answered,
          # before the agent's first turn. 1 to 4,096 characters. Omit it and the agent
          # speaks first.
          greeting: nil,
          limits: nil,
          # A name for your own reference, 1 to 100 characters.
          name: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          # text: Sent turns the caller's speech into text and the agent's text into speech,
          # so the agent exchanges text frames. audio: the agent receives and sends the
          # sound itself.
          session_type: nil,
          # Text sessions only: how the caller is spoken to and listened to.
          speech: nil,
          # What the agent may do to the call: any of transfer, hangup, send_dtmf and hold.
          # Default ["hangup"]. transfer needs at least one transfer_targets entry.
          tools: nil,
          transcripts: nil,
          # Where the agent may transfer a call to, up to 20 parties: a phone number (kind:
          # number, E.164), one of your app users (kind: user, the identity) or another of
          # your agents (kind: agent, its id). The agent can only transfer to a party listed
          # here.
          transfer_targets: nil,
          # Where the gateway connects to the agent for each call: an absolute wss:// URL on
          # a public host, at most 2,048 characters. The handshake is signed with the
          # agent's signing_secret. Leave it out and the agent dials in instead, connecting
          # to the gateway with your API key.
          websocket_url: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              audio: T.nilable(Sentdm::Voice::VoiceAgentAudioSpec),
              fallback: T.nilable(Sentdm::Voice::VoiceAgentPartySpec),
              greeting: T.nilable(String),
              limits: T.nilable(Sentdm::Voice::VoiceAgentLimitsSpec),
              name: T.nilable(String),
              sandbox: T::Boolean,
              session_type: T.nilable(String),
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
