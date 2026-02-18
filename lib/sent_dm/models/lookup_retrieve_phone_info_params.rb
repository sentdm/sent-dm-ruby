# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Lookup#retrieve_phone_info
    class LookupRetrievePhoneInfoParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
