# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class CallRecordings < Sentdm::Internal::Type::BaseModel
        # @!attribute recordings
        #   Every recording of the call, oldest first. Empty until the first
        #   call.recording_ready webhook has been sent, and for a call that was never
        #   recorded
        #
        #   @return [Array<Sentdm::Models::Voice::CallRecording>, nil]
        optional :recordings, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::CallRecording] }

        # @!method initialize(recordings: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::CallRecordings} for more details.
        #
        #   The recordings of a call, each as a short-lived download link
        #
        #   @param recordings [Array<Sentdm::Models::Voice::CallRecording>] Every recording of the call, oldest first. Empty until the first
        #   call.recording\_
      end
    end
  end
end
