# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Messages#send_to_contact
    class MessageSendToContactParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute contact_id
      #   The unique identifier of the contact to send the message to
      #
      #   @return [String]
      required :contact_id, String, api_name: :contactId

      # @!attribute template_id
      #   The unique identifier of the template to use for the message
      #
      #   @return [String]
      required :template_id, String, api_name: :templateId

      # @!attribute x_api_key
      #
      #   @return [String]
      required :x_api_key, String

      # @!attribute x_sender_id
      #
      #   @return [String]
      required :x_sender_id, String

      # @!attribute template_variables
      #   Optional key-value pairs of template variables to replace in the template body.
      #   For example, if your template contains "Hello {{name}}", you would provide {
      #   "name": "John Doe" }
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :template_variables,
               SentDm::Internal::Type::HashOf[String],
               api_name: :templateVariables,
               nil?: true

      # @!method initialize(contact_id:, template_id:, x_api_key:, x_sender_id:, template_variables: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::MessageSendToContactParams} for more details.
      #
      #   @param contact_id [String] The unique identifier of the contact to send the message to
      #
      #   @param template_id [String] The unique identifier of the template to use for the message
      #
      #   @param x_api_key [String]
      #
      #   @param x_sender_id [String]
      #
      #   @param template_variables [Hash{Symbol=>String}, nil] Optional key-value pairs of template variables to replace in the template body.
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
