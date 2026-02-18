# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Brands#delete
    class BrandDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute body
      #   Request to delete a brand
      #
      #   @return [Sentdm::Models::BrandDeleteParams::Body]
      required :body, -> { Sentdm::BrandDeleteParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [Sentdm::Models::BrandDeleteParams::Body] Request to delete a brand
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class Body < Sentdm::Models::MutationRequest
        # @!method initialize
        #   Request to delete a brand
      end
    end
  end
end
