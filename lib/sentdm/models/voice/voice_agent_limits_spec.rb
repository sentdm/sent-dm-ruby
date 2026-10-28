# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentLimitsSpec < Sentdm::Internal::Type::BaseModel
        # @!attribute allowed_countries
        #   ISO 3166-1 alpha-2 codes of the countries the agent may call or transfer to.
        #   Omit it to allow every country. Stored now, applied when the agent places calls.
        #
        #   @return [Array<String>, nil]
        optional :allowed_countries, Sentdm::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute max_call_seconds
        #   The longest a call may last, 60 to 14,400 seconds. Default 3,600.
        #
        #   @return [Integer, nil]
        optional :max_call_seconds, Integer, nil?: true

        # @!attribute max_concurrent_calls
        #   How many calls the agent may have going at once, from 1. Default 10.
        #
        #   @return [Integer, nil]
        optional :max_concurrent_calls, Integer, nil?: true

        # @!method initialize(allowed_countries: nil, max_call_seconds: nil, max_concurrent_calls: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::VoiceAgentLimitsSpec} for more details.
        #
        #   @param allowed_countries [Array<String>, nil] ISO 3166-1 alpha-2 codes of the countries the agent may call or transfer to. Omi
        #
        #   @param max_call_seconds [Integer, nil] The longest a call may last, 60 to 14,400 seconds. Default 3,600.
        #
        #   @param max_concurrent_calls [Integer, nil] How many calls the agent may have going at once, from 1. Default 10.
      end
    end

    VoiceAgentLimitsSpec = Voice::VoiceAgentLimitsSpec
  end
end
