# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Webhooks#list
    class WebhookListParams < SentDm::Internal::Type::BaseModel
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

      # @!attribute is_active
      #
      #   @return [Boolean, nil]
      optional :is_active, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute search
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!method initialize(page:, page_size:, is_active: nil, search: nil, request_options: {})
      #   @param page [Integer]
      #   @param page_size [Integer]
      #   @param is_active [Boolean, nil]
      #   @param search [String, nil]
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
