# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#retrieve_id
    class ContactRetrieveIDParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #   The unique identifier (GUID) of the resource to retrieve
      #
      #   @return [String]
      required :id, String

      # @!method initialize(id:, request_options: {})
      #   @param id [String] The unique identifier (GUID) of the resource to retrieve
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
