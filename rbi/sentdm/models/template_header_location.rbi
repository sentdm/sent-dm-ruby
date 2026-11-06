# typed: strong

module Sentdm
  module Models
    class TemplateHeaderLocation < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateHeaderLocation, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :address

      sig { returns(String) }
      attr_accessor :latitude

      sig { returns(String) }
      attr_accessor :longitude

      sig { returns(String) }
      attr_accessor :name

      # The map pin a location header drops. Meta wants none of this at creation — the
      # component is just {"type":"header","format":"location"} — so these values exist
      # for Sent: a preview, and the default a StaticResource header falls back to at
      # send.
      sig do
        params(
          address: String,
          latitude: String,
          longitude: String,
          name: String
        ).returns(T.attached_class)
      end
      def self.new(address:, latitude:, longitude:, name:)
      end

      sig do
        override.returns(
          { address: String, latitude: String, longitude: String, name: String }
        )
      end
      def to_hash
      end
    end
  end
end
