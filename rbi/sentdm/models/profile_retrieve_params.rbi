# typed: strong

module Sentdm
  module Models
    class ProfileRetrieveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileRetrieveParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :profile_id

      sig do
        params(
          profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(profile_id:, request_options: {})
      end

      sig do
        override.returns(
          { profile_id: String, request_options: Sentdm::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
