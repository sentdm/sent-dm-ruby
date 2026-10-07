# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#delete
    class TemplateDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute delete_from_meta
      #   Whether to also delete the template from WhatsApp/Meta (optional, defaults to
      #   false)
      #
      #   @return [Boolean, nil]
      optional :delete_from_meta, Sentdm::Internal::Type::Boolean, nil?: true

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

      # @!method initialize(id:, delete_from_meta: nil, sandbox: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateDeleteParams} for more details.
      #
      #   @param id [String]
      #
      #   @param delete_from_meta [Boolean, nil] Whether to also delete the template from WhatsApp/Meta (optional, defaults to fa
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
