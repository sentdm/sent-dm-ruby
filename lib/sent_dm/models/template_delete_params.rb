# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Templates#delete
    class TemplateDeleteParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute delete_from_meta
      #   Whether to also delete the template from WhatsApp/Meta (optional, defaults to
      #   false)
      #
      #   @return [Boolean, nil]
      optional :delete_from_meta, SentDm::Internal::Type::Boolean, nil?: true

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, SentDm::Internal::Type::Boolean

      # @!method initialize(delete_from_meta: nil, test_mode: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::TemplateDeleteParams} for more details.
      #
      #   @param delete_from_meta [Boolean, nil] Whether to also delete the template from WhatsApp/Meta (optional, defaults to fa
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
