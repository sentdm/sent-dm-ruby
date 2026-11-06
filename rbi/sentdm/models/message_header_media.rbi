# typed: strong

module Sentdm
  module Models
    class MessageHeaderMedia < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::MessageHeaderMedia, Sentdm::Internal::AnyHash)
        end

      # "image", "video" or "document" — taken from the header's media variable.
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # The https URL the caller supplied for this send. Never the template's stored
      # props.sample, which is Meta's expiring header_handle rather than what was
      # delivered.
      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # The media asset that rode a message's header, recorded as sent.
      sig { params(type: String, url: String).returns(T.attached_class) }
      def self.new(
        # "image", "video" or "document" — taken from the header's media variable.
        type: nil,
        # The https URL the caller supplied for this send. Never the template's stored
        # props.sample, which is Meta's expiring header_handle rather than what was
        # delivered.
        url: nil
      )
      end

      sig { override.returns({ type: String, url: String }) }
      def to_hash
      end
    end
  end
end
