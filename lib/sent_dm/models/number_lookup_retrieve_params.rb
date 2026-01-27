# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::NumberLookup#retrieve
    class NumberLookupRetrieveParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute phone_number
      #
      #   @return [String]
      required :phone_number, String

      # @!method initialize(phone_number:, request_options: {})
      #   @param phone_number [String]
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
