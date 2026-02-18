# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#list_events
    class WebhookListEventsParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute page
      #
      #   @return [Integer]
      required :page, Integer

      # @!attribute page_size
      #
      #   @return [Integer]
      required :page_size, Integer

      # @!attribute search
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!method initialize(page:, page_size:, search: nil, request_options: {})
      #   @param page [Integer]
      #   @param page_size [Integer]
      #   @param search [String, nil]
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
