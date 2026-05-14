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

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(profile_id:, sandbox: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ProfileDeleteParams} for more details.
      #
      #   @param profile_id [String]
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
