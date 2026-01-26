# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Contacts#retrieve_id
    class ContactRetrieveIDParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute id
      #   The unique identifier (GUID) of the resource to retrieve
      #
      #   @return [String]
      required :id, String

      # @!attribute x_api_key
      #
      #   @return [String]
      required :x_api_key, String

      # @!attribute x_sender_id
      #
      #   @return [String]
      required :x_sender_id, String

      # @!method initialize(id:, x_api_key:, x_sender_id:, request_options: {})
      #   @param id [String] The unique identifier (GUID) of the resource to retrieve
      #
      #   @param x_api_key [String]
      #
      #   @param x_sender_id [String]
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
