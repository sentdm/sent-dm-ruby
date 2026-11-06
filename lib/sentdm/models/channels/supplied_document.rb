# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class SuppliedDocument < Sentdm::Internal::Type::BaseModel
        # @!attribute document_id
        #   Identifier of the upload, for fetching it back through the documents endpoints.
        #
        #   @return [String, nil]
        optional :document_id, String, nil?: true

        # @!attribute file_name
        #
        #   @return [String, nil]
        optional :file_name, String, nil?: true

        # @!attribute key
        #   The catalog's name for this document, matching the requirement it satisfies.
        #
        #   @return [String, nil]
        optional :key, String

        # @!method initialize(document_id: nil, file_name: nil, key: nil)
        #   A document a market asked for and has been given.
        #
        #   @param document_id [String, nil] Identifier of the upload, for fetching it back through the documents endpoints.
        #
        #   @param file_name [String, nil]
        #
        #   @param key [String] The catalog's name for this document, matching the requirement it satisfies.
      end
    end
  end
end
