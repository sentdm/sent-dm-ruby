# frozen_string_literal: true

module Sentdm
  module Models
    class UsersList < Sentdm::Internal::Type::BaseModel
      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!attribute users
      #   The users on this page.
      #
      #   @return [Array<Sentdm::Models::UserResponse>, nil]
      optional :users, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::UserResponse] }

      # @!method initialize(pagination: nil, users: nil)
      #   The users in the organization.
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
      #
      #   @param users [Array<Sentdm::Models::UserResponse>] The users on this page.
    end
  end
end
