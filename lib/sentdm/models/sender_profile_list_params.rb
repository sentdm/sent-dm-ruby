# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::SenderProfiles#list
    class SenderProfileListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute page
      #   Page number, 1-indexed.
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute page_size
      #   Profiles per page. Between 1 and 100.
      #
      #   @return [Integer, nil]
      optional :page_size, Integer

      # @!method initialize(page: nil, page_size: nil, request_options: {})
      #   @param page [Integer] Page number, 1-indexed.
      #
      #   @param page_size [Integer] Profiles per page. Between 1 and 100.
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
