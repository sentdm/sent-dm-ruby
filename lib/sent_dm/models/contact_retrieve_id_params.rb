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

      # @!method initialize(id:, request_options: {})
      #   @param id [String] The unique identifier (GUID) of the resource to retrieve
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
