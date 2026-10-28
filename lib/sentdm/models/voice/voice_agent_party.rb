# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentParty < Sentdm::Internal::Type::BaseModel
        # @!attribute kind
        #
        #   @return [String, nil]
        optional :kind, String

        # @!attribute value
        #
        #   @return [String, nil]
        optional :value, String

        # @!method initialize(kind: nil, value: nil)
        #   @param kind [String]
        #   @param value [String]
      end
    end

    VoiceAgentParty = Voice::VoiceAgentParty
  end
end
