# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentLimits < Sentdm::Internal::Type::BaseModel
        # @!attribute allowed_countries
        #
        #   @return [Array<String>, nil]
        optional :allowed_countries, Sentdm::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute max_call_seconds
        #
        #   @return [Integer, nil]
        optional :max_call_seconds, Integer

        # @!attribute max_concurrent_calls
        #
        #   @return [Integer, nil]
        optional :max_concurrent_calls, Integer

        # @!method initialize(allowed_countries: nil, max_call_seconds: nil, max_concurrent_calls: nil)
        #   @param allowed_countries [Array<String>, nil]
        #   @param max_call_seconds [Integer]
        #   @param max_concurrent_calls [Integer]
      end
    end

    VoiceAgentLimits = Voice::VoiceAgentLimits
  end
end
