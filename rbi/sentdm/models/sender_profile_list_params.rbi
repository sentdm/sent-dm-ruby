# typed: strong

module Sentdm
  module Models
    class SenderProfileListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::SenderProfileListParams, Sentdm::Internal::AnyHash)
        end

      # Page number, 1-indexed.
      sig { returns(T.nilable(Integer)) }
      attr_reader :page

      sig { params(page: Integer).void }
      attr_writer :page

      # Profiles per page. Between 1 and 100.
      sig { returns(T.nilable(Integer)) }
      attr_reader :page_size

      sig { params(page_size: Integer).void }
      attr_writer :page_size

      sig do
        params(
          page: Integer,
          page_size: Integer,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page number, 1-indexed.
        page: nil,
        # Profiles per page. Between 1 and 100.
        page_size: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
