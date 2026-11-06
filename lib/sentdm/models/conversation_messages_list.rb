# frozen_string_literal: true

module Sentdm
  module Models
    class ConversationMessagesList < Sentdm::Internal::Type::BaseModel
      # @!attribute messages
      #   The messages on this page.
      #
      #   @return [Array<Sentdm::Models::Message>, nil]
      optional :messages, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Message] }

      # @!attribute pagination
      #   Pagination metadata for list responses
      #
      #   @return [Sentdm::Models::PaginationMeta, nil]
      optional :pagination, -> { Sentdm::PaginationMeta }

      # @!method initialize(messages: nil, pagination: nil)
      #   A paginated list of messages — used by both conversation read endpoints.
      #
      #   @param messages [Array<Sentdm::Models::Message>] The messages on this page.
      #
      #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
    end
  end
end
