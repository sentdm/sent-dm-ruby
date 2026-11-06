# typed: strong

module Sentdm
  module Models
    class TemplateMediaItem < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateMediaItem, Sentdm::Internal::AnyHash)
        end

      # One of MmsMediaTypes. Advisory: the carrier reads the Content-Type off the
      # fetched object, not this field. It exists so an authoring UI can render the
      # right preview and so a reviewer can see what was intended.
      sig { returns(T.nilable(String)) }
      attr_accessor :media_type

      # Publicly fetchable https URL. The carrier's MMSC fetches this at send time, so
      # it has to stay reachable and unauthenticated for the life of the send —
      # including retries and a DLQ replay — which is why a presigned URL is not a valid
      # value here.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # One attachment on an MMS template body.
      sig do
        params(media_type: T.nilable(String), url: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # One of MmsMediaTypes. Advisory: the carrier reads the Content-Type off the
        # fetched object, not this field. It exists so an authoring UI can render the
        # right preview and so a reviewer can see what was intended.
        media_type: nil,
        # Publicly fetchable https URL. The carrier's MMSC fetches this at send time, so
        # it has to stay reachable and unauthenticated for the life of the send —
        # including retries and a DLQ replay — which is why a presigned URL is not a valid
        # value here.
        url: nil
      )
      end

      sig { override.returns({ media_type: T.nilable(String), url: String }) }
      def to_hash
      end
    end
  end
end
