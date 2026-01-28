# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Organizations#retrieve_profiles
    class OrganizationRetrieveProfilesResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute organization_id
      #
      #   @return [String, nil]
      optional :organization_id, String, api_name: :organizationId

      # @!attribute profiles
      #
      #   @return [Array<Sentdm::Models::ProfileSummary>, nil]
      optional :profiles, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ProfileSummary] }

      # @!method initialize(organization_id: nil, profiles: nil)
      #   @param organization_id [String]
      #   @param profiles [Array<Sentdm::Models::ProfileSummary>]
    end
  end
end
