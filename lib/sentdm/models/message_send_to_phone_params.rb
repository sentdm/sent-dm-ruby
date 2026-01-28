# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#send_to_phone
    class MessageSendToPhoneParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute phone_number
      #   The phone number to send the message to, in international format (e.g.,
      #   +1234567890)
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute template_id
      #   The unique identifier of the template to use for the message
      #
      #   @return [String]
      required :template_id, String, api_name: :templateId

      # @!attribute template_variables
      #   Optional key-value pairs of template variables to replace in the template body.
      #   For example, if your template contains "Hello {{name}}", you would provide {
      #   "name": "John Doe" }
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_variables,
               Sentdm::Internal::Type::HashOf[String],
               api_name: :templateVariables,
               nil?: true

      # @!method initialize(phone_number:, template_id:, template_variables: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageSendToPhoneParams} for more details.
      #
      #   @param phone_number [String] The phone number to send the message to, in international format (e.g., +1234567
      #
      #   @param template_id [String] The unique identifier of the template to use for the message
      #
      #   @param template_variables [Hash{Symbol=>String}, nil] Optional key-value pairs of template variables to replace in the template body.
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
