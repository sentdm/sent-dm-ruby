# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceCallbackTestResponseInfo < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::VoiceCallbackTestResponseInfo,
              Sentdm::Internal::AnyHash
            )
          end

        # The start of the raw response body, capped at 2048 characters
        sig { returns(T.nilable(String)) }
        attr_accessor :body

        # The HTTP status your endpoint returned
        sig { returns(T.nilable(Integer)) }
        attr_reader :status_code

        sig { params(status_code: Integer).void }
        attr_writer :status_code

        # What your endpoint answered
        sig do
          params(body: T.nilable(String), status_code: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The start of the raw response body, capped at 2048 characters
          body: nil,
          # The HTTP status your endpoint returned
          status_code: nil
        )
        end

        sig do
          override.returns({ body: T.nilable(String), status_code: Integer })
        end
        def to_hash
        end
      end
    end
  end
end
