# typed: strong

module Sentdm
  module Models
    class MessageSendResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::MessageSendResponse, Sentdm::Internal::AnyHash)
        end

      # Response for the multi-recipient send message endpoint
      sig { returns(T.nilable(Sentdm::Models::MessageSendResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::MessageSendResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::MessageSendResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(Sentdm::Models::MessageSendResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::MessageSendResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::MessageSendResponse::Meta::OrHash).void
      end
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::Models::MessageSendResponse::Data::OrHash),
          error: T.nilable(Sentdm::Models::MessageSendResponse::Error::OrHash),
          meta: Sentdm::Models::MessageSendResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Response for the multi-recipient send message endpoint
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
            data: T.nilable(Sentdm::Models::MessageSendResponse::Data),
            error: T.nilable(Sentdm::Models::MessageSendResponse::Error),
            meta: Sentdm::Models::MessageSendResponse::Meta,
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
              Sentdm::Models::MessageSendResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # Per-recipient message results
        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::Models::MessageSendResponse::Data::Recipient]
            )
          )
        end
        attr_reader :recipients

        sig do
          params(
            recipients:
              T::Array[
                Sentdm::Models::MessageSendResponse::Data::Recipient::OrHash
              ]
          ).void
        end
        attr_writer :recipients

        # Overall request status: "QUEUED" when the batch has been accepted and published
        # to Kafka.
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        # Template ID that was used
        sig { returns(T.nilable(String)) }
        attr_reader :template_id

        sig { params(template_id: String).void }
        attr_writer :template_id

        # Template display name
        sig { returns(T.nilable(String)) }
        attr_reader :template_name

        sig { params(template_name: String).void }
        attr_writer :template_name

        # Response for the multi-recipient send message endpoint
        sig do
          params(
            recipients:
              T::Array[
                Sentdm::Models::MessageSendResponse::Data::Recipient::OrHash
              ],
            status: String,
            template_id: String,
            template_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Per-recipient message results
          recipients: nil,
          # Overall request status: "QUEUED" when the batch has been accepted and published
          # to Kafka.
          status: nil,
          # Template ID that was used
          template_id: nil,
          # Template display name
          template_name: nil
        )
        end

        sig do
          override.returns(
            {
              recipients:
                T::Array[Sentdm::Models::MessageSendResponse::Data::Recipient],
              status: String,
              template_id: String,
              template_name: String
            }
          )
        end
        def to_hash
        end

        class Recipient < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::MessageSendResponse::Data::Recipient,
                Sentdm::Internal::AnyHash
              )
            end

          # Resolved template body text for this recipient's channel, or null for
          # auto-detect
          sig { returns(T.nilable(String)) }
          attr_accessor :body

          # Channel this message will be sent on (e.g. "sms", "whatsapp"), or null for
          # auto-detect
          sig { returns(T.nilable(String)) }
          attr_accessor :channel

          # Unique message identifier for tracking this recipient's message
          sig { returns(T.nilable(String)) }
          attr_reader :message_id

          sig { params(message_id: String).void }
          attr_writer :message_id

          # Phone number in E.164 format
          sig { returns(T.nilable(String)) }
          attr_reader :to

          sig { params(to: String).void }
          attr_writer :to

          # Per-recipient result in the send message response
          sig do
            params(
              body: T.nilable(String),
              channel: T.nilable(String),
              message_id: String,
              to: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Resolved template body text for this recipient's channel, or null for
            # auto-detect
            body: nil,
            # Channel this message will be sent on (e.g. "sms", "whatsapp"), or null for
            # auto-detect
            channel: nil,
            # Unique message identifier for tracking this recipient's message
            message_id: nil,
            # Phone number in E.164 format
            to: nil
          )
          end

          sig do
            override.returns(
              {
                body: T.nilable(String),
                channel: T.nilable(String),
                message_id: String,
                to: String
              }
            )
          end
          def to_hash
          end
        end
      end

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::MessageSendResponse::Error,
              Sentdm::Internal::AnyHash
            )
          end

        # Machine-readable error code (e.g., "RESOURCE_001")
        sig { returns(T.nilable(String)) }
        attr_reader :code

        sig { params(code: String).void }
        attr_writer :code

        # Additional validation error details (field-level errors)
        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :details

        # URL to documentation about this error
        sig { returns(T.nilable(String)) }
        attr_accessor :doc_url

        # Human-readable error message
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Error information
        sig do
          params(
            code: String,
            details: T.nilable(T::Hash[Symbol, T::Array[String]]),
            doc_url: T.nilable(String),
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Machine-readable error code (e.g., "RESOURCE_001")
          code: nil,
          # Additional validation error details (field-level errors)
          details: nil,
          # URL to documentation about this error
          doc_url: nil,
          # Human-readable error message
          message: nil
        )
        end

        sig do
          override.returns(
            {
              code: String,
              details: T.nilable(T::Hash[Symbol, T::Array[String]]),
              doc_url: T.nilable(String),
              message: String
            }
          )
        end
        def to_hash
        end
      end

      class Meta < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::MessageSendResponse::Meta,
              Sentdm::Internal::AnyHash
            )
          end

        # Unique identifier for this request (for tracing and support)
        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        # Server timestamp when the response was generated
        sig { returns(T.nilable(Time)) }
        attr_reader :timestamp

        sig { params(timestamp: Time).void }
        attr_writer :timestamp

        # API version used for this request
        sig { returns(T.nilable(String)) }
        attr_reader :version

        sig { params(version: String).void }
        attr_writer :version

        # Request and response metadata
        sig do
          params(request_id: String, timestamp: Time, version: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Unique identifier for this request (for tracing and support)
          request_id: nil,
          # Server timestamp when the response was generated
          timestamp: nil,
          # API version used for this request
          version: nil
        )
        end

        sig do
          override.returns(
            { request_id: String, timestamp: Time, version: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
