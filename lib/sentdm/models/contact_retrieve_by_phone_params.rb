# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#retrieve_by_phone
    class ContactRetrieveByPhoneParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute phone_number
      #   The phone number in international format (e.g., +1234567890)
      #
      #   @return [String]
      required :phone_number, String

      # @!method initialize(phone_number:, request_options: {})
      #   @param phone_number [String] The phone number in international format (e.g., +1234567890)
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
