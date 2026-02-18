# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#list
    class ContactListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   The response data (null if error)
      #
      #   @return [Sentdm::Models::ContactListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ContactListResponse::Data }, nil?: true

      # @!attribute error
      #   Error details (null if successful)
      #
      #   @return [Sentdm::Models::APIError, nil]
      optional :error, -> { Sentdm::APIError }, nil?: true

      # @!attribute meta
      #   Metadata about the request and response
      #
      #   @return [Sentdm::Models::APIMeta, nil]
      optional :meta, -> { Sentdm::APIMeta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ContactListResponse::Data, nil] The response data (null if error)
      #
      #   @param error [Sentdm::Models::APIError, nil] Error details (null if successful)
      #
      #   @param meta [Sentdm::Models::APIMeta] Metadata about the request and response
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ContactListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute contacts
        #   List of contacts
        #
        #   @return [Array<Sentdm::Models::Contact>, nil]
        optional :contacts, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Contact] }

        # @!attribute pagination
        #   Pagination metadata
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!method initialize(contacts: nil, pagination: nil)
        #   The response data (null if error)
        #
        #   @param contacts [Array<Sentdm::Models::Contact>] List of contacts
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata
      end
    end
  end
end
