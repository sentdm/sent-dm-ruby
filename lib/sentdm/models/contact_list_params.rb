# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#list
    class ContactListParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute channel
      #   Optional channel filter (sms, whatsapp)
      #
      #   @return [String, nil]
      optional :channel, String, nil?: true

      # @!attribute page
      #   Page number (1-indexed)
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute page_size
      #   Number of items per page
      #
      #   @return [Integer, nil]
      optional :page_size, Integer

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

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(channel: nil, page: nil, page_size: nil, phone: nil, search: nil, x_profile_id: nil, request_options: {})
      #   @param channel [String, nil] Optional channel filter (sms, whatsapp)
      #
      #   @param page [Integer] Page number (1-indexed)
      #
      #   @param page_size [Integer] Number of items per page
      #
      #   @param phone [String, nil] Optional phone number filter (alternative to list view)
      #
      #   @param search [String, nil] Optional search term for filtering contacts
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
