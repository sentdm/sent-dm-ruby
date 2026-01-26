# frozen_string_literal: true

module SentDm
  module Models
    module Organizations
      # @see SentDm::Resources::Organizations::Users#list
      class UserListParams < SentDm::Internal::Type::BaseModel
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

        # @!method initialize(page:, page_size:, request_options: {})
        #   @param page [Integer]
        #   @param page_size [Integer]
        #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
