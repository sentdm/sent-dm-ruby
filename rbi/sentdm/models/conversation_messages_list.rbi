# typed: strong

module Sentdm
  module Models
    class ConversationMessagesList < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ConversationMessagesList, Sentdm::Internal::AnyHash)
        end

      # The messages on this page.
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
        # The messages on this page.
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
        # components (header, header media, body, footer, buttons, MMS subject and media).
        #
        # Persisted as the messageBody jsonb column on Messages. Every write path goes
        # through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
        # shape is stable regardless of channel or status. Anything that rebuilds this
        # object field by field — the four IMessageBodyStrategy implementations and
        # MessageUtils.BuildSegmentBody — has to carry every member, or that member is
        # silently dropped on whichever path forgot it.
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

        # A human-readable sentence for reason_code, for example "Insufficient balance".
        # Omitted whenever reason_code is.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason

        # Why the message is at its current status, as a stable platform code such as
        # DELIVERY_007, BUSINESS_003 or DELIVERY_003. Present when the current status is
        # FAILED, FILTERED or BLOCKED and the lifecycle was loaded; omitted otherwise.
        # Switch on this rather than on reason: the code is stable, the wording may be
        # improved. It is the platform's classification of the outcome, never a carrier or
        # vendor code.
        sig { returns(T.nilable(String)) }
        attr_accessor :reason_code

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

        # Message response for v3 API — same shape as v2 with snake_case JSON conventions.
        #
        # The shape of a message that was sent immediately: it never has a scheduled_at
        # key. A message that is or was held for a later instant is a
        # ScheduledMessageResponse, and the endpoint decides which of the two to answer
        # with. From always returns this type.
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
            reason: T.nilable(String),
            reason_code: T.nilable(String),
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
          # components (header, header media, body, footer, buttons, MMS subject and media).
          #
          # Persisted as the messageBody jsonb column on Messages. Every write path goes
          # through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
          # shape is stable regardless of channel or status. Anything that rebuilds this
          # object field by field — the four IMessageBodyStrategy implementations and
          # MessageUtils.BuildSegmentBody — has to carry every member, or that member is
          # silently dropped on whichever path forgot it.
          message_body: nil,
          phone: nil,
          phone_international: nil,
          price: nil,
          # A human-readable sentence for reason_code, for example "Insufficient balance".
          # Omitted whenever reason_code is.
          reason: nil,
          # Why the message is at its current status, as a stable platform code such as
          # DELIVERY_007, BUSINESS_003 or DELIVERY_003. Present when the current status is
          # FAILED, FILTERED or BLOCKED and the lifecycle was loaded; omitted otherwise.
          # Switch on this rather than on reason: the code is stable, the wording may be
          # improved. It is the platform's classification of the outcome, never a carrier or
          # vendor code.
          reason_code: nil,
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
              reason: T.nilable(String),
              reason_code: T.nilable(String),
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

          # A human-readable sentence for reason_code. Omitted whenever reason_code is.
          sig { returns(T.nilable(String)) }
          attr_accessor :reason

          # Why the message reached this status, as a stable platform code such as
          # DELIVERY_007. Present on FAILED, FILTERED and BLOCKED events; omitted on every
          # status that needs no explanation. Same wire name and vocabulary as on the
          # activities list and the webhook.
          sig { returns(T.nilable(String)) }
          attr_accessor :reason_code

          # Represents a status change event in a message's lifecycle (v3)
          sig do
            params(
              status: String,
              timestamp: Time,
              description: T.nilable(String),
              reason: T.nilable(String),
              reason_code: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            status:,
            timestamp:,
            description: nil,
            # A human-readable sentence for reason_code. Omitted whenever reason_code is.
            reason: nil,
            # Why the message reached this status, as a stable platform code such as
            # DELIVERY_007. Present on FAILED, FILTERED and BLOCKED events; omitted on every
            # status that needs no explanation. Same wire name and vocabulary as on the
            # activities list and the webhook.
            reason_code: nil
          )
          end

          sig do
            override.returns(
              {
                status: String,
                timestamp: Time,
                description: T.nilable(String),
                reason: T.nilable(String),
                reason_code: T.nilable(String)
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

          # The media asset that rode a message's header, recorded as sent.
          sig do
            returns(
              T.nilable(
                Sentdm::ConversationMessagesList::Message::MessageBody::HeaderMedia
              )
            )
          end
          attr_reader :header_media

          sig do
            params(
              header_media:
                T.nilable(
                  Sentdm::ConversationMessagesList::Message::MessageBody::HeaderMedia::OrHash
                )
            ).void
          end
          attr_writer :header_media

          # MMS attachments, as the publicly fetchable URLs handed to the carrier. Null on
          # every other channel.
          #
          # Persisted rather than derived because a resend and a curfew release rebuild the
          # send from the stored row — MessageReplayCommandBuilder reads templateId and
          # templateVariables and nothing else — so media that lives only on the original
          # request would silently turn a replayed MMS into a text message.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Sentdm::ConversationMessagesList::Message::MessageBody::Media
                ]
              )
            )
          end
          attr_accessor :media

          # MMS subject line. Null on every other channel.
          sig { returns(T.nilable(String)) }
          attr_accessor :subject

          # Structured message body format for database storage. Preserves channel-specific
          # components (header, header media, body, footer, buttons, MMS subject and media).
          #
          # Persisted as the messageBody jsonb column on Messages. Every write path goes
          # through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
          # shape is stable regardless of channel or status. Anything that rebuilds this
          # object field by field — the four IMessageBodyStrategy implementations and
          # MessageUtils.BuildSegmentBody — has to carry every member, or that member is
          # silently dropped on whichever path forgot it.
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
              header: T.nilable(String),
              header_media:
                T.nilable(
                  Sentdm::ConversationMessagesList::Message::MessageBody::HeaderMedia::OrHash
                ),
              media:
                T.nilable(
                  T::Array[
                    Sentdm::ConversationMessagesList::Message::MessageBody::Media::OrHash
                  ]
                ),
              subject: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            buttons: nil,
            content: nil,
            footer: nil,
            header: nil,
            # The media asset that rode a message's header, recorded as sent.
            header_media: nil,
            # MMS attachments, as the publicly fetchable URLs handed to the carrier. Null on
            # every other channel.
            #
            # Persisted rather than derived because a resend and a curfew release rebuild the
            # send from the stored row — MessageReplayCommandBuilder reads templateId and
            # templateVariables and nothing else — so media that lives only on the original
            # request would silently turn a replayed MMS into a text message.
            media: nil,
            # MMS subject line. Null on every other channel.
            subject: nil
          )
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
                header: T.nilable(String),
                header_media:
                  T.nilable(
                    Sentdm::ConversationMessagesList::Message::MessageBody::HeaderMedia
                  ),
                media:
                  T.nilable(
                    T::Array[
                      Sentdm::ConversationMessagesList::Message::MessageBody::Media
                    ]
                  ),
                subject: T.nilable(String)
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

          class HeaderMedia < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::ConversationMessagesList::Message::MessageBody::HeaderMedia,
                  Sentdm::Internal::AnyHash
                )
              end

            # "image", "video" or "document" — taken from the header's media variable.
            sig { returns(T.nilable(String)) }
            attr_reader :type

            sig { params(type: String).void }
            attr_writer :type

            # The https URL the caller supplied for this send. Never the template's stored
            # props.sample, which is Meta's expiring header_handle rather than what was
            # delivered.
            sig { returns(T.nilable(String)) }
            attr_reader :url

            sig { params(url: String).void }
            attr_writer :url

            # The media asset that rode a message's header, recorded as sent.
            sig { params(type: String, url: String).returns(T.attached_class) }
            def self.new(
              # "image", "video" or "document" — taken from the header's media variable.
              type: nil,
              # The https URL the caller supplied for this send. Never the template's stored
              # props.sample, which is Meta's expiring header_handle rather than what was
              # delivered.
              url: nil
            )
            end

            sig { override.returns({ type: String, url: String }) }
            def to_hash
            end
          end

          class Media < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::ConversationMessagesList::Message::MessageBody::Media,
                  Sentdm::Internal::AnyHash
                )
              end

            # One of MmsMediaTypes when the content type is known. Advisory — a reader should
            # trust the fetched object's own Content-Type.
            sig { returns(T.nilable(String)) }
            attr_accessor :media_type

            # Content type as the provider declared it. Null when it declared none.
            sig { returns(T.nilable(String)) }
            attr_accessor :mime_type

            # Size as the provider declared it. Never measured here — nothing downloads the
            # file.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :size_bytes

            # Inbound only: the SHA-256 the provider declared alongside the attachment, when
            # it declared one. Relayed to the customer so they can verify what they fetch
            # matches what the carrier said it sent. It is the only integrity signal available
            # on an attachment nobody here has read.
            sig { returns(T.nilable(String)) }
            attr_accessor :source_hash_sha256

            # Where the file lives. Outbound: the URL the customer gave us and the carrier
            # fetched. Inbound: the URL the carrier hosts it at, relayed unchanged.
            sig { returns(T.nilable(String)) }
            attr_accessor :url

            # One attachment on a message, in either direction — and in both, a URL somebody
            # else hosts.
            #
            # Outbound: the customer supplied a public URL and we handed it to the carrier.
            # Inbound: the carrier hosts the file and we record where. sent.dm never holds the
            # bytes, so there is no key, no expiry bookkeeping and nothing minted per read —
            # what is stored is what is served.
            #
            # An inbound link expires on the carrier's own schedule and is unauthenticated.
            # That is the customer's to manage, and it is documented where they will see it
            # rather than only here — a recipient who needs an attachment to outlive that
            # window copies it on receipt.
            #
            # Storing a presigned URL is the specific mistake this shape still avoids:
            # M260826130000 and M260826140000 exist because RCS assets were stored as signed
            # URLs and went stale. Nothing here is signed.
            sig do
              params(
                media_type: T.nilable(String),
                mime_type: T.nilable(String),
                size_bytes: T.nilable(Integer),
                source_hash_sha256: T.nilable(String),
                url: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # One of MmsMediaTypes when the content type is known. Advisory — a reader should
              # trust the fetched object's own Content-Type.
              media_type: nil,
              # Content type as the provider declared it. Null when it declared none.
              mime_type: nil,
              # Size as the provider declared it. Never measured here — nothing downloads the
              # file.
              size_bytes: nil,
              # Inbound only: the SHA-256 the provider declared alongside the attachment, when
              # it declared one. Relayed to the customer so they can verify what they fetch
              # matches what the carrier said it sent. It is the only integrity signal available
              # on an attachment nobody here has read.
              source_hash_sha256: nil,
              # Where the file lives. Outbound: the URL the customer gave us and the carrier
              # fetched. Inbound: the URL the carrier hosts it at, relayed unchanged.
              url: nil
            )
            end

            sig do
              override.returns(
                {
                  media_type: T.nilable(String),
                  mime_type: T.nilable(String),
                  size_bytes: T.nilable(Integer),
                  source_hash_sha256: T.nilable(String),
                  url: T.nilable(String)
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
