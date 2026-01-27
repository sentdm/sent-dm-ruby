# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Contacts#retrieve_by_phone
    class ContactRetrieveByPhoneParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute phone_number
      #   The phone number in international format (e.g., +1234567890)
      #
      #   @return [String]
      required :phone_number, String

      # @!method initialize(phone_number:, request_options: {})
      #   @param phone_number [String] The phone number in international format (e.g., +1234567890)
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
