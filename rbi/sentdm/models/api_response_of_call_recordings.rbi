# typed: strong

module Sentdm
  module Models
    class APIResponseOfCallRecordings < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::APIResponseOfCallRecordings, Sentdm::Internal::AnyHash)
        end

      # The recordings of a call, each as a short-lived download link
      sig { returns(T.nilable(Sentdm::APIResponseOfCallRecordings::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::APIResponseOfCallRecordings::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::ErrorDetail)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::ErrorDetail::OrHash)).void }
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: Sentdm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::APIResponseOfCallRecordings::Data::OrHash),
          error: T.nilable(Sentdm::ErrorDetail::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The recordings of a call, each as a short-lived download link
        data: nil,
        # Error information
        error: nil,
        # Request and response metadata
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(Sentdm::APIResponseOfCallRecordings::Data),
            error: T.nilable(Sentdm::ErrorDetail),
            meta: Sentdm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::APIResponseOfCallRecordings::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # Every recording of the call, oldest first. Empty until the first
        # call.recording_ready webhook has been sent, and for a call that was never
        # recorded
        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::APIResponseOfCallRecordings::Data::Recording]
            )
          )
        end
        attr_reader :recordings

        sig do
          params(
            recordings:
              T::Array[
                Sentdm::APIResponseOfCallRecordings::Data::Recording::OrHash
              ]
          ).void
        end
        attr_writer :recordings

        # The recordings of a call, each as a short-lived download link
        sig do
          params(
            recordings:
              T::Array[
                Sentdm::APIResponseOfCallRecordings::Data::Recording::OrHash
              ]
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
            {
              recordings:
                T::Array[Sentdm::APIResponseOfCallRecordings::Data::Recording]
            }
          )
        end
        def to_hash
        end

        class Recording < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::APIResponseOfCallRecordings::Data::Recording,
                Sentdm::Internal::AnyHash
              )
            end

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
              {
                download_url: String,
                recording_id: String,
                url_expires_at: Time
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
