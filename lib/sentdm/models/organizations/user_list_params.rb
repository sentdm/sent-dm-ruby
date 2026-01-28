# frozen_string_literal: true

module Sentdm
  module Models
    module Organizations
      # @see Sentdm::Resources::Organizations::Users#list
      class UserListParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute page
        #
        #   @return [Integer]
        required :page, Integer

        # @!attribute page_size
        #
        #   @return [Integer]
        required :page_size, Integer

        # @!method initialize(page:, page_size:, request_options: {})
        #   @param page [Integer]
        #   @param page_size [Integer]
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
