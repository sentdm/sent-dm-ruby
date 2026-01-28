# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Organizations#retrieve_profiles
    class OrganizationRetrieveProfilesResponse < SentDm::Internal::Type::BaseModel
      # @!attribute organization_id
      #
      #   @return [String, nil]
      optional :organization_id, String, api_name: :organizationId

      # @!attribute profiles
      #
      #   @return [Array<SentDm::Models::ProfileSummary>, nil]
      optional :profiles, -> { SentDm::Internal::Type::ArrayOf[SentDm::ProfileSummary] }

      # @!method initialize(organization_id: nil, profiles: nil)
      #   @param organization_id [String]
      #   @param profiles [Array<SentDm::Models::ProfileSummary>]
    end
  end
end
