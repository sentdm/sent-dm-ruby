# frozen_string_literal: true

module Sentdm
  module Models
    class WebhookSenderProfileConfig < Sentdm::Internal::Type::BaseModel
      # @!attribute event_filters
      #
      #   @return [Hash{Symbol=>Array<String>}, nil]
      optional :event_filters,
               Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]],
               nil?: true

      # @!attribute event_types
      #
      #   @return [Array<String>, nil]
      optional :event_types, Sentdm::Internal::Type::ArrayOf[String]

      # @!method initialize(event_filters: nil, event_types: nil)
      #   Request-only: the events an organization webhook's sender profile clones
      #   receive, one clone per existing and future profile. A version 1 webhook's
      #   responses report it as WebhookSenderProfileV3Response.
      #
      #   @param event_filters [Hash{Symbol=>Array<String>}, nil]
      #   @param event_types [Array<String>]
    end
  end
end
