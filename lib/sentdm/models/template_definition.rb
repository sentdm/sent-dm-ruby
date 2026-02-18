# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateDefinition < Sentdm::Internal::Type::BaseModel
      # @!attribute body
      #   Required template body with content for different channels (multi-channel,
      #   SMS-specific, or WhatsApp-specific)
      #
      #   @return [Sentdm::Models::TemplateDefinition::Body]
      required :body, -> { Sentdm::TemplateDefinition::Body }

      # @!attribute authentication_config
      #   Configuration specific to AUTHENTICATION category templates (optional)
      #
      #   @return [Sentdm::Models::TemplateDefinition::AuthenticationConfig, nil]
      optional :authentication_config,
               -> { Sentdm::TemplateDefinition::AuthenticationConfig },
               api_name: :authenticationConfig,
               nil?: true

      # @!attribute buttons
      #   Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @return [Array<Sentdm::Models::TemplateDefinition::Button>, nil]
      optional :buttons,
               -> {
                 Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateDefinition::Button]
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
      #   @return [Sentdm::Models::TemplateDefinition::Footer, nil]
      optional :footer, -> { Sentdm::TemplateDefinition::Footer }, nil?: true

      # @!attribute header
      #   Optional template header with optional variables
      #
      #   @return [Sentdm::Models::TemplateDefinition::Header, nil]
      optional :header, -> { Sentdm::TemplateDefinition::Header }, nil?: true

      # @!method initialize(body:, authentication_config: nil, buttons: nil, definition_version: nil, footer: nil, header: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateDefinition} for more details.
      #
      #   Complete definition of a message template including header, body, footer, and
      #   buttons
      #
      #   @param body [Sentdm::Models::TemplateDefinition::Body] Required template body with content for different channels (multi-channel, SMS-s
      #
      #   @param authentication_config [Sentdm::Models::TemplateDefinition::AuthenticationConfig, nil] Configuration specific to AUTHENTICATION category templates (optional)
      #
      #   @param buttons [Array<Sentdm::Models::TemplateDefinition::Button>, nil] Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @param definition_version [String, nil] The version of the template definition format
      #
      #   @param footer [Sentdm::Models::TemplateDefinition::Footer, nil] Optional template footer with optional variables
      #
      #   @param header [Sentdm::Models::TemplateDefinition::Header, nil] Optional template header with optional variables

      # @see Sentdm::Models::TemplateDefinition#body
      class Body < Sentdm::Internal::Type::BaseModel
        # @!attribute multi_channel
        #   Content that will be used for all channels (SMS and WhatsApp) unless
        #   channel-specific content is provided
        #
        #   @return [Sentdm::Models::TemplateBodyContent, nil]
        optional :multi_channel, -> { Sentdm::TemplateBodyContent }, api_name: :multiChannel, nil?: true

        # @!attribute sms
        #   SMS-specific content that overrides multi-channel content for SMS messages
        #
        #   @return [Sentdm::Models::TemplateBodyContent, nil]
        optional :sms, -> { Sentdm::TemplateBodyContent }, nil?: true

        # @!attribute whatsapp
        #   WhatsApp-specific content that overrides multi-channel content for WhatsApp
        #   messages
        #
        #   @return [Sentdm::Models::TemplateBodyContent, nil]
        optional :whatsapp, -> { Sentdm::TemplateBodyContent }, nil?: true

        # @!method initialize(multi_channel: nil, sms: nil, whatsapp: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::TemplateDefinition::Body} for more details.
        #
        #   Required template body with content for different channels (multi-channel,
        #   SMS-specific, or WhatsApp-specific)
        #
        #   @param multi_channel [Sentdm::Models::TemplateBodyContent, nil] Content that will be used for all channels (SMS and WhatsApp) unless channel-spe
        #
        #   @param sms [Sentdm::Models::TemplateBodyContent, nil] SMS-specific content that overrides multi-channel content for SMS messages
        #
        #   @param whatsapp [Sentdm::Models::TemplateBodyContent, nil] WhatsApp-specific content that overrides multi-channel content for WhatsApp mess
      end

      # @see Sentdm::Models::TemplateDefinition#authentication_config
      class AuthenticationConfig < Sentdm::Internal::Type::BaseModel
        # @!attribute add_security_recommendation
        #   Whether to add the security recommendation text: "For your security, do not
        #   share this code."
        #
        #   @return [Boolean, nil]
        optional :add_security_recommendation,
                 Sentdm::Internal::Type::Boolean,
                 api_name: :addSecurityRecommendation

        # @!attribute code_expiration_minutes
        #   Code expiration time in minutes (1-90). If set, adds footer: "This code expires
        #   in X minutes."
        #
        #   @return [Integer, nil]
        optional :code_expiration_minutes, Integer, api_name: :codeExpirationMinutes, nil?: true

        # @!method initialize(add_security_recommendation: nil, code_expiration_minutes: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::TemplateDefinition::AuthenticationConfig} for more details.
        #
        #   Configuration specific to AUTHENTICATION category templates (optional)
        #
        #   @param add_security_recommendation [Boolean] Whether to add the security recommendation text: "For your security, do not shar
        #
        #   @param code_expiration_minutes [Integer, nil] Code expiration time in minutes (1-90). If set, adds footer: "This code expires
      end

      class Button < Sentdm::Internal::Type::BaseModel
        # @!attribute id
        #   The unique identifier of the button (1-based index)
        #
        #   @return [Integer, nil]
        optional :id, Integer

        # @!attribute props
        #   Properties specific to the button type
        #
        #   @return [Sentdm::Models::TemplateDefinition::Button::Props, nil]
        optional :props, -> { Sentdm::TemplateDefinition::Button::Props }

        # @!attribute type
        #   The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(id: nil, props: nil, type: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::TemplateDefinition::Button} for more details.
        #
        #   Interactive button in a message template
        #
        #   @param id [Integer] The unique identifier of the button (1-based index)
        #
        #   @param props [Sentdm::Models::TemplateDefinition::Button::Props] Properties specific to the button type
        #
        #   @param type [String] The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)

        # @see Sentdm::Models::TemplateDefinition::Button#props
        class Props < Sentdm::Internal::Type::BaseModel
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

      # @see Sentdm::Models::TemplateDefinition#footer
      class Footer < Sentdm::Internal::Type::BaseModel
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
        #   @return [Array<Sentdm::Models::TemplateVariable>, nil]
        optional :variables, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateVariable] }, nil?: true

        # @!method initialize(template: nil, type: nil, variables: nil)
        #   Optional template footer with optional variables
        #
        #   @param template [String] The footer template text with optional variable placeholders
        #
        #   @param type [String, nil] The type of footer (typically "text")
        #
        #   @param variables [Array<Sentdm::Models::TemplateVariable>, nil] List of variables used in the footer template
      end

      # @see Sentdm::Models::TemplateDefinition#header
      class Header < Sentdm::Internal::Type::BaseModel
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
        #   @return [Array<Sentdm::Models::TemplateVariable>, nil]
        optional :variables, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateVariable] }, nil?: true

        # @!method initialize(template: nil, type: nil, variables: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::TemplateDefinition::Header} for more details.
        #
        #   Optional template header with optional variables
        #
        #   @param template [String] The header template text with optional variable placeholders (e.g., "Welcome to
        #
        #   @param type [String, nil] The type of header (e.g., "text", "image", "video", "document")
        #
        #   @param variables [Array<Sentdm::Models::TemplateVariable>, nil] List of variables used in the header template
      end
    end
  end
end
