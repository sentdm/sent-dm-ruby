# frozen_string_literal: true

module SentDm
  module Models
    class TemplateDefinition < SentDm::Internal::Type::BaseModel
      # @!attribute body
      #   Required template body with content for different channels (multi-channel,
      #   SMS-specific, or WhatsApp-specific)
      #
      #   @return [SentDm::Models::TemplateDefinition::Body]
      required :body, -> { SentDm::TemplateDefinition::Body }

      # @!attribute authentication_config
      #   Configuration specific to AUTHENTICATION category templates (optional)
      #
      #   @return [SentDm::Models::TemplateDefinition::AuthenticationConfig, nil]
      optional :authentication_config,
               -> { SentDm::TemplateDefinition::AuthenticationConfig },
               api_name: :authenticationConfig,
               nil?: true

      # @!attribute buttons
      #   Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @return [Array<SentDm::Models::TemplateDefinition::Button>, nil]
      optional :buttons,
               -> {
                 SentDm::Internal::Type::ArrayOf[SentDm::TemplateDefinition::Button]
               },
               nil?: true

      # @!attribute definition_version
      #   The version of the template definition format
      #
      #   @return [String, nil]
      optional :definition_version, String, api_name: :definitionVersion, nil?: true

      # @!attribute footer
      #   Optional template footer with optional variables
      #
      #   @return [SentDm::Models::TemplateDefinition::Footer, nil]
      optional :footer, -> { SentDm::TemplateDefinition::Footer }, nil?: true

      # @!attribute header
      #   Optional template header with optional variables
      #
      #   @return [SentDm::Models::TemplateDefinition::Header, nil]
      optional :header, -> { SentDm::TemplateDefinition::Header }, nil?: true

      # @!method initialize(body:, authentication_config: nil, buttons: nil, definition_version: nil, footer: nil, header: nil)
      #   Some parameter documentations has been truncated, see
      #   {SentDm::Models::TemplateDefinition} for more details.
      #
      #   Complete definition of a message template including header, body, footer, and
      #   buttons
      #
      #   @param body [SentDm::Models::TemplateDefinition::Body] Required template body with content for different channels (multi-channel, SMS-s
      #
      #   @param authentication_config [SentDm::Models::TemplateDefinition::AuthenticationConfig, nil] Configuration specific to AUTHENTICATION category templates (optional)
      #
      #   @param buttons [Array<SentDm::Models::TemplateDefinition::Button>, nil] Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @param definition_version [String, nil] The version of the template definition format
      #
      #   @param footer [SentDm::Models::TemplateDefinition::Footer, nil] Optional template footer with optional variables
      #
      #   @param header [SentDm::Models::TemplateDefinition::Header, nil] Optional template header with optional variables

      # @see SentDm::Models::TemplateDefinition#body
      class Body < SentDm::Internal::Type::BaseModel
        # @!attribute multi_channel
        #   Content that will be used for all channels (SMS and WhatsApp) unless
        #   channel-specific content is provided
        #
        #   @return [SentDm::Models::TemplateBodyContent, nil]
        optional :multi_channel, -> { SentDm::TemplateBodyContent }, api_name: :multiChannel, nil?: true

        # @!attribute sms
        #   SMS-specific content that overrides multi-channel content for SMS messages
        #
        #   @return [SentDm::Models::TemplateBodyContent, nil]
        optional :sms, -> { SentDm::TemplateBodyContent }, nil?: true

        # @!attribute whatsapp
        #   WhatsApp-specific content that overrides multi-channel content for WhatsApp
        #   messages
        #
        #   @return [SentDm::Models::TemplateBodyContent, nil]
        optional :whatsapp, -> { SentDm::TemplateBodyContent }, nil?: true

        # @!method initialize(multi_channel: nil, sms: nil, whatsapp: nil)
        #   Some parameter documentations has been truncated, see
        #   {SentDm::Models::TemplateDefinition::Body} for more details.
        #
        #   Required template body with content for different channels (multi-channel,
        #   SMS-specific, or WhatsApp-specific)
        #
        #   @param multi_channel [SentDm::Models::TemplateBodyContent, nil] Content that will be used for all channels (SMS and WhatsApp) unless channel-spe
        #
        #   @param sms [SentDm::Models::TemplateBodyContent, nil] SMS-specific content that overrides multi-channel content for SMS messages
        #
        #   @param whatsapp [SentDm::Models::TemplateBodyContent, nil] WhatsApp-specific content that overrides multi-channel content for WhatsApp mess
      end

      # @see SentDm::Models::TemplateDefinition#authentication_config
      class AuthenticationConfig < SentDm::Internal::Type::BaseModel
        # @!attribute add_security_recommendation
        #   Whether to add the security recommendation text: "For your security, do not
        #   share this code."
        #
        #   @return [Boolean, nil]
        optional :add_security_recommendation,
                 SentDm::Internal::Type::Boolean,
                 api_name: :addSecurityRecommendation

        # @!attribute code_expiration_minutes
        #   Code expiration time in minutes (1-90). If set, adds footer: "This code expires
        #   in X minutes."
        #
        #   @return [Integer, nil]
        optional :code_expiration_minutes, Integer, api_name: :codeExpirationMinutes, nil?: true

        # @!method initialize(add_security_recommendation: nil, code_expiration_minutes: nil)
        #   Some parameter documentations has been truncated, see
        #   {SentDm::Models::TemplateDefinition::AuthenticationConfig} for more details.
        #
        #   Configuration specific to AUTHENTICATION category templates (optional)
        #
        #   @param add_security_recommendation [Boolean] Whether to add the security recommendation text: "For your security, do not shar
        #
        #   @param code_expiration_minutes [Integer, nil] Code expiration time in minutes (1-90). If set, adds footer: "This code expires
      end

      class Button < SentDm::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier of the button (1-based index)
        #
        #   @return [Integer, nil]
        optional :id, Integer

        # @!attribute props
        #   Properties specific to the button type
        #
        #   @return [SentDm::Models::TemplateDefinition::Button::Props, nil]
        optional :props, -> { SentDm::TemplateDefinition::Button::Props }

        # @!attribute type
        #   The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(id: nil, props: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {SentDm::Models::TemplateDefinition::Button} for more details.
        #
        #   Interactive button in a message template
        #
        #   @param id [Integer] The unique identifier of the button (1-based index)
        #
        #   @param props [SentDm::Models::TemplateDefinition::Button::Props] Properties specific to the button type
        #
        #   @param type [String] The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)

        # @see SentDm::Models::TemplateDefinition::Button#props
        class Props < SentDm::Internal::Type::BaseModel
          # @!attribute active_for
          #
          #   @return [Integer, nil]
          optional :active_for, Integer, api_name: :activeFor, nil?: true

          # @!attribute autofill_text
          #
          #   @return [String, nil]
          optional :autofill_text, String, api_name: :autofillText, nil?: true

          # @!attribute country_code
          #
          #   @return [String, nil]
          optional :country_code, String, api_name: :countryCode, nil?: true

          # @!attribute offer_code
          #
          #   @return [String, nil]
          optional :offer_code, String, api_name: :offerCode, nil?: true

          # @!attribute otp_type
          #
          #   @return [String, nil]
          optional :otp_type, String, api_name: :otpType, nil?: true

          # @!attribute package_name
          #
          #   @return [String, nil]
          optional :package_name, String, api_name: :packageName, nil?: true

          # @!attribute phone_number
          #
          #   @return [String, nil]
          optional :phone_number, String, api_name: :phoneNumber, nil?: true

          # @!attribute quick_reply_type
          #
          #   @return [String, nil]
          optional :quick_reply_type, String, api_name: :quickReplyType, nil?: true

          # @!attribute signature_hash
          #
          #   @return [String, nil]
          optional :signature_hash, String, api_name: :signatureHash, nil?: true

          # @!attribute text
          #
          #   @return [String, nil]
          optional :text, String, nil?: true

          # @!attribute url
          #
          #   @return [String, nil]
          optional :url, String, nil?: true

          # @!attribute url_type
          #
          #   @return [String, nil]
          optional :url_type, String, api_name: :urlType, nil?: true

          # @!method initialize(active_for: nil, autofill_text: nil, country_code: nil, offer_code: nil, otp_type: nil, package_name: nil, phone_number: nil, quick_reply_type: nil, signature_hash: nil, text: nil, url: nil, url_type: nil)
          #   Properties specific to the button type
          #
          #   @param active_for [Integer, nil]
          #   @param autofill_text [String, nil]
          #   @param country_code [String, nil]
          #   @param offer_code [String, nil]
          #   @param otp_type [String, nil]
          #   @param package_name [String, nil]
          #   @param phone_number [String, nil]
          #   @param quick_reply_type [String, nil]
          #   @param signature_hash [String, nil]
          #   @param text [String, nil]
          #   @param url [String, nil]
          #   @param url_type [String, nil]
        end
      end

      # @see SentDm::Models::TemplateDefinition#footer
      class Footer < SentDm::Internal::Type::BaseModel
        # @!attribute template
        #   The footer template text with optional variable placeholders
        #
        #   @return [String, nil]
        optional :template, String

        # @!attribute type
        #   The type of footer (typically "text")
        #
        #   @return [String, nil]
        optional :type, String, nil?: true

        # @!attribute variables
        #   List of variables used in the footer template
        #
        #   @return [Array<SentDm::Models::TemplateVariable>, nil]
        optional :variables, -> { SentDm::Internal::Type::ArrayOf[SentDm::TemplateVariable] }, nil?: true

        # @!method initialize(template: nil, type: nil, variables: nil)
        #   Optional template footer with optional variables
        #
        #   @param template [String] The footer template text with optional variable placeholders
        #
        #   @param type [String, nil] The type of footer (typically "text")
        #
        #   @param variables [Array<SentDm::Models::TemplateVariable>, nil] List of variables used in the footer template
      end

      # @see SentDm::Models::TemplateDefinition#header
      class Header < SentDm::Internal::Type::BaseModel
        # @!attribute template
        #   The header template text with optional variable placeholders (e.g., "Welcome to
        #   {{0:variable}}")
        #
        #   @return [String, nil]
        optional :template, String

        # @!attribute type
        #   The type of header (e.g., "text", "image", "video", "document")
        #
        #   @return [String, nil]
        optional :type, String, nil?: true

        # @!attribute variables
        #   List of variables used in the header template
        #
        #   @return [Array<SentDm::Models::TemplateVariable>, nil]
        optional :variables, -> { SentDm::Internal::Type::ArrayOf[SentDm::TemplateVariable] }, nil?: true

        # @!method initialize(template: nil, type: nil, variables: nil)
        #   Some parameter documentations has been truncated, see
        #   {SentDm::Models::TemplateDefinition::Header} for more details.
        #
        #   Optional template header with optional variables
        #
        #   @param template [String] The header template text with optional variable placeholders (e.g., "Welcome to
        #
        #   @param type [String, nil] The type of header (e.g., "text", "image", "video", "document")
        #
        #   @param variables [Array<SentDm::Models::TemplateVariable>, nil] List of variables used in the header template
      end
    end
  end
end
