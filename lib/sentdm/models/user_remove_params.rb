# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Users#remove
    class UserRemoveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, Sentdm::Internal::Type::Boolean

      # @!attribute body_user_id
      #   User ID from route parameter
      #
      #   @return [String, nil]
      optional :body_user_id, String, api_name: :user_id

      # @!method initialize(test_mode: nil, body_user_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::UserRemoveParams} for more details.
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param body_user_id [String] User ID from route parameter
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
