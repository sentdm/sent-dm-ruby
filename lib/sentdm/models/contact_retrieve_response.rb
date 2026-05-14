# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#retrieve
    class ContactRetrieveResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   Contact response for v3 API Uses snake_case for JSON property names
      #
      #   @return [Sentdm::Models::ContactRetrieveResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ContactRetrieveResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::ContactRetrieveResponse::Error, nil]
      optional :error, -> { Sentdm::Models::ContactRetrieveResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::ContactRetrieveResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::ContactRetrieveResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ContactRetrieveResponse} for more details.
      #
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ContactRetrieveResponse::Data, nil] Contact response for v3 API
      #
      #   @param error [Sentdm::Models::ContactRetrieveResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::ContactRetrieveResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ContactRetrieveResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
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
        #   {Sentdm::Models::ContactRetrieveResponse::Data} for more details.
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

      # @see Sentdm::Models::ContactRetrieveResponse#error
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

      # @see Sentdm::Models::ContactRetrieveResponse#meta
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
