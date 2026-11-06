# frozen_string_literal: true

module Sentdm
  module Models
    class ProfilesList < Sentdm::Internal::Type::BaseModel
      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!attribute profiles
      #   The profiles on this page.
      #
      #   @return [Array<Sentdm::Models::ProfileDetail>, nil]
      optional :profiles, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ProfileDetail] }

      # @!method initialize(pagination: nil, profiles: nil)
      #   The profiles in the organization.
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
      #
      #   @param profiles [Array<Sentdm::Models::ProfileDetail>] The profiles on this page.
    end
  end
end
