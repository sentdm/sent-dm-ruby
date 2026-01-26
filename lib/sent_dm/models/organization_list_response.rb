# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Organizations#list
    class OrganizationListResponse < SentDm::Internal::Type::BaseModel
      # @!attribute organizations
      #
      #   @return [Array<SentDm::Models::OrganizationListResponse::Organization>, nil]
      optional :organizations,
               -> { SentDm::Internal::Type::ArrayOf[SentDm::Models::OrganizationListResponse::Organization] }

      # @!method initialize(organizations: nil)
      #   @param organizations [Array<SentDm::Models::OrganizationListResponse::Organization>]

      class Organization < SentDm::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute icon
        #
        #   @return [String, nil]
        optional :icon, String, nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute profiles
        #
        #   @return [Array<SentDm::Models::ProfileSummary>, nil]
        optional :profiles, -> { SentDm::Internal::Type::ArrayOf[SentDm::ProfileSummary] }

        # @!method initialize(id: nil, created_at: nil, description: nil, icon: nil, name: nil, profiles: nil)
        #   @param id [String]
        #   @param created_at [Time]
        #   @param description [String, nil]
        #   @param icon [String, nil]
        #   @param name [String]
        #   @param profiles [Array<SentDm::Models::ProfileSummary>]
      end
    end
  end
end
