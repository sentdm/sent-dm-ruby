# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceCallbackTestErrorInfo < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::VoiceCallbackTestErrorInfo,
              Sentdm::Internal::AnyHash
            )
          end

        # What to fix
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Dotted path of the answer field at fault, such as action.action, when one field
        # is to blame
        sig { returns(T.nilable(String)) }
        attr_accessor :path

        # Machine-readable reason, such as timeout, http_error, malformed_json,
        # missing_action or unknown_action
        sig { returns(T.nilable(String)) }
        attr_reader :reason

        sig { params(reason: String).void }
        attr_writer :reason

        # Why the test did not end with ok
        sig do
          params(
            message: String,
            path: T.nilable(String),
            reason: String
          ).returns(T.attached_class)
        end
        def self.new(
          # What to fix
          message: nil,
          # Dotted path of the answer field at fault, such as action.action, when one field
          # is to blame
          path: nil,
          # Machine-readable reason, such as timeout, http_error, malformed_json,
          # missing_action or unknown_action
          reason: nil
        )
        end

        sig do
          override.returns(
            { message: String, path: T.nilable(String), reason: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
