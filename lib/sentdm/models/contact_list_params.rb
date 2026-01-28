# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#list
    class ContactListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute page
      #   The page number (zero-indexed). Default is 0.
      #
      #   @return [Integer]
      required :page, Integer

      # @!attribute page_size
      #   The number of items per page. Default is 20.
      #
      #   @return [Integer]
      required :page_size, Integer

      # @!method initialize(page:, page_size:, request_options: {})
      #   @param page [Integer] The page number (zero-indexed). Default is 0.
      #
      #   @param page_size [Integer] The number of items per page. Default is 20.
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
