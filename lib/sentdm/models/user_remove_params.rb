# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Users#remove
    class UserRemoveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!attribute body
      #   Request to remove a user from an organization
      #
      #   @return [Sentdm::Models::UserRemoveParams::Body]
      required :body, -> { Sentdm::UserRemoveParams::Body }

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(user_id:, body:, x_profile_id: nil, request_options: {})
      #   @param user_id [String]
      #
      #   @param body [Sentdm::Models::UserRemoveParams::Body] Request to remove a user from an organization
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class Body < Sentdm::Models::MutationRequest
        # @!method initialize
        #   Request to remove a user from an organization
      end
    end
  end
end
