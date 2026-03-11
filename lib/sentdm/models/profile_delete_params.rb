# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#delete
    class ProfileDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute profile_id
      #
      #   @return [String]
      required :profile_id, String

      # @!attribute body
      #   Request to delete a profile
      #
      #   @return [Sentdm::Models::ProfileDeleteParams::Body]
      required :body, -> { Sentdm::ProfileDeleteParams::Body }

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(profile_id:, body:, x_profile_id: nil, request_options: {})
      #   @param profile_id [String]
      #
      #   @param body [Sentdm::Models::ProfileDeleteParams::Body] Request to delete a profile
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class Body < Sentdm::Models::MutationRequestBase
        # @!method initialize
        #   Request to delete a profile
      end
    end
  end
end
