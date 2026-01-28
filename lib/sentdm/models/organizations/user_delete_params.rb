# frozen_string_literal: true

module Sentdm
  module Models
    module Organizations
      # @see Sentdm::Resources::Organizations::Users#delete
      class UserDeleteParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        # @!attribute customer_id
        #
        #   @return [String]
        required :customer_id, String

        # @!method initialize(customer_id:, request_options: {})
        #   @param customer_id [String]
        #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
