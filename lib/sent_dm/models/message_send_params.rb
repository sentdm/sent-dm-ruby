# frozen_string_literal: true

module SentDm
  module Models
    # @see SentDm::Resources::Messages#send_
    class MessageSendParams < SentDm::Internal::Type::BaseModel
      extend SentDm::Internal::Type::RequestParameters::Converter
      include SentDm::Internal::Type::RequestParameters

      # @!attribute channel
      #   Channels to broadcast on, e.g. ["whatsapp", "sms"]. Each channel produces a
      #   separate message per recipient. "sent" = auto-detect, "rcs" = reserved
      #   (skipped). Defaults to ["sent"] (auto-detect) if omitted.
      #
      #   @return [Array<String>, nil]
      optional :channel, SentDm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute template
      #   Template reference (by id or name, with optional parameters)
      #
      #   @return [SentDm::Models::MessageSendParams::Template, nil]
      optional :template, -> { SentDm::MessageSendParams::Template }

      # @!attribute test_mode
      #   Test mode flag - when true, the operation is simulated without side effects
      #   Useful for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :test_mode, SentDm::Internal::Type::Boolean

      # @!attribute to
      #   List of recipient phone numbers in E.164 format (multi-recipient fan-out)
      #
      #   @return [Array<String>, nil]
      optional :to, SentDm::Internal::Type::ArrayOf[String]

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!method initialize(channel: nil, template: nil, test_mode: nil, to: nil, idempotency_key: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::MessageSendParams} for more details.
      #
      #   @param channel [Array<String>, nil] Channels to broadcast on, e.g. ["whatsapp", "sms"].
      #
      #   @param template [SentDm::Models::MessageSendParams::Template] Template reference (by id or name, with optional parameters)
      #
      #   @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      #   @param to [Array<String>] List of recipient phone numbers in E.164 format (multi-recipient fan-out)
      #
      #   @param idempotency_key [String]
      #
      #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]

      class Template < SentDm::Internal::Type::BaseModel
        # @!attribute id
        #   Template ID (mutually exclusive with name)
        #
        #   @return [String, nil]
        optional :id, String, nil?: true

        # @!attribute name
        #   Template name (mutually exclusive with id)
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute parameters
        #   Template variable parameters for personalization
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :parameters, SentDm::Internal::Type::HashOf[String], nil?: true

        # @!method initialize(id: nil, name: nil, parameters: nil)
        #   Template reference (by id or name, with optional parameters)
        #
        #   @param id [String, nil] Template ID (mutually exclusive with name)
        #
        #   @param name [String, nil] Template name (mutually exclusive with id)
        #
        #   @param parameters [Hash{Symbol=>String}, nil] Template variable parameters for personalization
      end
    end
  end
end
