# frozen_string_literal: true

module Sentdm
  module Models
    class ContactsList < Sentdm::Internal::Type::BaseModel
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
