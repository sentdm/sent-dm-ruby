# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentsList < Sentdm::Internal::Type::BaseModel
        # @!attribute agents
        #
        #   @return [Array<Sentdm::Models::Voice::VoiceAgent>, nil]
        optional :agents, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::VoiceAgent] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!method initialize(agents: nil, pagination: nil)
        #   A page of the account's agents. The agent itself is VoiceAgentResponse, shared
        #   with the admin API.
        #
        #   @param agents [Array<Sentdm::Models::Voice::VoiceAgent>]
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
      end
    end

    VoiceAgentsList = Voice::VoiceAgentsList
  end
end
