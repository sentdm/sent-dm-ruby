# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Messages#send_
    class MessageSendParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute channel
      #   Channels to broadcast on, e.g. ["whatsapp", "sms"]. Each channel produces a
      #   separate message per recipient. "sent" = auto-detect, "rcs" = reserved
      #   (skipped). Defaults to ["sent"] (auto-detect) if omitted.
      #
      #   @return [Array<String>, nil]
      optional :channel, Sentdm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute template
      #   SDK-style template reference: resolve by ID or by name, with optional
      #   parameters.
      #
      #   @return [Sentdm::Models::MessageSendParams::Template, nil]
      optional :template, -> { Sentdm::MessageSendParams::Template }

      # @!attribute to
      #   List of recipient phone numbers in E.164 format (multi-recipient fan-out)
      #
      #   @return [Array<String>, nil]
      optional :to, Sentdm::Internal::Type::ArrayOf[String]

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(channel: nil, sandbox: nil, template: nil, to: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::MessageSendParams} for more details.
      #
      #   @param channel [Array<String>, nil] Channels to broadcast on, e.g. ["whatsapp", "sms"].
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param template [Sentdm::Models::MessageSendParams::Template] SDK-style template reference: resolve by ID or by name, with optional parameters
      #
      #   @param to [Array<String>] List of recipient phone numbers in E.164 format (multi-recipient fan-out)
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class Template < Sentdm::Internal::Type::BaseModel
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
        optional :parameters, Sentdm::Internal::Type::HashOf[String], nil?: true

        # @!method initialize(id: nil, name: nil, parameters: nil)
        #   SDK-style template reference: resolve by ID or by name, with optional
        #   parameters.
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
