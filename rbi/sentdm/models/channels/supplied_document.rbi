# typed: strong

module Sentdm
  module Models
    module Channels
      class SuppliedDocument < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::SuppliedDocument, Sentdm::Internal::AnyHash)
          end

        # Identifier of the upload, for fetching it back through the documents endpoints.
        sig { returns(T.nilable(String)) }
        attr_accessor :document_id

        sig { returns(T.nilable(String)) }
        attr_accessor :file_name

        # The catalog's name for this document, matching the requirement it satisfies.
        sig { returns(T.nilable(String)) }
        attr_reader :key

        sig { params(key: String).void }
        attr_writer :key

        # A document a market asked for and has been given.
        sig do
          params(
            document_id: T.nilable(String),
            file_name: T.nilable(String),
            key: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifier of the upload, for fetching it back through the documents endpoints.
          document_id: nil,
          file_name: nil,
          # The catalog's name for this document, matching the requirement it satisfies.
          key: nil
        )
        end

        sig do
          override.returns(
            {
              document_id: T.nilable(String),
              file_name: T.nilable(String),
              key: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
