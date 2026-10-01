# typed: strong

module Sentdm
  module Models
    class CallRecordings < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::CallRecordings, Sentdm::Internal::AnyHash)
        end

      # Every recording of the call, oldest first. Empty until the first
      # call.recording_ready webhook has been sent, and for a call that was never
      # recorded
      sig { returns(T.nilable(T::Array[Sentdm::CallRecording])) }
      attr_reader :recordings

      sig { params(recordings: T::Array[Sentdm::CallRecording::OrHash]).void }
      attr_writer :recordings

      # The recordings of a call, each as a short-lived download link
      sig do
        params(recordings: T::Array[Sentdm::CallRecording::OrHash]).returns(
          T.attached_class
        )
      end
      def self.new(
        # Every recording of the call, oldest first. Empty until the first
        # call.recording_ready webhook has been sent, and for a call that was never
        # recorded
        recordings: nil
      )
      end

      sig { override.returns({ recordings: T::Array[Sentdm::CallRecording] }) }
      def to_hash
      end
    end
  end
end
