# frozen_string_literal: true

module Sentdm
  module Models
    class MessageActivities < Sentdm::Internal::Type::BaseModel
      # @!attribute activities
      #   List of activity events ordered by most recent first
      #
      #   @return [Array<Sentdm::Models::MessageActivity>, nil]
      optional :activities, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::MessageActivity] }

      # @!attribute message_id
      #   The message ID these activities belong to
      #
      #   @return [String, nil]
      optional :message_id, String

      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!method initialize(activities: nil, message_id: nil, pagination: nil)
      #   Response for GET /messages/{id}/activities
      #
      #   @param activities [Array<Sentdm::Models::MessageActivity>] List of activity events ordered by most recent first
      #
      #   @param message_id [String] The message ID these activities belong to
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
    end
  end
end
