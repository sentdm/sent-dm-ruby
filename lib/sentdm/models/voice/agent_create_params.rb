# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      # @see Sentdm::Resources::Voice::Agents#create
      class AgentCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute audio
        #   Audio sessions only: the sound format.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentAudioSpec, nil]
        optional :audio, -> { Sentdm::Voice::VoiceAgentAudioSpec }, nil?: true

        # @!attribute fallback
        #   Who takes the call when the agent cannot: a phone number (kind: number). Omit it
        #   and such a call hangs up.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentPartySpec, nil]
        optional :fallback, -> { Sentdm::Voice::VoiceAgentPartySpec }, nil?: true

        # @!attribute greeting
        #   Text sessions only: what the caller hears as soon as the call is answered,
        #   before the agent's first turn. 1 to 4,096 characters. Omit it and the agent
        #   speaks first.
        #
        #   @return [String, nil]
        optional :greeting, String, nil?: true

        # @!attribute limits
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentLimitsSpec, nil]
        optional :limits, -> { Sentdm::Voice::VoiceAgentLimitsSpec }, nil?: true

        # @!attribute name
        #   A name for your own reference, 1 to 100 characters.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute session_type
        #   text: Sent turns the caller's speech into text and the agent's text into speech,
        #   so the agent exchanges text frames. audio: the agent receives and sends the
        #   sound itself.
        #
        #   @return [String, nil]
        optional :session_type, String, nil?: true

        # @!attribute speech
        #   Text sessions only: how the caller is spoken to and listened to.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentSpeechSpec, nil]
        optional :speech, -> { Sentdm::Voice::VoiceAgentSpeechSpec }, nil?: true

        # @!attribute tools
        #   What the agent may do to the call: any of transfer, hangup, send_dtmf and hold.
        #   Default ["hangup"]. transfer needs at least one transfer_targets entry.
        #
        #   @return [Array<String>, nil]
        optional :tools, Sentdm::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute transcripts
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentTranscriptsSpec, nil]
        optional :transcripts, -> { Sentdm::Voice::VoiceAgentTranscriptsSpec }, nil?: true

        # @!attribute transfer_targets
        #   Where the agent may transfer a call to, up to 20 parties: a phone number (kind:
        #   number, E.164), one of your app users (kind: user, the identity) or another of
        #   your agents (kind: agent, its id). The agent can only transfer to a party listed
        #   here.
        #
        #   @return [Array<Sentdm::Models::Voice::VoiceAgentPartySpec>, nil]
        optional :transfer_targets,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::VoiceAgentPartySpec] },
                 nil?: true

        # @!attribute websocket_url
        #   Where the gateway connects to the agent for each call: an absolute wss:// URL on
        #   a public host, at most 2,048 characters. The handshake is signed with the
        #   agent's signing_secret. Leave it out and the agent dials in instead, connecting
        #   to the gateway with your API key.
        #
        #   @return [String, nil]
        optional :websocket_url, String, nil?: true

        # @!attribute idempotency_key
        #
        #   @return [String, nil]
        optional :idempotency_key, String

        # @!attribute x_profile_id
        #
        #   @return [String, nil]
        optional :x_profile_id, String

        # @!method initialize(audio: nil, fallback: nil, greeting: nil, limits: nil, name: nil, sandbox: nil, session_type: nil, speech: nil, tools: nil, transcripts: nil, transfer_targets: nil, websocket_url: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::AgentCreateParams} for more details.
        #
        #   @param audio [Sentdm::Models::Voice::VoiceAgentAudioSpec, nil] Audio sessions only: the sound format.
        #
        #   @param fallback [Sentdm::Models::Voice::VoiceAgentPartySpec, nil] Who takes the call when the agent cannot: a phone number (kind: number). Omit it
        #
        #   @param greeting [String, nil] Text sessions only: what the caller hears as soon as the call is answered, befor
        #
        #   @param limits [Sentdm::Models::Voice::VoiceAgentLimitsSpec, nil]
        #
        #   @param name [String, nil] A name for your own reference, 1 to 100 characters.
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param session_type [String, nil] text: Sent turns the caller's speech into text and the agent's text into speech,
        #
        #   @param speech [Sentdm::Models::Voice::VoiceAgentSpeechSpec, nil] Text sessions only: how the caller is spoken to and listened to.
        #
        #   @param tools [Array<String>, nil] What the agent may do to the call: any of transfer, hangup, send_dtmf and
        #
        #   @param transcripts [Sentdm::Models::Voice::VoiceAgentTranscriptsSpec, nil]
        #
        #   @param transfer_targets [Array<Sentdm::Models::Voice::VoiceAgentPartySpec>, nil] Where the agent may transfer a call to, up to 20 parties: a phone number (kind:
        #
        #   @param websocket_url [String, nil] Where the gateway connects to the agent for each call: an absolute wss:// URL on
        #
        #   @param idempotency_key [String]
        #
        #   @param x_profile_id [String]
        #
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
