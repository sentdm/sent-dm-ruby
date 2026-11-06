# frozen_string_literal: true

module Sentdm
  module Models
    # @deprecated
    class PaginationCursors < Sentdm::Internal::Type::BaseModel
      # @!attribute after
      #   Cursor to fetch the next page.
      #
      #   @return [String, nil]
      optional :after, String, nil?: true

      # @!attribute before
      #   Cursor to fetch the previous page.
      #
      #   @return [String, nil]
      optional :before, String, nil?: true

      # @!method initialize(after: nil, before: nil)
      #   Cursor-based pagination. Never populated — see Cursors.
      #
      #   @param after [String, nil] Cursor to fetch the next page.
      #
      #   @param before [String, nil] Cursor to fetch the previous page.
    end
  end
end
