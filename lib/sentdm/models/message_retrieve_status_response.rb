# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#retrieve_status
    class MessageRetrieveStatusResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      #   The shape of a message that was sent immediately: it never has a scheduled_at
      #   key. A message that is or was held for a later instant is a
      #   ScheduledMessageResponse, and the endpoint decides which of the two to answer
      #   with. From always returns this type.
      #
      #   @return [Sentdm::Models::MessageRetrieveStatusResponse::Data, nil]
      optional :data, -> { Sentdm::Models::MessageRetrieveStatusResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ErrorDetail, nil]
      optional :error, -> { Sentdm::ErrorDetail }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageRetrieveStatusResponse} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::MessageRetrieveStatusResponse::Data, nil] Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::MessageRetrieveStatusResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute active_contact_price
        #
        #   @return [Float, nil]
        optional :active_contact_price, Float, nil?: true

        # @!attribute channel
        #
        #   @return [String, nil]
        optional :channel, String

        # @!attribute contact_id
        #
        #   @return [String, nil]
        optional :contact_id, String

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time

        # @!attribute customer_id
        #
        #   @return [String, nil]
        optional :customer_id, String

        # @!attribute direction
        #
        #   @return [String, nil]
        optional :direction, String

        # @!attribute events
        #
        #   @return [Array<Sentdm::Models::MessageRetrieveStatusResponse::Data::Event>, nil]
        optional :events,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageRetrieveStatusResponse::Data::Event] },
                 nil?: true

        # @!attribute message_body
        #   Structured message body format for database storage. Preserves channel-specific
        #   components (header, header media, body, footer, buttons, MMS subject and media).
        #
        #   Persisted as the messageBody jsonb column on Messages. Every write path goes
        #   through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
        #   shape is stable regardless of channel or status. Anything that rebuilds this
        #   object field by field — the four IMessageBodyStrategy implementations and
        #   MessageUtils.BuildSegmentBody — has to carry every member, or that member is
        #   silently dropped on whichever path forgot it.
        #
        #   @return [Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody, nil]
        optional :message_body,
                 -> { Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody },
                 nil?: true

        # @!attribute phone
        #
        #   @return [String, nil]
        optional :phone, String

        # @!attribute phone_international
        #
        #   @return [String, nil]
        optional :phone_international, String

        # @!attribute price
        #
        #   @return [Float, nil]
        optional :price, Float, nil?: true

        # @!attribute reason
        #   A human-readable sentence for reason_code, for example "Insufficient balance".
        #   Omitted whenever reason_code is.
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!attribute reason_code
        #   Why the message is at its current status, as a stable platform code such as
        #   DELIVERY_007, BUSINESS_003 or DELIVERY_003. Present when the current status is
        #   FAILED, FILTERED or BLOCKED and the lifecycle was loaded; omitted otherwise.
        #   Switch on this rather than on reason: the code is stable, the wording may be
        #   improved. It is the platform's classification of the outcome, never a carrier or
        #   vendor code.
        #
        #   @return [String, nil]
        optional :reason_code, String, nil?: true

        # @!attribute region_code
        #
        #   @return [String, nil]
        optional :region_code, String

        # @!attribute status
        #
        #   @return [String, nil]
        optional :status, String

        # @!attribute template_category
        #
        #   @return [String, nil]
        optional :template_category, String, nil?: true

        # @!attribute template_id
        #
        #   @return [String, nil]
        optional :template_id, String, nil?: true

        # @!attribute template_name
        #
        #   @return [String, nil]
        optional :template_name, String, nil?: true

        # @!method initialize(id: nil, active_contact_price: nil, channel: nil, contact_id: nil, created_at: nil, customer_id: nil, direction: nil, events: nil, message_body: nil, phone: nil, phone_international: nil, price: nil, reason: nil, reason_code: nil, region_code: nil, status: nil, template_category: nil, template_id: nil, template_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::MessageRetrieveStatusResponse::Data} for more details.
        #
        #   Message response for v3 API — same shape as v2 with snake_case JSON conventions.
        #
        #   The shape of a message that was sent immediately: it never has a scheduled_at
        #   key. A message that is or was held for a later instant is a
        #   ScheduledMessageResponse, and the endpoint decides which of the two to answer
        #   with. From always returns this type.
        #
        #   @param id [String]
        #
        #   @param active_contact_price [Float, nil]
        #
        #   @param channel [String]
        #
        #   @param contact_id [String]
        #
        #   @param created_at [Time]
        #
        #   @param customer_id [String]
        #
        #   @param direction [String]
        #
        #   @param events [Array<Sentdm::Models::MessageRetrieveStatusResponse::Data::Event>, nil]
        #
        #   @param message_body [Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody, nil] Structured message body format for database storage.
        #
        #   @param phone [String]
        #
        #   @param phone_international [String]
        #
        #   @param price [Float, nil]
        #
        #   @param reason [String, nil] A human-readable sentence for reason_code, for example "Insufficient balance". O
        #
        #   @param reason_code [String, nil] Why the message is at its current status, as a stable platform code such as
        #
        #   @param region_code [String]
        #
        #   @param status [String]
        #
        #   @param template_category [String, nil]
        #
        #   @param template_id [String, nil]
        #
        #   @param template_name [String, nil]

        class Event < Sentdm::Internal::Type::BaseModel
          # @!attribute status
          #
          #   @return [String]
          required :status, String

          # @!attribute timestamp
          #
          #   @return [Time]
          required :timestamp, Time

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!attribute reason
          #   A human-readable sentence for reason_code. Omitted whenever reason_code is.
          #
          #   @return [String, nil]
          optional :reason, String, nil?: true

          # @!attribute reason_code
          #   Why the message reached this status, as a stable platform code such as
          #   DELIVERY_007. Present on FAILED, FILTERED and BLOCKED events; omitted on every
          #   status that needs no explanation. Same wire name and vocabulary as on the
          #   activities list and the webhook.
          #
          #   @return [String, nil]
          optional :reason_code, String, nil?: true

          # @!method initialize(status:, timestamp:, description: nil, reason: nil, reason_code: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::MessageRetrieveStatusResponse::Data::Event} for more details.
          #
          #   Represents a status change event in a message's lifecycle (v3)
          #
          #   @param status [String]
          #
          #   @param timestamp [Time]
          #
          #   @param description [String, nil]
          #
          #   @param reason [String, nil] A human-readable sentence for reason_code. Omitted whenever reason_code is.
          #
          #   @param reason_code [String, nil] Why the message reached this status, as a stable platform code such as
          #   DELIVERY\_
        end

        # @see Sentdm::Models::MessageRetrieveStatusResponse::Data#message_body
        class MessageBody < Sentdm::Internal::Type::BaseModel
          # @!attribute buttons
          #
          #   @return [Array<Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button>, nil]
          optional :buttons,
                   -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button] },
                   nil?: true

          # @!attribute content
          #
          #   @return [String, nil]
          optional :content, String

          # @!attribute footer
          #
          #   @return [String, nil]
          optional :footer, String, nil?: true

          # @!attribute header
          #
          #   @return [String, nil]
          optional :header, String, nil?: true

          # @!attribute header_media
          #   The media asset that rode a message's header, recorded as sent.
          #
          #   @return [Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::HeaderMedia, nil]
          optional :header_media,
                   -> { Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::HeaderMedia },
                   api_name: :headerMedia,
                   nil?: true

          # @!attribute media
          #   MMS attachments, as the publicly fetchable URLs handed to the carrier. Null on
          #   every other channel.
          #
          #   Persisted rather than derived because a resend and a curfew release rebuild the
          #   send from the stored row — MessageReplayCommandBuilder reads templateId and
          #   templateVariables and nothing else — so media that lives only on the original
          #   request would silently turn a replayed MMS into a text message.
          #
          #   @return [Array<Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Media>, nil]
          optional :media,
                   -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Media] },
                   nil?: true

          # @!attribute subject
          #   MMS subject line. Null on every other channel.
          #
          #   @return [String, nil]
          optional :subject, String, nil?: true

          # @!method initialize(buttons: nil, content: nil, footer: nil, header: nil, header_media: nil, media: nil, subject: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody} for more
          #   details.
          #
          #   Structured message body format for database storage. Preserves channel-specific
          #   components (header, header media, body, footer, buttons, MMS subject and media).
          #
          #   Persisted as the messageBody jsonb column on Messages. Every write path goes
          #   through MessageUtils.MessageBodyJsonOptions, which writes nulls, so the envelope
          #   shape is stable regardless of channel or status. Anything that rebuilds this
          #   object field by field — the four IMessageBodyStrategy implementations and
          #   MessageUtils.BuildSegmentBody — has to carry every member, or that member is
          #   silently dropped on whichever path forgot it.
          #
          #   @param buttons [Array<Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Button>, nil]
          #
          #   @param content [String]
          #
          #   @param footer [String, nil]
          #
          #   @param header [String, nil]
          #
          #   @param header_media [Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::HeaderMedia, nil] The media asset that rode a message's header, recorded as sent.
          #
          #   @param media [Array<Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Media>, nil] MMS attachments, as the publicly fetchable URLs handed to the carrier. Null on e
          #
          #   @param subject [String, nil] MMS subject line. Null on every other channel.

          class Button < Sentdm::Internal::Type::BaseModel
            # @!attribute postback_data
            #
            #   @return [String, nil]
            optional :postback_data, String, api_name: :postbackData, nil?: true

            # @!attribute text
            #
            #   @return [String, nil]
            optional :text, String, nil?: true

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String

            # @!attribute value
            #
            #   @return [String, nil]
            optional :value, String

            # @!method initialize(postback_data: nil, text: nil, type: nil, value: nil)
            #   @param postback_data [String, nil]
            #   @param text [String, nil]
            #   @param type [String]
            #   @param value [String]
          end

          # @see Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody#header_media
          class HeaderMedia < Sentdm::Internal::Type::BaseModel
            # @!attribute type
            #   "image", "video" or "document" — taken from the header's media variable.
            #
            #   @return [String, nil]
            optional :type, String

            # @!attribute url
            #   The https URL the caller supplied for this send. Never the template's stored
            #   props.sample, which is Meta's expiring header_handle rather than what was
            #   delivered.
            #
            #   @return [String, nil]
            optional :url, String

            # @!method initialize(type: nil, url: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::HeaderMedia}
            #   for more details.
            #
            #   The media asset that rode a message's header, recorded as sent.
            #
            #   @param type [String] "image", "video" or "document" — taken from the header's media variable.
            #
            #   @param url [String] The https URL the caller supplied for this send. Never the template's stored
          end

          class Media < Sentdm::Internal::Type::BaseModel
            # @!attribute media_type
            #   One of MmsMediaTypes when the content type is known. Advisory — a reader should
            #   trust the fetched object's own Content-Type.
            #
            #   @return [String, nil]
            optional :media_type, String, api_name: :mediaType, nil?: true

            # @!attribute mime_type
            #   Content type as the provider declared it. Null when it declared none.
            #
            #   @return [String, nil]
            optional :mime_type, String, api_name: :mimeType, nil?: true

            # @!attribute size_bytes
            #   Size as the provider declared it. Never measured here — nothing downloads the
            #   file.
            #
            #   @return [Integer, nil]
            optional :size_bytes, Integer, api_name: :sizeBytes, nil?: true

            # @!attribute source_hash_sha256
            #   Inbound only: the SHA-256 the provider declared alongside the attachment, when
            #   it declared one. Relayed to the customer so they can verify what they fetch
            #   matches what the carrier said it sent. It is the only integrity signal available
            #   on an attachment nobody here has read.
            #
            #   @return [String, nil]
            optional :source_hash_sha256, String, api_name: :sourceHashSha256, nil?: true

            # @!attribute url
            #   Where the file lives. Outbound: the URL the customer gave us and the carrier
            #   fetched. Inbound: the URL the carrier hosts it at, relayed unchanged.
            #
            #   @return [String, nil]
            optional :url, String, nil?: true

            # @!method initialize(media_type: nil, mime_type: nil, size_bytes: nil, source_hash_sha256: nil, url: nil)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::MessageRetrieveStatusResponse::Data::MessageBody::Media} for
            #   more details.
            #
            #   One attachment on a message, in either direction — and in both, a URL somebody
            #   else hosts.
            #
            #   Outbound: the customer supplied a public URL and we handed it to the carrier.
            #   Inbound: the carrier hosts the file and we record where. sent.dm never holds the
            #   bytes, so there is no key, no expiry bookkeeping and nothing minted per read —
            #   what is stored is what is served.
            #
            #   An inbound link expires on the carrier's own schedule and is unauthenticated.
            #   That is the customer's to manage, and it is documented where they will see it
            #   rather than only here — a recipient who needs an attachment to outlive that
            #   window copies it on receipt.
            #
            #   Storing a presigned URL is the specific mistake this shape still avoids:
            #   M260826130000 and M260826140000 exist because RCS assets were stored as signed
            #   URLs and went stale. Nothing here is signed.
            #
            #   @param media_type [String, nil] One of MmsMediaTypes when the content type is known. Advisory — a reader should
            #
            #   @param mime_type [String, nil] Content type as the provider declared it. Null when it declared none.
            #
            #   @param size_bytes [Integer, nil] Size as the provider declared it. Never measured here — nothing downloads the fi
            #
            #   @param source_hash_sha256 [String, nil] Inbound only: the SHA-256 the provider declared alongside the attachment, when i
            #
            #   @param url [String, nil] Where the file lives. Outbound: the URL the customer gave us and the carrier fet
          end
        end
      end
    end
  end
end
