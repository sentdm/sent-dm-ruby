# frozen_string_literal: true

module Sentdm
  module Models
    class InboundMedia < Sentdm::Internal::Type::BaseModel
      # @!attribute hash_sha256
      #   SHA-256 of the file as the carrier declared it, when it declares one. Verify
      #   what you download against this — sent.dm never reads the bytes, so it is the
      #   only integrity signal available.
      #
      #   @return [String, nil]
      optional :hash_sha256, String, nil?: true

      # @!attribute mime_type
      #   Content type as the carrier reported it, for example image/jpeg.
      #
      #   @return [String, nil]
      optional :mime_type, String, nil?: true

      # @!attribute size_bytes
      #   Size in bytes as the carrier declared it. Absent when it declared none.
      #
      #   @return [Integer, nil]
      optional :size_bytes, Integer, nil?: true

      # @!attribute url
      #   Where the carrier hosts the attachment.
      #
      #   This link expires and is not authenticated. sent.dm relays it rather than
      #   copying the file, so how long it stays fetchable is the carrier's decision and
      #   differs between them — assume days, not months. Anyone holding the URL can fetch
      #   it until it lapses. Copy the file on receipt if you need it to outlive that
      #   window; do not store this URL as a permanent reference.
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(hash_sha256: nil, mime_type: nil, size_bytes: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::InboundMedia} for more details.
      #
      #   One attachment on an inbound message.
      #
      #   @param hash_sha256 [String, nil] SHA-256 of the file as the carrier declared it, when it declares one. Verify wha
      #
      #   @param mime_type [String, nil] Content type as the carrier reported it, for example image/jpeg.
      #
      #   @param size_bytes [Integer, nil] Size in bytes as the carrier declared it. Absent when it declared none.
      #
      #   @param url [String, nil] Where the carrier hosts the attachment.
    end
  end
end
