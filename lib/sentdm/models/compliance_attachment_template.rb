# frozen_string_literal: true

module Sentdm
  module Models
    class ComplianceAttachmentTemplate < Sentdm::Internal::Type::BaseModel
      # @!attribute field_name
      #   The multipart field name to attach the file under.
      #
      #   @return [String, nil]
      optional :field_name, String

      # @!attribute label
      #
      #   @return [String, nil]
      optional :label, String, nil?: true

      # @!attribute required
      #
      #   @return [Boolean, nil]
      optional :required, Sentdm::Internal::Type::Boolean

      # @!method initialize(field_name: nil, label: nil, required: nil)
      #   A file this market wants, and the multipart field to send it as.
      #
      #   Separate from compliance because a file is not JSON: the channel call accepts
      #   multipart, and each file is named after the key it satisfies. Listing documents
      #   among the JSON entries would describe a request nobody could send.
      #
      #   @param field_name [String] The multipart field name to attach the file under.
      #
      #   @param label [String, nil]
      #
      #   @param required [Boolean]
    end
  end
end
