# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Users#remove
    class UserRemoveParams < Sentdm::Models::MutationRequest
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute user_id
      #
      #   @return [String]
      required :user_id, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(user_id:, x_profile_id: nil, request_options: {})
      #   @param user_id [String]
      #   @param x_profile_id [String]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
