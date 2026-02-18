# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Contacts#list
    class ContactListParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute page
      #   Page number (1-indexed)
      #
      #   @return [Integer]
      required :page, Integer

      # @!attribute page_size
      #
      #   @return [Integer]
      required :page_size, Integer

      # @!attribute channel
      #   Optional channel filter (sms, whatsapp)
      #
      #   @return [String, nil]
      optional :channel, String, nil?: true

      # @!attribute phone
      #   Optional phone number filter (alternative to list view)
      #
      #   @return [String, nil]
      optional :phone, String, nil?: true

      # @!attribute search
      #   Optional search term for filtering contacts
      #
      #   @return [String, nil]
      optional :search, String, nil?: true

      # @!method initialize(page:, page_size:, channel: nil, phone: nil, search: nil, request_options: {})
      #   @param page [Integer] Page number (1-indexed)
      #
      #   @param page_size [Integer]
      #
      #   @param channel [String, nil] Optional channel filter (sms, whatsapp)
      #
      #   @param phone [String, nil] Optional phone number filter (alternative to list view)
      #
      #   @param search [String, nil] Optional search term for filtering contacts
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
