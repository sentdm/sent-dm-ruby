# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentPartySpec < Sentdm::Internal::Type::BaseModel
        # @!attribute kind
        #   number, user or agent.
        #
        #   @return [String, nil]
        optional :kind, String, nil?: true

        # @!attribute value
        #   The E.164 number, the app user's identity, or the agent id (agent\_…).
        #
        #   @return [String, nil]
        optional :value, String, nil?: true

        # @!method initialize(kind: nil, value: nil)
        #   @param kind [String, nil] number, user or agent.
        #
        #   @param value [String, nil] The E.164 number, the app user's identity, or the agent id (agent\_…).
      end
    end

    VoiceAgentPartySpec = Voice::VoiceAgentPartySpec
  end
end
