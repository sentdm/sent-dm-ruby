# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#list
    class ContactListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Paginated list of contacts response
      #
      #   @return [Sentdm::Models::ContactListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ContactListResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ContactListResponse::Error, nil]
      optional :error, -> { Sentdm::Models::ContactListResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::ContactListResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::ContactListResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ContactListResponse::Data, nil] Paginated list of contacts response
      #
      #   @param error [Sentdm::Models::ContactListResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::ContactListResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ContactListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute contacts
        #   List of contacts
        #
        #   @return [Array<Sentdm::Models::ContactListResponse::Data::Contact>, nil]
        optional :contacts,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::ContactListResponse::Data::Contact] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::ContactListResponse::Data::Pagination, nil]
        optional :pagination, -> { Sentdm::Models::ContactListResponse::Data::Pagination }

        # @!method initialize(contacts: nil, pagination: nil)
        #   Paginated list of contacts response
        #
        #   @param contacts [Array<Sentdm::Models::ContactListResponse::Data::Contact>] List of contacts
        #
        #   @param pagination [Sentdm::Models::ContactListResponse::Data::Pagination] Pagination metadata for list responses

        class Contact < Sentdm::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for the contact
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute available_channels
          #   Comma-separated list of available messaging channels (e.g., "sms,whatsapp")
          #
          #   @return [String, nil]
          optional :available_channels, String

          # @!attribute country_code
          #   Country calling code (e.g., 1 for US/Canada)
          #
          #   @return [String, nil]
          optional :country_code, String

          # @!attribute created_at
          #   When the contact was created
          #
          #   @return [Time, nil]
          optional :created_at, Time

          # @!attribute default_channel
          #   Default messaging channel to use (e.g., "sms" or "whatsapp")
          #
          #   @return [String, nil]
          optional :default_channel, String

          # @!attribute format_e164
          #   Phone number in E.164 format (e.g., +1234567890)
          #
          #   @return [String, nil]
          optional :format_e164, String

          # @!attribute format_international
          #   Phone number in international format (e.g., +1 234-567-890)
          #
          #   @return [String, nil]
          optional :format_international, String

          # @!attribute format_national
          #   Phone number in national format (e.g., (234) 567-890)
          #
          #   @return [String, nil]
          optional :format_national, String

          # @!attribute format_rfc
          #   Phone number in RFC 3966 format (e.g., tel:+1-234-567-890)
          #
          #   @return [String, nil]
          optional :format_rfc, String

          # @!attribute is_inherited
          #   Whether this is an inherited contact (read-only)
          #
          #   @return [Boolean, nil]
          optional :is_inherited, Sentdm::Internal::Type::Boolean

          # @!attribute opt_out
          #   Whether the contact has opted out of messaging. Single source of truth — opt-out
          #   is per-contact, not per-channel.
          #
          #   @return [Boolean, nil]
          optional :opt_out, Sentdm::Internal::Type::Boolean

          # @!attribute phone_number
          #   Phone number in original format
          #
          #   @return [String, nil]
          optional :phone_number, String

          # @!attribute region_code
          #   ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
          #
          #   @return [String, nil]
          optional :region_code, String

          # @!attribute updated_at
          #   When the contact was last updated
          #
          #   @return [Time, nil]
          optional :updated_at, Time, nil?: true

          # @!method initialize(id: nil, available_channels: nil, country_code: nil, created_at: nil, default_channel: nil, format_e164: nil, format_international: nil, format_national: nil, format_rfc: nil, is_inherited: nil, opt_out: nil, phone_number: nil, region_code: nil, updated_at: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::ContactListResponse::Data::Contact} for more details.
          #
          #   Contact response for v3 API Uses snake_case for JSON property names
          #
          #   @param id [String] Unique identifier for the contact
          #
          #   @param available_channels [String] Comma-separated list of available messaging channels (e.g., "sms,whatsapp")
          #
          #   @param country_code [String] Country calling code (e.g., 1 for US/Canada)
          #
          #   @param created_at [Time] When the contact was created
          #
          #   @param default_channel [String] Default messaging channel to use (e.g., "sms" or "whatsapp")
          #
          #   @param format_e164 [String] Phone number in E.164 format (e.g., +1234567890)
          #
          #   @param format_international [String] Phone number in international format (e.g., +1 234-567-890)
          #
          #   @param format_national [String] Phone number in national format (e.g., (234) 567-890)
          #
          #   @param format_rfc [String] Phone number in RFC 3966 format (e.g., tel:+1-234-567-890)
          #
          #   @param is_inherited [Boolean] Whether this is an inherited contact (read-only)
          #
          #   @param opt_out [Boolean] Whether the contact has opted out of messaging. Single source of truth — opt-out
          #
          #   @param phone_number [String] Phone number in original format
          #
          #   @param region_code [String] ISO 3166-1 alpha-2 country code (e.g., US, CA, GB)
          #
          #   @param updated_at [Time, nil] When the contact was last updated
        end

        # @see Sentdm::Models::ContactListResponse::Data#pagination
        class Pagination < Sentdm::Internal::Type::BaseModel
          # @!attribute cursors
          #   Cursor-based pagination pointers
          #
          #   @return [Sentdm::Models::ContactListResponse::Data::Pagination::Cursors, nil]
          optional :cursors, -> { Sentdm::Models::ContactListResponse::Data::Pagination::Cursors }, nil?: true

          # @!attribute has_more
          #   Whether there are more pages after this one
          #
          #   @return [Boolean, nil]
          optional :has_more, Sentdm::Internal::Type::Boolean

          # @!attribute page
          #   Current page number (1-indexed)
          #
          #   @return [Integer, nil]
          optional :page, Integer

          # @!attribute page_size
          #   Number of items per page
          #
          #   @return [Integer, nil]
          optional :page_size, Integer

          # @!attribute total_count
          #   Total number of items across all pages
          #
          #   @return [Integer, nil]
          optional :total_count, Integer

          # @!attribute total_pages
          #   Total number of pages
          #
          #   @return [Integer, nil]
          optional :total_pages, Integer

          # @!method initialize(cursors: nil, has_more: nil, page: nil, page_size: nil, total_count: nil, total_pages: nil)
          #   Pagination metadata for list responses
          #
          #   @param cursors [Sentdm::Models::ContactListResponse::Data::Pagination::Cursors, nil] Cursor-based pagination pointers
          #
          #   @param has_more [Boolean] Whether there are more pages after this one
          #
          #   @param page [Integer] Current page number (1-indexed)
          #
          #   @param page_size [Integer] Number of items per page
          #
          #   @param total_count [Integer] Total number of items across all pages
          #
          #   @param total_pages [Integer] Total number of pages

          # @see Sentdm::Models::ContactListResponse::Data::Pagination#cursors
          class Cursors < Sentdm::Internal::Type::BaseModel
            # @!attribute after
            #   Cursor to fetch the next page
            #
            #   @return [String, nil]
            optional :after, String, nil?: true

            # @!attribute before
            #   Cursor to fetch the previous page
            #
            #   @return [String, nil]
            optional :before, String, nil?: true

            # @!method initialize(after: nil, before: nil)
            #   Cursor-based pagination pointers
            #
            #   @param after [String, nil] Cursor to fetch the next page
            #
            #   @param before [String, nil] Cursor to fetch the previous page
          end
        end
      end

      # @see Sentdm::Models::ContactListResponse#error
      class Error < Sentdm::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute details
        #   Additional validation error details (field-level errors)
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]], nil?: true

        # @!attribute doc_url
        #   URL to documentation about this error
        #
        #   @return [String, nil]
        optional :doc_url, String, nil?: true

        # @!attribute message
        #   Human-readable error message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
        #   Error information
        #
        #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
        #
        #   @param doc_url [String, nil] URL to documentation about this error
        #
        #   @param message [String] Human-readable error message
      end

      # @see Sentdm::Models::ContactListResponse#meta
      class Meta < Sentdm::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier for this request (for tracing and support)
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute timestamp
        #   Server timestamp when the response was generated
        #
        #   @return [Time, nil]
        optional :timestamp, Time

        # @!attribute version
        #   API version used for this request
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(request_id: nil, timestamp: nil, version: nil)
        #   Request and response metadata
        #
        #   @param request_id [String] Unique identifier for this request (for tracing and support)
        #
        #   @param timestamp [Time] Server timestamp when the response was generated
        #
        #   @param version [String] API version used for this request
      end
    end
  end
end
