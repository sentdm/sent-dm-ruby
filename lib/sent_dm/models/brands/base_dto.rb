# frozen_string_literal: true

module SentDm
  module Models
    module Brands
      class BaseDto < SentDm::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier
        #
        #   @return [String, nil]
        optional :id, String

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt, nil?: true

        # @!method initialize(id: nil, created_at: nil, updated_at: nil)
        #   @param id [String] Unique identifier
        #
        #   @param created_at [Time]
        #
        #   @param updated_at [Time, nil]
      end
    end
  end
end
