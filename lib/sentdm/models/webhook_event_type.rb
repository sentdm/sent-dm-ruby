# frozen_string_literal: true

module Sentdm
  module Models
    class WebhookEventType < Sentdm::Internal::Type::BaseModel
      # @!attribute description
      #
      #   @return [String, nil]
      optional :description, String, nil?: true

      # @!attribute display_name
      #
      #   @return [String, nil]
      optional :display_name, String

      # @!attribute event_type
      #
      #   @return [String, nil]
      optional :event_type, String, nil?: true

      # @!attribute is_active
      #
      #   @return [Boolean, nil]
      optional :is_active, Sentdm::Internal::Type::Boolean

      # @!attribute name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute sub_types
      #
      #   @return [Array<Sentdm::Models::WebhookEventType>, nil]
      optional :sub_types, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::WebhookEventType] }, nil?: true

      # @!method initialize(description: nil, display_name: nil, event_type: nil, is_active: nil, name: nil, sub_types: nil)
      #   @param description [String, nil]
      #   @param display_name [String]
      #   @param event_type [String, nil]
      #   @param is_active [Boolean]
      #   @param name [String]
      #   @param sub_types [Array<Sentdm::Models::WebhookEventType>, nil]
    end
  end
end
