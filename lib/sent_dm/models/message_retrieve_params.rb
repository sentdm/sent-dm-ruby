# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Messages#retrieve
    class MessageRetrieveParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute x_api_key
      #
      #   @return [String]
      required :x_api_key, String

      # @!attribute x_sender_id
      #
      #   @return [String]
      required :x_sender_id, String

      # @!method initialize(x_api_key:, x_sender_id:, request_options: {})
      #   @param x_api_key [String]
      #   @param x_sender_id [String]
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
