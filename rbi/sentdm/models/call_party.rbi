# typed: strong

module Sentdm
  module Models
    class CallParty < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::CallParty, Sentdm::Internal::AnyHash) }

      # user for one of your app users, number for a phone number, conference for a
      # room, anonymous for a caller who withheld their number
      sig { returns(T.nilable(String)) }
      attr_reader :kind

      sig { params(kind: String).void }
      attr_writer :kind

      # The app user's identity, the phone number in E.164 format, or the room name.
      # Null when the kind is anonymous
      sig { returns(T.nilable(String)) }
      attr_accessor :value

      # One end of a call
      sig do
        params(kind: String, value: T.nilable(String)).returns(T.attached_class)
      end
      def self.new(
        # user for one of your app users, number for a phone number, conference for a
        # room, anonymous for a caller who withheld their number
        kind: nil,
        # The app user's identity, the phone number in E.164 format, or the room name.
        # Null when the kind is anonymous
        value: nil
      )
      end

      sig { override.returns({ kind: String, value: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
