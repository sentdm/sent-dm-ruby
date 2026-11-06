# typed: strong

module Sentdm
  module Models
    class MessageMedia < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::MessageMedia, Sentdm::Internal::AnyHash) }

      # One of MmsMediaTypes when the content type is known. Advisory — a reader should
      # trust the fetched object's own Content-Type.
      sig { returns(T.nilable(String)) }
      attr_accessor :media_type

      # Content type as the provider declared it. Null when it declared none.
      sig { returns(T.nilable(String)) }
      attr_accessor :mime_type

      # Size as the provider declared it. Never measured here — nothing downloads the
      # file.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :size_bytes

      # Inbound only: the SHA-256 the provider declared alongside the attachment, when
      # it declared one. Relayed to the customer so they can verify what they fetch
      # matches what the carrier said it sent. It is the only integrity signal available
      # on an attachment nobody here has read.
      sig { returns(T.nilable(String)) }
      attr_accessor :source_hash_sha256

      # Where the file lives. Outbound: the URL the customer gave us and the carrier
      # fetched. Inbound: the URL the carrier hosts it at, relayed unchanged.
      sig { returns(T.nilable(String)) }
      attr_accessor :url

      # One attachment on a message, in either direction — and in both, a URL somebody
      # else hosts.
      #
      # Outbound: the customer supplied a public URL and we handed it to the carrier.
      # Inbound: the carrier hosts the file and we record where. sent.dm never holds the
      # bytes, so there is no key, no expiry bookkeeping and nothing minted per read —
      # what is stored is what is served.
      #
      # An inbound link expires on the carrier's own schedule and is unauthenticated.
      # That is the customer's to manage, and it is documented where they will see it
      # rather than only here — a recipient who needs an attachment to outlive that
      # window copies it on receipt.
      #
      # Storing a presigned URL is the specific mistake this shape still avoids:
      # M260826130000 and M260826140000 exist because RCS assets were stored as signed
      # URLs and went stale. Nothing here is signed.
      sig do
        params(
          media_type: T.nilable(String),
          mime_type: T.nilable(String),
          size_bytes: T.nilable(Integer),
          source_hash_sha256: T.nilable(String),
          url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # One of MmsMediaTypes when the content type is known. Advisory — a reader should
        # trust the fetched object's own Content-Type.
        media_type: nil,
        # Content type as the provider declared it. Null when it declared none.
        mime_type: nil,
        # Size as the provider declared it. Never measured here — nothing downloads the
        # file.
        size_bytes: nil,
        # Inbound only: the SHA-256 the provider declared alongside the attachment, when
        # it declared one. Relayed to the customer so they can verify what they fetch
        # matches what the carrier said it sent. It is the only integrity signal available
        # on an attachment nobody here has read.
        source_hash_sha256: nil,
        # Where the file lives. Outbound: the URL the customer gave us and the carrier
        # fetched. Inbound: the URL the carrier hosts it at, relayed unchanged.
        url: nil
      )
      end

      sig do
        override.returns(
          {
            media_type: T.nilable(String),
            mime_type: T.nilable(String),
            size_bytes: T.nilable(Integer),
            source_hash_sha256: T.nilable(String),
            url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
