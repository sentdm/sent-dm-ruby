# typed: strong

module Sentdm
  module Models
    class ContactRetrieveMessageSummaryResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::ContactRetrieveMessageSummaryResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # The response data (null if error)
      sig do
        returns(
          T.nilable(Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data)
        )
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::OrHash
            )
        ).void
      end
      attr_writer :data

      # Error information
      sig do
        returns(
          T.nilable(
            Sentdm::Models::ContactRetrieveMessageSummaryResponse::Error
          )
        )
      end
      attr_reader :error

      sig do
        params(
          error:
            T.nilable(
              Sentdm::Models::ContactRetrieveMessageSummaryResponse::Error::OrHash
            )
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig do
        returns(
          T.nilable(Sentdm::Models::ContactRetrieveMessageSummaryResponse::Meta)
        )
      end
      attr_reader :meta

      sig do
        params(
          meta:
            Sentdm::Models::ContactRetrieveMessageSummaryResponse::Meta::OrHash
        ).void
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
          data:
            T.nilable(
              Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::OrHash
            ),
          error:
            T.nilable(
              Sentdm::Models::ContactRetrieveMessageSummaryResponse::Error::OrHash
            ),
          meta:
            Sentdm::Models::ContactRetrieveMessageSummaryResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
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
            data:
              T.nilable(
                Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data
              ),
            error:
              T.nilable(
                Sentdm::Models::ContactRetrieveMessageSummaryResponse::Error
              ),
            meta: Sentdm::Models::ContactRetrieveMessageSummaryResponse::Meta,
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
              Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[
                Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore
              ]
            )
          )
        end
        attr_reader :channel_scores

        sig do
          params(
            channel_scores:
              T::Array[
                Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore::OrHash
              ]
          ).void
        end
        attr_writer :channel_scores

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :channels_used

        sig { params(channels_used: T::Array[String]).void }
        attr_writer :channels_used

        sig { returns(T.nilable(String)) }
        attr_reader :contact_id

        sig { params(contact_id: String).void }
        attr_writer :contact_id

        sig { returns(T.nilable(Time)) }
        attr_accessor :first_message_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :last_message_at

        sig { returns(T.nilable(Integer)) }
        attr_reader :message_count

        sig { params(message_count: Integer).void }
        attr_writer :message_count

        # The response data (null if error)
        sig do
          params(
            channel_scores:
              T::Array[
                Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore::OrHash
              ],
            channels_used: T::Array[String],
            contact_id: String,
            first_message_at: T.nilable(Time),
            last_message_at: T.nilable(Time),
            message_count: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          channel_scores: nil,
          channels_used: nil,
          contact_id: nil,
          first_message_at: nil,
          last_message_at: nil,
          message_count: nil
        )
        end

        sig do
          override.returns(
            {
              channel_scores:
                T::Array[
                  Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore
                ],
              channels_used: T::Array[String],
              contact_id: String,
              first_message_at: T.nilable(Time),
              last_message_at: T.nilable(Time),
              message_count: Integer
            }
          )
        end
        def to_hash
        end

        class ChannelScore < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::ContactRetrieveMessageSummaryResponse::Data::ChannelScore,
                Sentdm::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :channel

          sig { params(channel: String).void }
          attr_writer :channel

          # Percentage (0-100) of messages on this channel that ended in FAILED.
          sig { returns(T.nilable(Integer)) }
          attr_reader :fail_score

          sig { params(fail_score: Integer).void }
          attr_writer :fail_score

          # Percentage (0-100) of messages on this channel that reached a successful
          # terminal state: SENT/DELIVERED/READ for outbound, RECEIVED for inbound.
          sig { returns(T.nilable(Integer)) }
          attr_reader :success_score

          sig { params(success_score: Integer).void }
          attr_writer :success_score

          sig do
            params(
              channel: String,
              fail_score: Integer,
              success_score: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            channel: nil,
            # Percentage (0-100) of messages on this channel that ended in FAILED.
            fail_score: nil,
            # Percentage (0-100) of messages on this channel that reached a successful
            # terminal state: SENT/DELIVERED/READ for outbound, RECEIVED for inbound.
            success_score: nil
          )
          end

          sig do
            override.returns(
              { channel: String, fail_score: Integer, success_score: Integer }
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
              Sentdm::Models::ContactRetrieveMessageSummaryResponse::Error,
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
              Sentdm::Models::ContactRetrieveMessageSummaryResponse::Meta,
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
