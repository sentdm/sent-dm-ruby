# typed: strong

module Sentdm
  module Models
    class ConversationListMessagesResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::Models::ConversationListMessagesResponse,
            Sentdm::Internal::AnyHash
          )
        end

      # A paginated list of messages — used by both conversation read endpoints.
      sig do
        returns(
          T.nilable(Sentdm::Models::ConversationListMessagesResponse::Data)
        )
      end
      attr_reader :data

      sig do
        params(
          data:
            T.nilable(
              Sentdm::Models::ConversationListMessagesResponse::Data::OrHash
            )
        ).void
      end
      attr_writer :data

      # Error information
      sig do
        returns(
          T.nilable(Sentdm::Models::ConversationListMessagesResponse::Error)
        )
      end
      attr_reader :error

      sig do
        params(
          error:
            T.nilable(
              Sentdm::Models::ConversationListMessagesResponse::Error::OrHash
            )
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig do
        returns(
          T.nilable(Sentdm::Models::ConversationListMessagesResponse::Meta)
        )
      end
      attr_reader :meta

      sig do
        params(
          meta: Sentdm::Models::ConversationListMessagesResponse::Meta::OrHash
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
              Sentdm::Models::ConversationListMessagesResponse::Data::OrHash
            ),
          error:
            T.nilable(
              Sentdm::Models::ConversationListMessagesResponse::Error::OrHash
            ),
          meta: Sentdm::Models::ConversationListMessagesResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # A paginated list of messages — used by both conversation read endpoints.
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
              T.nilable(Sentdm::Models::ConversationListMessagesResponse::Data),
            error:
              T.nilable(
                Sentdm::Models::ConversationListMessagesResponse::Error
              ),
            meta: Sentdm::Models::ConversationListMessagesResponse::Meta,
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
              Sentdm::Models::ConversationListMessagesResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # The messages on this page.
        sig do
          returns(
            T.nilable(
              T::Array[
                Sentdm::Models::ConversationListMessagesResponse::Data::Message
              ]
            )
          )
        end
        attr_reader :messages

        sig do
          params(
            messages:
              T::Array[
                Sentdm::Models::ConversationListMessagesResponse::Data::Message::OrHash
              ]
          ).void
        end
        attr_writer :messages

        # Pagination metadata for list responses
        sig do
          returns(
            T.nilable(
              Sentdm::Models::ConversationListMessagesResponse::Data::Pagination
            )
          )
        end
        attr_reader :pagination

        sig do
          params(
            pagination:
              Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        # A paginated list of messages — used by both conversation read endpoints.
        sig do
          params(
            messages:
              T::Array[
                Sentdm::Models::ConversationListMessagesResponse::Data::Message::OrHash
              ],
            pagination:
              Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The messages on this page.
          messages: nil,
          # Pagination metadata for list responses
          pagination: nil
        )
        end

        sig do
          override.returns(
            {
              messages:
                T::Array[
                  Sentdm::Models::ConversationListMessagesResponse::Data::Message
                ],
              pagination:
                Sentdm::Models::ConversationListMessagesResponse::Data::Pagination
            }
          )
        end
        def to_hash
        end

        class Message < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::ConversationListMessagesResponse::Data::Message,
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
                  Sentdm::Models::ConversationListMessagesResponse::Data::Message::Event
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
                Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody
              )
            )
          end
          attr_reader :message_body

          sig do
            params(
              message_body:
                T.nilable(
                  Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::OrHash
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
                    Sentdm::Models::ConversationListMessagesResponse::Data::Message::Event::OrHash
                  ]
                ),
              message_body:
                T.nilable(
                  Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::OrHash
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
                      Sentdm::Models::ConversationListMessagesResponse::Data::Message::Event
                    ]
                  ),
                message_body:
                  T.nilable(
                    Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody
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
                  Sentdm::Models::ConversationListMessagesResponse::Data::Message::Event,
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
                  Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody,
                  Sentdm::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  T::Array[
                    Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::Button
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
                      Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::Button::OrHash
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
                        Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::Button
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
                    Sentdm::Models::ConversationListMessagesResponse::Data::Message::MessageBody::Button,
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

        class Pagination < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::ConversationListMessagesResponse::Data::Pagination,
                Sentdm::Internal::AnyHash
              )
            end

          # Cursor-based pagination. Never populated — see Cursors.
          sig do
            returns(
              T.nilable(
                Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::Cursors
              )
            )
          end
          attr_reader :cursors

          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::Cursors::OrHash
                )
            ).void
          end
          attr_writer :cursors

          # Whether there are more pages after this one
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_more

          sig { params(has_more: T::Boolean).void }
          attr_writer :has_more

          # Current page number (1-indexed)
          sig { returns(T.nilable(Integer)) }
          attr_reader :page

          sig { params(page: Integer).void }
          attr_writer :page

          # Number of items per page
          sig { returns(T.nilable(Integer)) }
          attr_reader :page_size

          sig { params(page_size: Integer).void }
          attr_writer :page_size

          # Total number of items across all pages
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_count

          sig { params(total_count: Integer).void }
          attr_writer :total_count

          # Total number of pages
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_pages

          sig { params(total_pages: Integer).void }
          attr_writer :total_pages

          # Pagination metadata for list responses
          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::Cursors::OrHash
                ),
              has_more: T::Boolean,
              page: Integer,
              page_size: Integer,
              total_count: Integer,
              total_pages: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Cursor-based pagination. Never populated — see Cursors.
            cursors: nil,
            # Whether there are more pages after this one
            has_more: nil,
            # Current page number (1-indexed)
            page: nil,
            # Number of items per page
            page_size: nil,
            # Total number of items across all pages
            total_count: nil,
            # Total number of pages
            total_pages: nil
          )
          end

          sig do
            override.returns(
              {
                cursors:
                  T.nilable(
                    Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::Cursors
                  ),
                has_more: T::Boolean,
                page: Integer,
                page_size: Integer,
                total_count: Integer,
                total_pages: Integer
              }
            )
          end
          def to_hash
          end

          class Cursors < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::ConversationListMessagesResponse::Data::Pagination::Cursors,
                  Sentdm::Internal::AnyHash
                )
              end

            # Cursor to fetch the next page.
            sig { returns(T.nilable(String)) }
            attr_accessor :after

            # Cursor to fetch the previous page.
            sig { returns(T.nilable(String)) }
            attr_accessor :before

            # Cursor-based pagination. Never populated — see Cursors.
            sig do
              params(
                after: T.nilable(String),
                before: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Cursor to fetch the next page.
              after: nil,
              # Cursor to fetch the previous page.
              before: nil
            )
            end

            sig do
              override.returns(
                { after: T.nilable(String), before: T.nilable(String) }
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
              Sentdm::Models::ConversationListMessagesResponse::Error,
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
              Sentdm::Models::ConversationListMessagesResponse::Meta,
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
