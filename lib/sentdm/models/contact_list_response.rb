# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#list
    class ContactListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   A paginated list of contacts.
      #
      #   @return [Sentdm::Models::ContactListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::ContactListResponse::Data }, nil?: true

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
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::ContactListResponse::Data, nil] A paginated list of contacts.
      #
      #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
      #
      #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::ContactListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute contacts
        #   The contacts on this page.
        #
        #   @return [Array<Sentdm::Models::ContactResponse>, nil]
        optional :contacts, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ContactResponse] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!method initialize(contacts: nil, pagination: nil)
        #   A paginated list of contacts.
        #
        #   @param contacts [Array<Sentdm::Models::ContactResponse>] The contacts on this page.
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
      end
    end
  end
end
