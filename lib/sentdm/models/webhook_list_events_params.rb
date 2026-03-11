# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list_events
    class WebhookListEventsParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

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

      # @!method initialize(id:, page:, page_size:, search: nil, request_options: {})
      #   @param id [String]
      #   @param page [Integer]
      #   @param page_size [Integer]
      #   @param search [String, nil]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
