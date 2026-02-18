# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Brands#delete
    class BrandDeleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute body
      #   Request to delete a brand
      #
      #   @return [SentDm::Models::BrandDeleteParams::Body]
      required :body, -> { SentDm::BrandDeleteParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [SentDm::Models::BrandDeleteParams::Body] Request to delete a brand
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]

      class Body < SentDm::Models::MutationRequest
        # @!method initialize
        #   Request to delete a brand
      end
    end
  end
end
