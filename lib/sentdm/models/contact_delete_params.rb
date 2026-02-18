# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Contacts#delete
    class ContactDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute body
      #   Request to delete/dissociate a contact
      #
      #   @return [Sentdm::Models::ContactDeleteParams::Body]
      required :body, -> { Sentdm::ContactDeleteParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [Sentdm::Models::ContactDeleteParams::Body] Request to delete/dissociate a contact
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class Body < Sentdm::Models::MutationRequest
        # @!method initialize
        #   Request to delete/dissociate a contact
      end
    end
  end
end
