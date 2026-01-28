# typed: strong

module Sentdm
  module Models
    class ContactRetrieveIDParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ContactRetrieveIDParams, Sentdm::Internal::AnyHash)
        end

      # The unique identifier (GUID) of the resource to retrieve
      sig { returns(String) }
      attr_accessor :id

      sig do
        params(
          id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier (GUID) of the resource to retrieve
        id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { id: String, request_options: Sentdm::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
