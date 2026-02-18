# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Profiles#delete
    class ProfileDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute body_profile_id
      #   Profile ID from route parameter
      #
      #   @return [String, nil]
      optional :body_profile_id, String, api_name: :profile_id

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, Sentdm::Internal::Type::Boolean

      # @!method initialize(body_profile_id: nil, test_mode: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileDeleteParams} for more details.
      #
      #   @param body_profile_id [String] Profile ID from route parameter
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
