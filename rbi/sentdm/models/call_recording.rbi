# typed: strong

module Sentdm
  module Models
    class CallRecording < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::CallRecording, Sentdm::Internal::AnyHash) }

      # A pre-signed link that downloads the recording as an MP3 file. Anyone holding it
      # can download the recording until it expires
      sig { returns(T.nilable(String)) }
      attr_reader :download_url

      sig { params(download_url: String).void }
      attr_writer :download_url

      # The recording's id, the one the call.recording_ready webhook announced it under
      sig { returns(T.nilable(String)) }
      attr_reader :recording_id

      sig { params(recording_id: String).void }
      attr_writer :recording_id

      # When the link stops working (UTC). Request the recordings again for a fresh link
      sig { returns(T.nilable(Time)) }
      attr_reader :url_expires_at

      sig { params(url_expires_at: Time).void }
      attr_writer :url_expires_at

      # A short-lived link to a call recording
      sig do
        params(
          download_url: String,
          recording_id: String,
          url_expires_at: Time
        ).returns(T.attached_class)
      end
      def self.new(
        # A pre-signed link that downloads the recording as an MP3 file. Anyone holding it
        # can download the recording until it expires
        download_url: nil,
        # The recording's id, the one the call.recording_ready webhook announced it under
        recording_id: nil,
        # When the link stops working (UTC). Request the recordings again for a fresh link
        url_expires_at: nil
      )
      end

      sig do
        override.returns(
          { download_url: String, recording_id: String, url_expires_at: Time }
        )
      end
      def to_hash
      end
    end
  end
end
