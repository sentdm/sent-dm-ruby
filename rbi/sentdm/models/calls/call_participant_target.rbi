# typed: strong

module Sentdm
  module Models
    CallParticipantTarget = Calls::CallParticipantTarget

    module Calls
      class CallParticipantTarget < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Calls::CallParticipantTarget,
              Sentdm::Internal::AnyHash
            )
          end

        # user for one of your app users, number for a phone number
        sig { returns(T.nilable(String)) }
        attr_reader :kind

        sig { params(kind: String).void }
        attr_writer :kind

        # The app user's identity, or the phone number in E.164 format
        sig { returns(T.nilable(String)) }
        attr_reader :value

        sig { params(value: String).void }
        attr_writer :value

        # A participant to add to a call
        sig { params(kind: String, value: String).returns(T.attached_class) }
        def self.new(
          # user for one of your app users, number for a phone number
          kind: nil,
          # The app user's identity, or the phone number in E.164 format
          value: nil
        )
        end

        sig { override.returns({ kind: String, value: String }) }
        def to_hash
        end
      end
    end
  end
end
