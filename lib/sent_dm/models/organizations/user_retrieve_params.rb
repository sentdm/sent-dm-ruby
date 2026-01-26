# frozen_string_literal: true

module SentDm
  module Models
    module Organizations
      # @see SentDm::Resources::Organizations::Users#retrieve
      class UserRetrieveParams < SentDm::Internal::Type::BaseModel
        extend SentDm::Internal::Type::RequestParameters::Converter
        include SentDm::Internal::Type::RequestParameters

        # @!attribute customer_id
        #
        #   @return [String]
        required :customer_id, String

        # @!method initialize(customer_id:, request_options: {})
        #   @param customer_id [String]
        #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
