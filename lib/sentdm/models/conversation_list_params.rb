# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Conversations#list
    class ConversationListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute page
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute page_size
      #
      #   @return [Integer, nil]
      optional :page_size, Integer

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(page: nil, page_size: nil, x_profile_id: nil, request_options: {})
      #   @param page [Integer]
      #   @param page_size [Integer]
      #   @param x_profile_id [String]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
