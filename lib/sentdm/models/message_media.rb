# frozen_string_literal: true

module Sentdm
  module Models
    class MessageMedia < Sentdm::Internal::Type::BaseModel
      # @!attribute media_type
      #   One of MmsMediaTypes when the content type is known. Advisory — a reader should
      #   trust the fetched object's own Content-Type.
      #
      #   @return [String, nil]
      optional :media_type, String, api_name: :mediaType, nil?: true

      # @!attribute mime_type
      #   Content type as the provider declared it. Null when it declared none.
      #
      #   @return [String, nil]
      optional :mime_type, String, api_name: :mimeType, nil?: true

      # @!attribute size_bytes
      #   Size as the provider declared it. Never measured here — nothing downloads the
      #   file.
      #
      #   @return [Integer, nil]
      optional :size_bytes, Integer, api_name: :sizeBytes, nil?: true

      # @!attribute source_hash_sha256
      #   Inbound only: the SHA-256 the provider declared alongside the attachment, when
      #   it declared one. Relayed to the customer so they can verify what they fetch
      #   matches what the carrier said it sent. It is the only integrity signal available
      #   on an attachment nobody here has read.
      #
      #   @return [String, nil]
      optional :source_hash_sha256, String, api_name: :sourceHashSha256, nil?: true

      # @!attribute url
      #   Where the file lives. Outbound: the URL the customer gave us and the carrier
      #   fetched. Inbound: the URL the carrier hosts it at, relayed unchanged.
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(media_type: nil, mime_type: nil, size_bytes: nil, source_hash_sha256: nil, url: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageMedia} for more details.
      #
      #   One attachment on a message, in either direction — and in both, a URL somebody
      #   else hosts.
      #
      #   Outbound: the customer supplied a public URL and we handed it to the carrier.
      #   Inbound: the carrier hosts the file and we record where. sent.dm never holds the
      #   bytes, so there is no key, no expiry bookkeeping and nothing minted per read —
      #   what is stored is what is served.
      #
      #   An inbound link expires on the carrier's own schedule and is unauthenticated.
      #   That is the customer's to manage, and it is documented where they will see it
      #   rather than only here — a recipient who needs an attachment to outlive that
      #   window copies it on receipt.
      #
      #   Storing a presigned URL is the specific mistake this shape still avoids:
      #   M260826130000 and M260826140000 exist because RCS assets were stored as signed
      #   URLs and went stale. Nothing here is signed.
      #
      #   @param media_type [String, nil] One of MmsMediaTypes when the content type is known. Advisory — a reader should
      #
      #   @param mime_type [String, nil] Content type as the provider declared it. Null when it declared none.
      #
      #   @param size_bytes [Integer, nil] Size as the provider declared it. Never measured here — nothing downloads the fi
      #
      #   @param source_hash_sha256 [String, nil] Inbound only: the SHA-256 the provider declared alongside the attachment, when i
      #
      #   @param url [String, nil] Where the file lives. Outbound: the URL the customer gave us and the carrier fet
    end
  end
end
