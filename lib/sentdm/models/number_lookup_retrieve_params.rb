# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::NumberLookup#retrieve
    class NumberLookupRetrieveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute phone_number
      #
      #   @return [String]
      required :phone_number, String

      # @!method initialize(phone_number:, request_options: {})
      #   @param phone_number [String]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
