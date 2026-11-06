# typed: strong

module Sentdm
  module Models
    class ProfileCompletionResult < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileCompletionResult, Sentdm::Internal::AnyHash)
        end

      # Human-readable message describing the result.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Current process status of the profile (e.g., "completed", "submitted",
      # "in_progress").
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # Response when a profile is already in the completed state and no further action
      # is taken.
      sig { params(message: String, status: String).returns(T.attached_class) }
      def self.new(
        # Human-readable message describing the result.
        message: nil,
        # Current process status of the profile (e.g., "completed", "submitted",
        # "in_progress").
        status: nil
      )
      end

      sig { override.returns({ message: String, status: String }) }
      def to_hash
      end
    end
  end
end
