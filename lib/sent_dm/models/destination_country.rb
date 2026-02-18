# frozen_string_literal: true

module SentDm
  module Models
    class DestinationCountry < SentDm::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute is_main
      #
      #   @return [Boolean, nil]
      optional :is_main, SentDm::Internal::Type::Boolean, api_name: :isMain

      # @!method initialize(id: nil, is_main: nil)
      #   @param id [String]
      #   @param is_main [Boolean]
    end
  end
end
