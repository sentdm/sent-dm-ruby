# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#retrieve
    class ProfileRetrieveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute profile_id
      #
      #   @return [String]
      required :profile_id, String

      # @!method initialize(profile_id:, request_options: {})
      #   @param profile_id [String]
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
