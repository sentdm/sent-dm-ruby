# typed: strong

module Sentdm
  module Models
    class ConversationMessagesList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ConversationMessagesList, Sentdm::Internal::AnyHash)
        end

      # The messages on this page, most recent first.
      sig do
        returns(T.nilable(T::Array[Sentdm::ConversationMessagesList::Message]))
      end
      attr_reader :messages

      sig do
        params(
          messages: T::Array[Sentdm::ConversationMessagesList::Message::OrHash]
        ).void
      end
      attr_writer :messages

      # Pagination metadata for list responses
      sig { returns(T.nilable(Sentdm::PaginationMeta)) }
      attr_reader :pagination

      sig { params(pagination: Sentdm::PaginationMeta::OrHash).void }
      attr_writer :pagination

      # A paginated list of messages — used by both conversation read endpoints.
      sig do
        params(
          messages: T::Array[Sentdm::ConversationMessagesList::Message::OrHash],
          pagination: Sentdm::PaginationMeta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The messages on this page, most recent first.
        messages: nil,
        # Pagination metadata for list responses
        pagination: nil
      )
      end

      sig do
        override.returns(
          {
            messages: T::Array[Sentdm::ConversationMessagesList::Message],
            pagination: Sentdm::PaginationMeta
          }
        )
      end
      def to_hash
      end

      class Message < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::ConversationMessagesList::Message,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(Float)) }
        attr_accessor :active_contact_price

        sig { returns(T.nilable(String)) }
        attr_reader :channel

        sig { params(channel: String).void }
        attr_writer :channel

        sig { returns(T.nilable(String)) }
        attr_reader :contact_id

        sig { params(contact_id: String).void }
        attr_writer :contact_id

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig { returns(T.nilable(String)) }
        attr_reader :customer_id

        sig { params(customer_id: String).void }
        attr_writer :customer_id

        sig { returns(T.nilable(String)) }
        attr_reader :direction

        sig { params(direction: String).void }
        attr_writer :direction

        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::ConversationMessagesList::Message::Event]
            )
          )
        end
        attr_accessor :events

        # Structured message body format for database storage. Preserves channel-specific
        # components (header, body, footer, buttons).
        sig do
          returns(
            T.nilable(Sentdm::ConversationMessagesList::Message::MessageBody)
          )
        end
        attr_reader :message_body

        sig do
          params(
            message_body:
              T.nilable(
                Sentdm::ConversationMessagesList::Message::MessageBody::OrHash
              )
          ).void
        end
        attr_writer :message_body

        sig { returns(T.nilable(String)) }
        attr_reader :phone

        sig { params(phone: String).void }
        attr_writer :phone

        sig { returns(T.nilable(String)) }
        attr_reader :phone_international

        sig { params(phone_international: String).void }
        attr_writer :phone_international

        sig { returns(T.nilable(Float)) }
        attr_accessor :price

        sig { returns(T.nilable(String)) }
        attr_reader :region_code

        sig { params(region_code: String).void }
        attr_writer :region_code

        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        sig { returns(T.nilable(String)) }
        attr_accessor :template_category

        sig { returns(T.nilable(String)) }
        attr_accessor :template_id

        sig { returns(T.nilable(String)) }
        attr_accessor :template_name

        # Message response for v3 API — same shape as v2 with snake_case JSON conventions
        sig do
          params(
            id: String,
            active_contact_price: T.nilable(Float),
            channel: String,
            contact_id: String,
            created_at: Time,
            customer_id: String,
            direction: String,
            events:
              T.nilable(
                T::Array[
                  Sentdm::ConversationMessagesList::Message::Event::OrHash
                ]
              ),
            message_body:
              T.nilable(
                Sentdm::ConversationMessagesList::Message::MessageBody::OrHash
              ),
            phone: String,
            phone_international: String,
            price: T.nilable(Float),
            region_code: String,
            status: String,
            template_category: T.nilable(String),
            template_id: T.nilable(String),
            template_name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          active_contact_price: nil,
          channel: nil,
          contact_id: nil,
          created_at: nil,
          customer_id: nil,
          direction: nil,
          events: nil,
          # Structured message body format for database storage. Preserves channel-specific
          # components (header, body, footer, buttons).
          message_body: nil,
          phone: nil,
          phone_international: nil,
          price: nil,
          region_code: nil,
          status: nil,
          template_category: nil,
          template_id: nil,
          template_name: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              active_contact_price: T.nilable(Float),
              channel: String,
              contact_id: String,
              created_at: Time,
              customer_id: String,
              direction: String,
              events:
                T.nilable(
                  T::Array[Sentdm::ConversationMessagesList::Message::Event]
                ),
              message_body:
                T.nilable(
                  Sentdm::ConversationMessagesList::Message::MessageBody
                ),
              phone: String,
              phone_international: String,
              price: T.nilable(Float),
              region_code: String,
              status: String,
              template_category: T.nilable(String),
              template_id: T.nilable(String),
              template_name: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Event < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::ConversationMessagesList::Message::Event,
                Sentdm::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :status

          sig { returns(Time) }
          attr_accessor :timestamp

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # Represents a status change event in a message's lifecycle (v3)
          sig do
            params(
              status: String,
              timestamp: Time,
              description: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(status:, timestamp:, description: nil)
          end

          sig do
            override.returns(
              {
                status: String,
                timestamp: Time,
                description: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class MessageBody < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::ConversationMessagesList::Message::MessageBody,
                Sentdm::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  Sentdm::ConversationMessagesList::Message::MessageBody::Button
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

          # Structured message body format for database storage. Preserves channel-specific
          # components (header, body, footer, buttons).
          sig do
            params(
              buttons:
                T.nilable(
                  T::Array[
                    Sentdm::ConversationMessagesList::Message::MessageBody::Button::OrHash
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
                      Sentdm::ConversationMessagesList::Message::MessageBody::Button
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

          class Button < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::ConversationMessagesList::Message::MessageBody::Button,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :postback_data

            sig { returns(T.nilable(String)) }
            attr_accessor :text

            sig { returns(T.nilable(String)) }
            attr_reader :type

            sig { params(type: String).void }
            attr_writer :type

            sig { returns(T.nilable(String)) }
            attr_reader :value

            sig { params(value: String).void }
            attr_writer :value

            sig do
              params(
                postback_data: T.nilable(String),
                text: T.nilable(String),
                type: String,
                value: String
              ).returns(T.attached_class)
            end
            def self.new(postback_data: nil, text: nil, type: nil, value: nil)
            end

            sig do
              override.returns(
                {
                  postback_data: T.nilable(String),
                  text: T.nilable(String),
                  type: String,
                  value: String
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
end
