# typed: strong

module SentDm
  module Models
    class MessageRetrieveStatusResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            SentDm::Models::MessageRetrieveStatusResponse,
            SentDm::Internal::AnyHash
          )
        end

      # The response data (null if error)
      sig do
        returns(T.nilable(SentDm::Models::MessageRetrieveStatusResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              SentDm::Models::MessageRetrieveStatusResponse::Data::OrHash
            )
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
          data:
            T.nilable(
              SentDm::Models::MessageRetrieveStatusResponse::Data::OrHash
            ),
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
            data:
              T.nilable(SentDm::Models::MessageRetrieveStatusResponse::Data),
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
              SentDm::Models::MessageRetrieveStatusResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

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

        sig do
          returns(
            T.nilable(
              T::Array[
                SentDm::Models::MessageRetrieveStatusResponse::Data::Event
              ]
            )
          )
        end
        attr_accessor :events

        # Structured message body format for database storage. Preserves channel-specific
        # components (header, body, footer, buttons).
        sig do
          returns(
            T.nilable(
              SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody
            )
          )
        end
        attr_reader :message_body

        sig do
          params(
            message_body:
              T.nilable(
                SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::OrHash
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
        attr_reader :template_category

        sig { params(template_category: String).void }
        attr_writer :template_category

        sig { returns(T.nilable(String)) }
        attr_accessor :template_id

        sig { returns(T.nilable(String)) }
        attr_reader :template_name

        sig { params(template_name: String).void }
        attr_writer :template_name

        # The response data (null if error)
        sig do
          params(
            id: String,
            channel: String,
            contact_id: String,
            created_at: Time,
            customer_id: String,
            events:
              T.nilable(
                T::Array[
                  SentDm::Models::MessageRetrieveStatusResponse::Data::Event::OrHash
                ]
              ),
            message_body:
              T.nilable(
                SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::OrHash
              ),
            phone: String,
            phone_international: String,
            price: T.nilable(Float),
            region_code: String,
            status: String,
            template_category: String,
            template_id: T.nilable(String),
            template_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          channel: nil,
          contact_id: nil,
          created_at: nil,
          customer_id: nil,
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
              channel: String,
              contact_id: String,
              created_at: Time,
              customer_id: String,
              events:
                T.nilable(
                  T::Array[
                    SentDm::Models::MessageRetrieveStatusResponse::Data::Event
                  ]
                ),
              message_body:
                T.nilable(
                  SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody
                ),
              phone: String,
              phone_international: String,
              price: T.nilable(Float),
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
                SentDm::Models::MessageRetrieveStatusResponse::Data::Event,
                SentDm::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig { returns(T.nilable(String)) }
          attr_reader :status

          sig { params(status: String).void }
          attr_writer :status

          sig { returns(T.nilable(Time)) }
          attr_reader :timestamp

          sig { params(timestamp: Time).void }
          attr_writer :timestamp

          # Represents a status change event in a message's lifecycle (v3)
          sig do
            params(
              description: T.nilable(String),
              status: String,
              timestamp: Time
            ).returns(T.attached_class)
          end
          def self.new(description: nil, status: nil, timestamp: nil)
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                status: String,
                timestamp: Time
              }
            )
          end
          def to_hash
          end
        end

        class MessageBody < SentDm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody,
                SentDm::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button
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
                    SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button::OrHash
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
                      SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button
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
                  SentDm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button,
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

            sig do
              params(type: String, value: String).returns(T.attached_class)
            end
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
end
