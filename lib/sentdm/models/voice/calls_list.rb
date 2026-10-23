# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class CallsList < Sentdm::Internal::Type::BaseModel
        # @!attribute calls
        #   The calls on this page, most recent first
        #
        #   @return [Array<Sentdm::Models::Voice::Call>, nil]
        optional :calls, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Voice::Call] }

        # @!attribute pagination
        #   Pagination metadata for list responses
        #
        #   @return [Sentdm::Models::PaginationMeta, nil]
        optional :pagination, -> { Sentdm::PaginationMeta }

        # @!method initialize(calls: nil, pagination: nil)
        #   Paginated list of calls
        #
        #   @param calls [Array<Sentdm::Models::Voice::Call>] The calls on this page, most recent first
        #
        #   @param pagination [Sentdm::Models::PaginationMeta] Pagination metadata for list responses
      end
    end
  end
end
