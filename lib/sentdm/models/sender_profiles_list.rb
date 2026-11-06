# frozen_string_literal: true

module Sentdm
  module Models
    class SenderProfilesList < Sentdm::Internal::Type::BaseModel
      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!attribute sender_profiles
      #   The sender_profiles on this page.
      #
      #   @return [Array<Sentdm::Models::SenderProfile>, nil]
      optional :sender_profiles, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::SenderProfile] }

      # @!method initialize(pagination: nil, sender_profiles: nil)
      #   A paginated list of sender profiles.
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
      #
      #   @param sender_profiles [Array<Sentdm::Models::SenderProfile>] The sender_profiles on this page.
    end
  end
end
