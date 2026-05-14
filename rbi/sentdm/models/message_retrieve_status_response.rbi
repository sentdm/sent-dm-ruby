# typed: strong

module Sentdm
  module Models
    class MessageRetrieveStatusResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::MessageRetrieveStatusResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # Message response for v3 API — same shape as v2 with snake_case JSON conventions
      sig do
        returns(T.nilable(Sentdm::Models::MessageRetrieveStatusResponse::Data))
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              Sentdm::Models::MessageRetrieveStatusResponse::Data::OrHash
            )
        ).void
      end
      attr_writer :data

      # Error information
      sig do
        returns(T.nilable(Sentdm::Models::MessageRetrieveStatusResponse::Error))
      end
      attr_reader :error

      sig do
        params(
          error:
            T.nilable(
              Sentdm::Models::MessageRetrieveStatusResponse::Error::OrHash
            )
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig do
        returns(T.nilable(Sentdm::Models::MessageRetrieveStatusResponse::Meta))
      end
      attr_reader :meta

      sig do
        params(
          meta: Sentdm::Models::MessageRetrieveStatusResponse::Meta::OrHash
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
              Sentdm::Models::MessageRetrieveStatusResponse::Data::OrHash
            ),
          error:
            T.nilable(
              Sentdm::Models::MessageRetrieveStatusResponse::Error::OrHash
            ),
          meta: Sentdm::Models::MessageRetrieveStatusResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Message response for v3 API — same shape as v2 with snake_case JSON conventions
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
              T.nilable(Sentdm::Models::MessageRetrieveStatusResponse::Data),
            error:
              T.nilable(Sentdm::Models::MessageRetrieveStatusResponse::Error),
            meta: Sentdm::Models::MessageRetrieveStatusResponse::Meta,
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
              Sentdm::Models::MessageRetrieveStatusResponse::Data,
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
              T::Array[
                Sentdm::Models::MessageRetrieveStatusResponse::Data::Event
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
              Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody
            )
          )
        end
        attr_reader :message_body

        sig do
          params(
            message_body:
              T.nilable(
                Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::OrHash
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
                  Sentdm::Models::MessageRetrieveStatusResponse::Data::Event::OrHash
                ]
              ),
            message_body:
              T.nilable(
                Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::OrHash
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
                  T::Array[
                    Sentdm::Models::MessageRetrieveStatusResponse::Data::Event
                  ]
                ),
              message_body:
                T.nilable(
                  Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody
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
                Sentdm::Models::MessageRetrieveStatusResponse::Data::Event,
                Sentdm::Internal::AnyHash
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

        class MessageBody < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody,
                Sentdm::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button
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
                    Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button::OrHash
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
                      Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button
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
                  Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button,
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

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::MessageRetrieveStatusResponse::Error,
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
              Sentdm::Models::MessageRetrieveStatusResponse::Meta,
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
