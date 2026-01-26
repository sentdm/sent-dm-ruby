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

      # @!attribute x_api_key
      #
      #   @return [String]
      required :x_api_key, String

      # @!attribute x_sender_id
      #
      #   @return [String]
      required :x_sender_id, String

      # @!method initialize(phone_number:, x_api_key:, x_sender_id:, request_options: {})
      #   @param phone_number [String]
      #   @param x_api_key [String]
      #   @param x_sender_id [String]
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
