# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Contacts#list
    class ContactListResponse < SentDm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [SentDm::Models::ContactListResponse::Data, nil]
      optional :data, -> { SentDm::Models::ContactListResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [SentDm::Models::APIError, nil]
      optional :error, -> { SentDm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
      #
      #   @return [SentDm::Models::APIMeta, nil]
      optional :meta, -> { SentDm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, SentDm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [SentDm::Models::ContactListResponse::Data, nil] The response data (null if error)
      #
      #   @param error [SentDm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [SentDm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see SentDm::Models::ContactListResponse#data
      class Data < SentDm::Internal::Type::BaseModel
        # @!attribute contacts
        #   List of contacts
        #
        #   @return [Array<SentDm::Models::Contact>, nil]
        optional :contacts, -> { SentDm::Internal::Type::ArrayOf[SentDm::Contact] }

        # @!attribute pagination
        #   Pagination metadata
        #
        #   @return [SentDm::Models::PaginationMeta, nil]
        optional :pagination, -> { SentDm::PaginationMeta }

        # @!method initialize(contacts: nil, pagination: nil)
        #   The response data (null if error)
        #
        #   @param contacts [Array<SentDm::Models::Contact>] List of contacts
        #
        #   @param pagination [SentDm::Models::PaginationMeta] Pagination metadata
      end
    end
  end
end
