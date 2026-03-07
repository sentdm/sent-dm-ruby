# typed: strong

module Sentdm
  module Models
    class UserRetrieveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::UserRetrieveParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :user_id

      sig do
        params(
          user_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(user_id:, request_options: {})
      end

      sig do
        override.returns(
          { user_id: String, request_options: Sentdm::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
