# typed: strong

module SentDm
  module Models
    class MessageSendResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::Models::MessageSendResponse, SentDm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(SentDm::Models::MessageSendResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(SentDm::Models::MessageSendResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error details (null if successful)
      sig { returns(T.nilable(SentDm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(SentDm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
      sig { returns(T.nilable(SentDm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: SentDm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(SentDm::Models::MessageSendResponse::Data::OrHash),
          error: T.nilable(SentDm::APIError::OrHash),
          meta: SentDm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
        data: nil,
        # Error details (null if successful)
        error: nil,
        # Metadata about the request and response
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(SentDm::Models::MessageSendResponse::Data),
            error: T.nilable(SentDm::APIError),
            meta: SentDm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::MessageSendResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        # Resolved template body text
        sig { returns(T.nilable(String)) }
        attr_accessor :body

        # Per-recipient message results
        sig do
          returns(
            T.nilable(
              T::Array[SentDm::Models::MessageSendResponse::Data::Recipient]
            )
          )
        end
        attr_reader :recipients

        sig do
          params(
            recipients:
              T::Array[
                SentDm::Models::MessageSendResponse::Data::Recipient::OrHash
              ]
          ).void
        end
        attr_writer :recipients

        # Overall request status (e.g. "accepted")
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

        # The response data (null if error)
        sig do
          params(
            body: T.nilable(String),
            recipients:
              T::Array[
                SentDm::Models::MessageSendResponse::Data::Recipient::OrHash
              ],
            status: String,
            template_id: String,
            template_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Resolved template body text
          body: nil,
          # Per-recipient message results
          recipients: nil,
          # Overall request status (e.g. "accepted")
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
              body: T.nilable(String),
              recipients:
                T::Array[SentDm::Models::MessageSendResponse::Data::Recipient],
              status: String,
              template_id: String,
              template_name: String
            }
          )
        end
        def to_hash
        end

        class Recipient < SentDm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SentDm::Models::MessageSendResponse::Data::Recipient,
                SentDm::Internal::AnyHash
              )
            end

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
              channel: T.nilable(String),
              message_id: String,
              to: String
            ).returns(T.attached_class)
          end
          def self.new(
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
              { channel: T.nilable(String), message_id: String, to: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
