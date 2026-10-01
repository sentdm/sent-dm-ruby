# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceCallbackTestRequestInfo < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::VoiceCallbackTestRequestInfo,
              Sentdm::Internal::AnyHash
            )
          end

        # The request body byte for byte. This is what the signature covers.
        sig { returns(T.nilable(String)) }
        attr_reader :body

        sig { params(body: String).void }
        attr_writer :body

        # Every header Sent added, the signature included, so you can compare against what
        # your endpoint verified. The signing secret itself is never included.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :headers

        sig { params(headers: T::Hash[Symbol, String]).void }
        attr_writer :headers

        # The callback URL that was called
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # The test question exactly as it was sent
        sig do
          params(
            body: String,
            headers: T::Hash[Symbol, String],
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The request body byte for byte. This is what the signature covers.
          body: nil,
          # Every header Sent added, the signature included, so you can compare against what
          # your endpoint verified. The signing secret itself is never included.
          headers: nil,
          # The callback URL that was called
          url: nil
        )
        end

        sig do
          override.returns(
            { body: String, headers: T::Hash[Symbol, String], url: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
