# typed: strong

module Sentdm
  module Models
    class ProfileCompletionAccepted < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileCompletionAccepted, Sentdm::Internal::AnyHash)
        end

      # Human-readable message describing the accepted state.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Response acknowledging that profile completion has been accepted and started in
      # the background. The provided webhook URL will be called when processing
      # finishes.
      sig { params(message: String).returns(T.attached_class) }
      def self.new(
        # Human-readable message describing the accepted state.
        message: nil
      )
      end

      sig { override.returns({ message: String }) }
      def to_hash
      end
    end
  end
end
