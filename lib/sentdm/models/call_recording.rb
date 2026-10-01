# frozen_string_literal: true

module Sentdm
  module Models
    class CallRecording < Sentdm::Internal::Type::BaseModel
      # @!attribute download_url
      #   A pre-signed link that downloads the recording as an MP3 file. Anyone holding it
      #   can download the recording until it expires
      #
      #   @return [String, nil]
      optional :download_url, String

      # @!attribute recording_id
      #   The recording's id, the one the call.recording_ready webhook announced it under
      #
      #   @return [String, nil]
      optional :recording_id, String

      # @!attribute url_expires_at
      #   When the link stops working (UTC). Request the recordings again for a fresh link
      #
      #   @return [Time, nil]
      optional :url_expires_at, Time

      # @!method initialize(download_url: nil, recording_id: nil, url_expires_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::CallRecording} for more details.
      #
      #   A short-lived link to a call recording
      #
      #   @param download_url [String] A pre-signed link that downloads the recording as an MP3 file. Anyone holding it
      #
      #   @param recording_id [String] The recording's id, the one the call.recording_ready webhook announced it under
      #
      #   @param url_expires_at [Time] When the link stops working (UTC). Request the recordings again for a fresh link
    end
  end
end
