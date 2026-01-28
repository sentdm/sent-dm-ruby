# typed: strong

module SentDm
  module Models
    class MessageRetrieveResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SentDm::Models::MessageRetrieveResponse,
            SentDm::Internal::AnyHash
          )
        end

      # The unique identifier of the message
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # The messaging channel used (e.g., SMS, WhatsApp)
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # The unique identifier of the contact who received the message
      sig { returns(T.nilable(String)) }
      attr_reader :contact_id

      sig { params(contact_id: String).void }
      attr_writer :contact_id

      # The final price charged for sending this message
      sig { returns(T.nilable(Float)) }
      attr_accessor :corrected_price

      # The date and time when the message was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # The unique identifier of the customer who sent the message
      sig { returns(T.nilable(String)) }
      attr_reader :customer_id

      sig { params(customer_id: String).void }
      attr_writer :customer_id

      # A chronological list of status change events for this message. Each event
      # includes a status and timestamp, following industry standards (Twilio, SendGrid,
      # Mailgun). Events are ordered chronologically from oldest to newest.
      sig do
        returns(
          T.nilable(T::Array[SentDm::Models::MessageRetrieveResponse::Event])
        )
      end
      attr_accessor :events

      # The message body content with variables substituted
      sig do
        returns(T.nilable(SentDm::Models::MessageRetrieveResponse::MessageBody))
      end
      attr_reader :message_body

      sig do
        params(
          message_body:
            T.nilable(
              SentDm::Models::MessageRetrieveResponse::MessageBody::OrHash
            )
        ).void
      end
      attr_writer :message_body

      # The phone number of the recipient (E.164 format)
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number

      sig { params(phone_number: String).void }
      attr_writer :phone_number

      # The phone number in international format
      sig { returns(T.nilable(String)) }
      attr_reader :phone_number_international

      sig { params(phone_number_international: String).void }
      attr_writer :phone_number_international

      # The region code of the phone number (e.g., US, GB, DE)
      sig { returns(T.nilable(String)) }
      attr_reader :region_code

      sig { params(region_code: String).void }
      attr_writer :region_code

      # The delivery status of the message (e.g., sent, delivered, failed, read)
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # The category of the template (e.g., MARKETING, UTILITY, AUTHENTICATION)
      sig { returns(T.nilable(String)) }
      attr_reader :template_category

      sig { params(template_category: String).void }
      attr_writer :template_category

      # The unique identifier of the template used for this message (null if no template
      # was used)
      sig { returns(T.nilable(String)) }
      attr_accessor :template_id

      # The display name of the template
      sig { returns(T.nilable(String)) }
      attr_reader :template_name

      sig { params(template_name: String).void }
      attr_writer :template_name

      # Represents a sent message with comprehensive delivery and template information
      # (v2)
      sig do
        params(
          id: String,
          channel: String,
          contact_id: String,
          corrected_price: T.nilable(Float),
          created_at: Time,
          customer_id: String,
          events:
            T.nilable(
              T::Array[SentDm::Models::MessageRetrieveResponse::Event::OrHash]
            ),
          message_body:
            T.nilable(
              SentDm::Models::MessageRetrieveResponse::MessageBody::OrHash
            ),
          phone_number: String,
          phone_number_international: String,
          region_code: String,
          status: String,
          template_category: String,
          template_id: T.nilable(String),
          template_name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier of the message
        id: nil,
        # The messaging channel used (e.g., SMS, WhatsApp)
        channel: nil,
        # The unique identifier of the contact who received the message
        contact_id: nil,
        # The final price charged for sending this message
        corrected_price: nil,
        # The date and time when the message was created
        created_at: nil,
        # The unique identifier of the customer who sent the message
        customer_id: nil,
        # A chronological list of status change events for this message. Each event
        # includes a status and timestamp, following industry standards (Twilio, SendGrid,
        # Mailgun). Events are ordered chronologically from oldest to newest.
        events: nil,
        # The message body content with variables substituted
        message_body: nil,
        # The phone number of the recipient (E.164 format)
        phone_number: nil,
        # The phone number in international format
        phone_number_international: nil,
        # The region code of the phone number (e.g., US, GB, DE)
        region_code: nil,
        # The delivery status of the message (e.g., sent, delivered, failed, read)
        status: nil,
        # The category of the template (e.g., MARKETING, UTILITY, AUTHENTICATION)
        template_category: nil,
        # The unique identifier of the template used for this message (null if no template
        # was used)
        template_id: nil,
        # The display name of the template
        template_name: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            channel: String,
            contact_id: String,
            corrected_price: T.nilable(Float),
            created_at: Time,
            customer_id: String,
            events:
              T.nilable(
                T::Array[SentDm::Models::MessageRetrieveResponse::Event]
              ),
            message_body:
              T.nilable(SentDm::Models::MessageRetrieveResponse::MessageBody),
            phone_number: String,
            phone_number_international: String,
            region_code: String,
            status: String,
            template_category: String,
            template_id: T.nilable(String),
            template_name: String
          }
        )
      end
      def to_hash
      end

      class Event < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::MessageRetrieveResponse::Event,
              SentDm::Internal::AnyHash
            )
          end

        # Optional human-readable description of the event Useful for error messages or
        # additional context
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # The status of the message at this point in time Examples: "queued", "sent",
        # "delivered", "read", "failed"
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        # When this status change occurred (ISO 8601 format)
        sig { returns(T.nilable(Time)) }
        attr_reader :timestamp

        sig { params(timestamp: Time).void }
        attr_writer :timestamp

        # Represents a status change event in a message's lifecycle Follows industry
        # standards (Twilio, SendGrid, Mailgun pattern)
        sig do
          params(
            description: T.nilable(String),
            status: String,
            timestamp: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Optional human-readable description of the event Useful for error messages or
          # additional context
          description: nil,
          # The status of the message at this point in time Examples: "queued", "sent",
          # "delivered", "read", "failed"
          status: nil,
          # When this status change occurred (ISO 8601 format)
          timestamp: nil
        )
        end

        sig do
          override.returns(
            { description: T.nilable(String), status: String, timestamp: Time }
          )
        end
        def to_hash
        end
      end

      class MessageBody < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::MessageRetrieveResponse::MessageBody,
              SentDm::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[
                SentDm::Models::MessageRetrieveResponse::MessageBody::Button
              ]
            )
          )
        end
        attr_accessor :buttons

        sig { returns(T.nilable(String)) }
        attr_reader :content

        sig { params(content: String).void }
        attr_writer :content

        sig { returns(T.nilable(String)) }
        attr_accessor :footer

        sig { returns(T.nilable(String)) }
        attr_accessor :header

        # The message body content with variables substituted
        sig do
          params(
            buttons:
              T.nilable(
                T::Array[
                  SentDm::Models::MessageRetrieveResponse::MessageBody::Button::OrHash
                ]
              ),
            content: String,
            footer: T.nilable(String),
            header: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(buttons: nil, content: nil, footer: nil, header: nil)
        end

        sig do
          override.returns(
            {
              buttons:
                T.nilable(
                  T::Array[
                    SentDm::Models::MessageRetrieveResponse::MessageBody::Button
                  ]
                ),
              content: String,
              footer: T.nilable(String),
              header: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Button < SentDm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SentDm::Models::MessageRetrieveResponse::MessageBody::Button,
                SentDm::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          sig { returns(T.nilable(String)) }
          attr_reader :value

          sig { params(value: String).void }
          attr_writer :value

          sig { params(type: String, value: String).returns(T.attached_class) }
          def self.new(type: nil, value: nil)
          end

          sig { override.returns({ type: String, value: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
