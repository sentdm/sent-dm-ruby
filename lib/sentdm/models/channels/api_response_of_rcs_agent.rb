# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      # @see Sentdm::Resources::Channels::Rcs#create
      class APIResponseOfRcsAgent < Sentdm::Internal::Type::BaseModel
        # @!attribute data
        #   An RCS agent as its owner sees it: the order form back, plus where the
        #   submission stands.
        #
        #   Not RcsSenderResponse. That one is the admin projection and carries the pipeline
        #   we track about a customer's request — internalStatus, statusReason, isLaunched —
        #   and the S3 keys behind the assets. None of that is the customer's to read: an
        #   internal status is a note to ourselves, and an S3 key is a storage detail that
        #   would become a contract the moment it was published.
        #
        #   What is here is what the caller sent, in the names it sent them under, plus the
        #   three things only we can answer: the record's id, its status, and the number it
        #   sends from. So a read after a write shows the form as stored rather than as
        #   echoed.
        #
        #   @return [Sentdm::Models::Channels::RcsAgent, nil]
        optional :data, -> { Sentdm::Channels::RcsAgent }, nil?: true

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
        #   {Sentdm::Models::Channels::APIResponseOfRcsAgent} for more details.
        #
        #   Standard API response envelope for all v3 endpoints
        #
        #   @param data [Sentdm::Models::Channels::RcsAgent, nil] An RCS agent as its owner sees it: the order form back, plus where the submissio
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
