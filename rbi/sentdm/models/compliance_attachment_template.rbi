# typed: strong

module Sentdm
  module Models
    class ComplianceAttachmentTemplate < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ComplianceAttachmentTemplate, Sentdm::Internal::AnyHash)
        end

      # The multipart field name to attach the file under.
      sig { returns(T.nilable(String)) }
      attr_reader :field_name

      sig { params(field_name: String).void }
      attr_writer :field_name

      sig { returns(T.nilable(String)) }
      attr_accessor :label

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :required

      sig { params(required: T::Boolean).void }
      attr_writer :required

      # A file this market wants, and the multipart field to send it as.
      #
      # Separate from compliance because a file is not JSON: the channel call accepts
      # multipart, and each file is named after the key it satisfies. Listing documents
      # among the JSON entries would describe a request nobody could send.
      sig do
        params(
          field_name: String,
          label: T.nilable(String),
          required: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The multipart field name to attach the file under.
        field_name: nil,
        label: nil,
        required: nil
      )
      end

      sig do
        override.returns(
          { field_name: String, label: T.nilable(String), required: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
