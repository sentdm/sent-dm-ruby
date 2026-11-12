# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      module SMS
        # @see Sentdm::Resources::Channels::SMS::TenDlc#retrieve_compliance
        class APIResponseOfSuppliedCompliance < Sentdm::Internal::Type::BaseModel
          # @!attribute data
          #   What a market has been given: the identity it registers under, its programme,
          #   and any documents attached.
          #
          #   What it does not carry is what the market asks for. That is the subject of GET
          #   /v3/compliance/requirements, and it is the same answer for every caller — a
          #   description of what a compliance regime wants, not a record of one customer's
          #   progress through it. It was reported here as well for a while, which put the
          #   same array in six response shapes and left a caller deciding which of two
          #   sources to believe.
          #
          #   Present on a list read for markets that register (carrying brand and campaign),
          #   but with documents absent — documents are not fetched for a list, because a
          #   catalog lookup and a document read per market would multiply across a page.
          #   Absent documents is distinct from an empty list: absent says they were not
          #   fetched; empty says the market has been given none. The parent object is null
          #   only when the market registers with nobody and compliance was not computed —
          #   nothing to show at all.
          #
          #   @return [Sentdm::Models::Channels::SuppliedCompliance, nil]
          optional :data, -> { Sentdm::Channels::SuppliedCompliance }, nil?: true

          # @!attribute error
          #   Error information
          #
          #   @return [Sentdm::Models::ErrorDetail, nil]
          optional :error, -> { Sentdm::ErrorDetail }, nil?: true

          # @!attribute meta
          #   Request and response metadata
          #
          #   @return [Sentdm::Models::APIMeta, nil]
          optional :meta, -> { Sentdm::APIMeta }

          # @!attribute success
          #   Indicates whether the request was successful
          #
          #   @return [Boolean, nil]
          optional :success, Sentdm::Internal::Type::Boolean

          # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Channels::SMS::APIResponseOfSuppliedCompliance} for more
          #   details.
          #
          #   Standard API response envelope for all v3 endpoints
          #
          #   @param data [Sentdm::Models::Channels::SuppliedCompliance, nil] What a market has been given: the identity it registers under, its programme, an
          #
          #   @param error [Sentdm::Models::ErrorDetail, nil] Error information
          #
          #   @param meta [Sentdm::Models::APIMeta] Request and response metadata
          #
          #   @param success [Boolean] Indicates whether the request was successful
        end
      end
    end
  end
end
