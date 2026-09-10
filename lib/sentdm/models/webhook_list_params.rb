# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Webhooks#list
    class WebhookListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute is_active
      #
      #   @return [Boolean, nil]
      optional :is_active, Sentdm::Internal::Type::Boolean, nil?: true

      # @!attribute page
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute page_size
      #
      #   @return [Integer, nil]
      optional :page_size, Integer

      # @!attribute search
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(is_active: nil, page: nil, page_size: nil, search: nil, x_profile_id: nil, request_options: {})
      #   @param is_active [Boolean, nil]
      #   @param page [Integer]
      #   @param page_size [Integer]
      #   @param search [String, nil]
      #   @param x_profile_id [String]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
