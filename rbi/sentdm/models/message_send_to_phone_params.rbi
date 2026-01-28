# typed: strong

module Sentdm
  module Models
    class MessageSendToPhoneParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageSendToPhoneParams, Sentdm::Internal::AnyHash)
        end

      # The phone number to send the message to, in international format (e.g.,
      # +1234567890)
      sig { returns(String) }
      attr_accessor :phone_number

      # The unique identifier of the template to use for the message
      sig { returns(String) }
      attr_accessor :template_id

      # Optional key-value pairs of template variables to replace in the template body.
      # For example, if your template contains "Hello {{name}}", you would provide {
      # "name": "John Doe" }
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_accessor :template_variables

      sig do
        params(
          phone_number: String,
          template_id: String,
          template_variables: T.nilable(T::Hash[Symbol, String]),
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The phone number to send the message to, in international format (e.g.,
        # +1234567890)
        phone_number:,
        # The unique identifier of the template to use for the message
        template_id:,
        # Optional key-value pairs of template variables to replace in the template body.
        # For example, if your template contains "Hello {{name}}", you would provide {
        # "name": "John Doe" }
        template_variables: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            phone_number: String,
            template_id: String,
            template_variables: T.nilable(T::Hash[Symbol, String]),
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
