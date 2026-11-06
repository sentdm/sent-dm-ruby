# frozen_string_literal: true

module Sentdm
  module Models
    class WebhookSenderProfile < Sentdm::Internal::Type::BaseModel
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
      #   The events a version 1 webhook's sender profile clones receive, as a response
      #   reports them.
      #
      #   Its own type, field for field the same as the request's sender_profile. A
      #   response is not a request, whatever it carries.
      #
      #   @param event_filters [Hash{Symbol=>Array<String>}, nil]
      #   @param event_types [Array<String>]
    end
  end
end
