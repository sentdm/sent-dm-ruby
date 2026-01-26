# frozen_string_literal: true

module SentDm
  module Models
    class ProfileSummary < SentDm::Internal::Type::BaseModel
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

      # @!attribute short_name
      #
      #   @return [String, nil]
      optional :short_name, String, api_name: :shortName, nil?: true

      # @!method initialize(id: nil, created_at: nil, description: nil, icon: nil, name: nil, short_name: nil)
      #   @param id [String]
      #   @param created_at [Time]
      #   @param description [String, nil]
      #   @param icon [String, nil]
      #   @param name [String]
      #   @param short_name [String, nil]
    end
  end
end
