# typed: strong

module Sentdm
  module Models
    class ConversationListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ConversationListParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(Integer) }
      attr_accessor :page

      sig { returns(Integer) }
      attr_accessor :page_size

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          page: Integer,
          page_size: Integer,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(page:, page_size:, x_profile_id: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            page: Integer,
            page_size: Integer,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
