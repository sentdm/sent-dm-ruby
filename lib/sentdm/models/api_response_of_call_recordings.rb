# frozen_string_literal: true

module Sentdm
  module Models
    class APIResponseOfCallRecordings < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The recordings of a call, each as a short-lived download link
      #
      #   @return [Sentdm::Models::APIResponseOfCallRecordings::Data, nil]
      optional :data, -> { Sentdm::APIResponseOfCallRecordings::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ErrorDetail, nil]
      optional :error, -> { Sentdm::ErrorDetail }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::APIResponseOfCallRecordings::Data, nil] The recordings of a call, each as a short-lived download link
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::APIResponseOfCallRecordings#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute recordings
        #   Every recording of the call, oldest first. Empty until the first
        #   call.recording_ready webhook has been sent, and for a call that was never
        #   recorded
        #
        #   @return [Array<Sentdm::Models::APIResponseOfCallRecordings::Data::Recording>, nil]
        optional :recordings,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::APIResponseOfCallRecordings::Data::Recording] }

        # @!method initialize(recordings: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::APIResponseOfCallRecordings::Data} for more details.
        #
        #   The recordings of a call, each as a short-lived download link
        #
        #   @param recordings [Array<Sentdm::Models::APIResponseOfCallRecordings::Data::Recording>] Every recording of the call, oldest first. Empty until the first
        #   call.recording\_

        class Recording < Sentdm::Internal::Type::BaseModel
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
          #   {Sentdm::Models::APIResponseOfCallRecordings::Data::Recording} for more details.
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
  end
end
