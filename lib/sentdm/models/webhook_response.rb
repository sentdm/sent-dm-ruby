# frozen_string_literal: true

module Sentdm
  module Models
    class WebhookResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute consecutive_failures
      #
      #   @return [Integer, nil]
      optional :consecutive_failures, Integer

      # @!attribute created_at
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute display_name
      #
      #   @return [String, nil]
      optional :display_name, String

      # @!attribute endpoint_url
      #
      #   @return [String, nil]
      optional :endpoint_url, String

      # @!attribute event_types
      #
      #   @return [Array<String>, nil]
      optional :event_types, Sentdm::Internal::Type::ArrayOf[String]

      # @!attribute is_active
      #
      #   @return [Boolean, nil]
      optional :is_active, Sentdm::Internal::Type::Boolean

      # @!attribute last_delivery_attempt_at
      #
      #   @return [Time, nil]
      optional :last_delivery_attempt_at, Time, nil?: true

      # @!attribute last_successful_delivery_at
      #
      #   @return [Time, nil]
      optional :last_successful_delivery_at, Time, nil?: true

      # @!attribute retry_count
      #
      #   @return [Integer, nil]
      optional :retry_count, Integer

      # @!attribute signing_secret
      #
      #   @return [String, nil]
      optional :signing_secret, String, nil?: true

      # @!attribute timeout_seconds
      #
      #   @return [Integer, nil]
      optional :timeout_seconds, Integer

      # @!attribute updated_at
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!method initialize(id: nil, consecutive_failures: nil, created_at: nil, display_name: nil, endpoint_url: nil, event_types: nil, is_active: nil, last_delivery_attempt_at: nil, last_successful_delivery_at: nil, retry_count: nil, signing_secret: nil, timeout_seconds: nil, updated_at: nil)
      #   @param id [String]
      #   @param consecutive_failures [Integer]
      #   @param created_at [Time]
      #   @param display_name [String]
      #   @param endpoint_url [String]
      #   @param event_types [Array<String>]
      #   @param is_active [Boolean]
      #   @param last_delivery_attempt_at [Time, nil]
      #   @param last_successful_delivery_at [Time, nil]
      #   @param retry_count [Integer]
      #   @param signing_secret [String, nil]
      #   @param timeout_seconds [Integer]
      #   @param updated_at [Time, nil]
    end
  end
end
