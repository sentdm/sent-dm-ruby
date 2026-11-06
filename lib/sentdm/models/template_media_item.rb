# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateMediaItem < Sentdm::Internal::Type::BaseModel
      # @!attribute media_type
      #   One of MmsMediaTypes. Advisory: the carrier reads the Content-Type off the
      #   fetched object, not this field. It exists so an authoring UI can render the
      #   right preview and so a reviewer can see what was intended.
      #
      #   @return [String, nil]
      optional :media_type, String, api_name: :mediaType, nil?: true

      # @!attribute url
      #   Publicly fetchable https URL. The carrier's MMSC fetches this at send time, so
      #   it has to stay reachable and unauthenticated for the life of the send —
      #   including retries and a DLQ replay — which is why a presigned URL is not a valid
      #   value here.
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(media_type: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateMediaItem} for more details.
      #
      #   One attachment on an MMS template body.
      #
      #   @param media_type [String, nil] One of MmsMediaTypes. Advisory: the carrier reads the Content-Type off the
      #
      #   @param url [String] Publicly fetchable https URL. The carrier's MMSC fetches this at send time, so i
    end
  end
end
