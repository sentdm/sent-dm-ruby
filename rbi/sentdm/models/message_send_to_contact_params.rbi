# typed: strong

module Sentdm
  module Models
    class MessageSendToContactParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageSendToContactParams, Sentdm::Internal::AnyHash)
        end

      # The unique identifier of the contact to send the message to
      sig { returns(String) }
      attr_accessor :contact_id

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
          contact_id: String,
          template_id: String,
          template_variables: T.nilable(T::Hash[Symbol, String]),
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier of the contact to send the message to
        contact_id:,
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
            contact_id: String,
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
