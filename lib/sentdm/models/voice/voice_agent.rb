# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      # @see Sentdm::Resources::Voice::Agents#list
      class VoiceAgent < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #   The agent's id, agent\_ and a UUID. It is also what the agent connects to the
        #   gateway as.
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute audio
        #   Audio sessions: the sample rate in use.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentAudio, nil]
        optional :audio, -> { Sentdm::Voice::VoiceAgentAudio }, nil?: true

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time

        # @!attribute fallback
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentParty, nil]
        optional :fallback, -> { Sentdm::Voice::VoiceAgentParty }, nil?: true

        # @!attribute greeting
        #
        #   @return [String, nil]
        optional :greeting, String, nil?: true

        # @!attribute limits
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentLimits, nil]
        optional :limits, -> { Sentdm::Voice::VoiceAgentLimits }

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute session_type
        #   text or audio.
        #
        #   @return [String, nil]
        optional :session_type, String

        # @!attribute signing_secret
        #   The whsec\_ secret the gateway signs its handshake to websocket_url with.
        #   Present on create and after a rotate-secret; absent on every other read. Store
        #   it now.
        #
        #   @return [String, nil]
        optional :signing_secret, String, nil?: true

        # @!attribute speech
        #   Text sessions: the speech setting, voice and language in use.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentSpeech, nil]
        optional :speech, -> { Sentdm::Voice::VoiceAgentSpeech }, nil?: true

        # @!attribute tools
        #
        #   @return [Array<String>, nil]
        optional :tools, Sentdm::Internal::Type::ArrayOf[String]

        # @!attribute transcripts
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentTranscripts, nil]
        optional :transcripts, -> { Sentdm::Voice::VoiceAgentTranscripts }

        # @!attribute transfer_targets
        #
        #   @return [Array<Sentdm::Models::Voice::VoiceAgentParty>, nil]
        optional :transfer_targets, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::VoiceAgentParty] }

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, nil?: true

        # @!attribute websocket_url
        #   Where the gateway dials the agent; null when the agent dials in with your API
        #   key.
        #
        #   @return [String, nil]
        optional :websocket_url, String, nil?: true

        # @!method initialize(id: nil, audio: nil, created_at: nil, fallback: nil, greeting: nil, limits: nil, name: nil, session_type: nil, signing_secret: nil, speech: nil, tools: nil, transcripts: nil, transfer_targets: nil, updated_at: nil, websocket_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::VoiceAgent} for more details.
        #
        #   A voice agent as stored: what was written with every default filled in, plus the
        #   signing secret the one time it is shown (on create, and on rotate). The one
        #   shape every read of an agent answers with, on /v3/voice/agents and on the admin
        #   API the dashboard uses, so the two cannot drift.
        #
        #   @param id [String] The agent's id, agent\_ and a UUID. It is also what the agent connects to the
        #   gat
        #
        #   @param audio [Sentdm::Models::Voice::VoiceAgentAudio, nil] Audio sessions: the sample rate in use.
        #
        #   @param created_at [Time]
        #
        #   @param fallback [Sentdm::Models::Voice::VoiceAgentParty, nil]
        #
        #   @param greeting [String, nil]
        #
        #   @param limits [Sentdm::Models::Voice::VoiceAgentLimits]
        #
        #   @param name [String]
        #
        #   @param session_type [String] text or audio.
        #
        #   @param signing_secret [String, nil] The whsec\_ secret the gateway signs its handshake to websocket_url with.
        #   Present
        #
        #   @param speech [Sentdm::Models::Voice::VoiceAgentSpeech, nil] Text sessions: the speech setting, voice and language in use.
        #
        #   @param tools [Array<String>]
        #
        #   @param transcripts [Sentdm::Models::Voice::VoiceAgentTranscripts]
        #
        #   @param transfer_targets [Array<Sentdm::Models::Voice::VoiceAgentParty>]
        #
        #   @param updated_at [Time, nil]
        #
        #   @param websocket_url [String, nil] Where the gateway dials the agent; null when the agent dials in with your API ke
      end
    end

    VoiceAgent = Voice::VoiceAgent
  end
end
