# typed: strong

module Sentdm
  module Models
    module Voice
      class CallRecordings < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Voice::CallRecordings, Sentdm::Internal::AnyHash)
          end

        # Every recording of the call, oldest first. Empty until the first
        # call.recording_ready webhook has been sent, and for a call that was never
        # recorded
        sig { returns(T.nilable(T::Array[Sentdm::Voice::CallRecording])) }
        attr_reader :recordings

        sig do
          params(
            recordings: T::Array[Sentdm::Voice::CallRecording::OrHash]
          ).void
        end
        attr_writer :recordings

        # The recordings of a call, each as a short-lived download link
        sig do
          params(
            recordings: T::Array[Sentdm::Voice::CallRecording::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # Every recording of the call, oldest first. Empty until the first
          # call.recording_ready webhook has been sent, and for a call that was never
          # recorded
          recordings: nil
        )
        end

        sig do
          override.returns(
            { recordings: T::Array[Sentdm::Voice::CallRecording] }
          )
        end
        def to_hash
        end
      end
    end
  end
end
