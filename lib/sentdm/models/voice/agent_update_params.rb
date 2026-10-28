# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      # @see Sentdm::Resources::Voice::Agents#update
      class AgentUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute audio
        #   Audio sessions: { sample_rate }; null restores the default.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentAudioSpec, nil]
        optional :audio, -> { Sentdm::Voice::VoiceAgentAudioSpec }, nil?: true

        # @!attribute fallback
        #   A new fallback party, or null for none.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentPartySpec, nil]
        optional :fallback, -> { Sentdm::Voice::VoiceAgentPartySpec }, nil?: true

        # @!attribute greeting
        #   A new greeting, or null for none.
        #
        #   @return [String, nil]
        optional :greeting, String, nil?: true

        # @!attribute limits
        #   The whole limits object; null restores the defaults.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentLimitsSpec, nil]
        optional :limits, -> { Sentdm::Voice::VoiceAgentLimitsSpec }, nil?: true

        # @!attribute name
        #   A new name, 1 to 100 characters.
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute sandbox
        #   Sandbox flag - when true, the operation is simulated without side effects Useful
        #   for testing integrations without actual execution
        #
        #   @return [Boolean, nil]
        optional :sandbox, Sentdm::Internal::Type::Boolean

        # @!attribute session_type
        #   text or audio. Changing it drops the settings the other type cannot have
        #   (speech, audio, greeting) unless the body sends them.
        #
        #   @return [String, nil]
        optional :session_type, String

        # @!attribute speech
        #   Text sessions: { setting, voice, language }, replaced whole; null restores the
        #   defaults.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentSpeechSpec, nil]
        optional :speech, -> { Sentdm::Voice::VoiceAgentSpeechSpec }, nil?: true

        # @!attribute tools
        #   The whole list of tools; null restores the default.
        #
        #   @return [Array<String>, nil]
        optional :tools, Sentdm::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute transcripts
        #   The whole transcripts object; null restores the defaults.
        #
        #   @return [Sentdm::Models::Voice::VoiceAgentTranscriptsSpec, nil]
        optional :transcripts, -> { Sentdm::Voice::VoiceAgentTranscriptsSpec }, nil?: true

        # @!attribute transfer_targets
        #   The whole list of parties; null clears it.
        #
        #   @return [Array<Sentdm::Models::Voice::VoiceAgentPartySpec>, nil]
        optional :transfer_targets,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::VoiceAgentPartySpec] },
                 nil?: true

        # @!attribute websocket_url
        #   A new wss:// URL, or null for an agent that dials in.
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

        # @!method initialize(id:, audio: nil, fallback: nil, greeting: nil, limits: nil, name: nil, sandbox: nil, session_type: nil, speech: nil, tools: nil, transcripts: nil, transfer_targets: nil, websocket_url: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::AgentUpdateParams} for more details.
        #
        #   @param id [String]
        #
        #   @param audio [Sentdm::Models::Voice::VoiceAgentAudioSpec, nil] Audio sessions: { sample_rate }; null restores the default.
        #
        #   @param fallback [Sentdm::Models::Voice::VoiceAgentPartySpec, nil] A new fallback party, or null for none.
        #
        #   @param greeting [String, nil] A new greeting, or null for none.
        #
        #   @param limits [Sentdm::Models::Voice::VoiceAgentLimitsSpec, nil] The whole limits object; null restores the defaults.
        #
        #   @param name [String] A new name, 1 to 100 characters.
        #
        #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
        #
        #   @param session_type [String] text or audio. Changing it drops the settings the other type cannot have (speech
        #
        #   @param speech [Sentdm::Models::Voice::VoiceAgentSpeechSpec, nil] Text sessions: { setting, voice, language }, replaced whole; null restores the d
        #
        #   @param tools [Array<String>, nil] The whole list of tools; null restores the default.
        #
        #   @param transcripts [Sentdm::Models::Voice::VoiceAgentTranscriptsSpec, nil] The whole transcripts object; null restores the defaults.
        #
        #   @param transfer_targets [Array<Sentdm::Models::Voice::VoiceAgentPartySpec>, nil] The whole list of parties; null clears it.
        #
        #   @param websocket_url [String, nil] A new wss:// URL, or null for an agent that dials in.
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
