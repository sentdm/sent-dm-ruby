# typed: strong

module Sentdm
  module Models
    class InboundMedia < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::InboundMedia, Sentdm::Internal::AnyHash) }

      # SHA-256 of the file as the carrier declared it, when it declares one. Verify
      # what you download against this — sent.dm never reads the bytes, so it is the
      # only integrity signal available.
      sig { returns(T.nilable(String)) }
      attr_accessor :hash_sha256

      # Content type as the carrier reported it, for example image/jpeg.
      sig { returns(T.nilable(String)) }
      attr_accessor :mime_type

      # Size in bytes as the carrier declared it. Absent when it declared none.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :size_bytes

      # Where the carrier hosts the attachment.
      #
      # This link expires and is not authenticated. sent.dm relays it rather than
      # copying the file, so how long it stays fetchable is the carrier's decision and
      # differs between them — assume days, not months. Anyone holding the URL can fetch
      # it until it lapses. Copy the file on receipt if you need it to outlive that
      # window; do not store this URL as a permanent reference.
      sig { returns(T.nilable(String)) }
      attr_accessor :url

      # One attachment on an inbound message.
      sig do
        params(
          hash_sha256: T.nilable(String),
          mime_type: T.nilable(String),
          size_bytes: T.nilable(Integer),
          url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # SHA-256 of the file as the carrier declared it, when it declares one. Verify
        # what you download against this — sent.dm never reads the bytes, so it is the
        # only integrity signal available.
        hash_sha256: nil,
        # Content type as the carrier reported it, for example image/jpeg.
        mime_type: nil,
        # Size in bytes as the carrier declared it. Absent when it declared none.
        size_bytes: nil,
        # Where the carrier hosts the attachment.
        #
        # This link expires and is not authenticated. sent.dm relays it rather than
        # copying the file, so how long it stays fetchable is the carrier's decision and
        # differs between them — assume days, not months. Anyone holding the URL can fetch
        # it until it lapses. Copy the file on receipt if you need it to outlive that
        # window; do not store this URL as a permanent reference.
        url: nil
      )
      end

      sig do
        override.returns(
          {
            hash_sha256: T.nilable(String),
            mime_type: T.nilable(String),
            size_bytes: T.nilable(Integer),
            url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
