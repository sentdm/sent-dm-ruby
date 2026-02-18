# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Contacts#delete
    class ContactDeleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute body
      #   Request to delete/dissociate a contact
      #
      #   @return [SentDm::Models::ContactDeleteParams::Body]
      required :body, -> { SentDm::ContactDeleteParams::Body }

      # @!method initialize(body:, request_options: {})
      #   @param body [SentDm::Models::ContactDeleteParams::Body] Request to delete/dissociate a contact
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]

      class Body < SentDm::Models::MutationRequest
        # @!method initialize
        #   Request to delete/dissociate a contact
      end
    end
  end
end
