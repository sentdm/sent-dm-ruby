# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#update
    class TemplateUpdateParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute category
      #   Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @return [String, nil]
      optional :category, String, nil?: true

      # @!attribute definition
      #   Complete definition of a message template including header, body, footer, and
      #   buttons
      #
      #   @return [Sentdm::Models::TemplateUpdateParams::Definition, nil]
      optional :definition, -> { Sentdm::TemplateUpdateParams::Definition }, nil?: true

      # @!attribute language
      #   Template language code (e.g., en_US)
      #
      #   @return [String, nil]
      optional :language, String, nil?: true

      # @!attribute name
      #   Template display name
      #
      #   @return [String, nil]
      optional :name, String, nil?: true

      # @!attribute sandbox
      #   Sandbox flag - when true, the operation is simulated without side effects Useful
      #   for testing integrations without actual execution
      #
      #   @return [Boolean, nil]
      optional :sandbox, Sentdm::Internal::Type::Boolean

      # @!attribute submit_for_review
      #   Whether to submit the template for review after updating (default: false)
      #
      #   @return [Boolean, nil]
      optional :submit_for_review, Sentdm::Internal::Type::Boolean

      # @!attribute idempotency_key
      #
      #   @return [String, nil]
      optional :idempotency_key, String

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(id:, category: nil, definition: nil, language: nil, name: nil, sandbox: nil, submit_for_review: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateUpdateParams} for more details.
      #
      #   @param id [String]
      #
      #   @param category [String, nil] Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @param definition [Sentdm::Models::TemplateUpdateParams::Definition, nil] Complete definition of a message template including header, body, footer, and bu
      #
      #   @param language [String, nil] Template language code (e.g., en_US)
      #
      #   @param name [String, nil] Template display name
      #
      #   @param sandbox [Boolean] Sandbox flag - when true, the operation is simulated without side effects
      #
      #   @param submit_for_review [Boolean] Whether to submit the template for review after updating (default: false)
      #
      #   @param idempotency_key [String]
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]

      class Definition < Sentdm::Internal::Type::BaseModel
        # @!attribute body
        #   Body section of a message template with channel-specific content
        #
        #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body]
        required :body, -> { Sentdm::TemplateUpdateParams::Definition::Body }

        # @!attribute authentication_config
        #   Configuration for AUTHENTICATION category templates
        #
        #   @return [Sentdm::Models::TemplateUpdateParams::Definition::AuthenticationConfig, nil]
        optional :authentication_config,
                 -> { Sentdm::TemplateUpdateParams::Definition::AuthenticationConfig },
                 api_name: :authenticationConfig,
                 nil?: true

        # @!attribute buttons
        #   Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
        #
        #   @return [Array<Sentdm::Models::TemplateUpdateParams::Definition::Button>, nil]
        optional :buttons,
                 -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateUpdateParams::Definition::Button] },
                 nil?: true

        # @!attribute definition_version
        #   The version of the template definition format
        #
        #   @return [String, nil]
        optional :definition_version, String, api_name: :definitionVersion, nil?: true

        # @!attribute footer
        #   Footer section of a message template
        #
        #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Footer, nil]
        optional :footer, -> { Sentdm::TemplateUpdateParams::Definition::Footer }, nil?: true

        # @!attribute header
        #   Header section of a message template
        #
        #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Header, nil]
        optional :header, -> { Sentdm::TemplateUpdateParams::Definition::Header }, nil?: true

        # @!method initialize(body:, authentication_config: nil, buttons: nil, definition_version: nil, footer: nil, header: nil)
        #   Complete definition of a message template including header, body, footer, and
        #   buttons
        #
        #   @param body [Sentdm::Models::TemplateUpdateParams::Definition::Body] Body section of a message template with channel-specific content
        #
        #   @param authentication_config [Sentdm::Models::TemplateUpdateParams::Definition::AuthenticationConfig, nil] Configuration for AUTHENTICATION category templates
        #
        #   @param buttons [Array<Sentdm::Models::TemplateUpdateParams::Definition::Button>, nil] Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
        #
        #   @param definition_version [String, nil] The version of the template definition format
        #
        #   @param footer [Sentdm::Models::TemplateUpdateParams::Definition::Footer, nil] Footer section of a message template
        #
        #   @param header [Sentdm::Models::TemplateUpdateParams::Definition::Header, nil] Header section of a message template

        # @see Sentdm::Models::TemplateUpdateParams::Definition#body
        class Body < Sentdm::Internal::Type::BaseModel
          # @!attribute multi_channel
          #   Content that will be used for all channels (SMS and WhatsApp) unless
          #   channel-specific content is provided
          #
          #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body::MultiChannel, nil]
          optional :multi_channel,
                   -> { Sentdm::TemplateUpdateParams::Definition::Body::MultiChannel },
                   api_name: :multiChannel,
                   nil?: true

          # @!attribute rcs
          #   RCS-specific content that overrides multi-channel content for RCS messages
          #
          #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body::Rcs, nil]
          optional :rcs, -> { Sentdm::TemplateUpdateParams::Definition::Body::Rcs }, nil?: true

          # @!attribute sms
          #   SMS-specific content that overrides multi-channel content for SMS messages
          #
          #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body::SMS, nil]
          optional :sms, -> { Sentdm::TemplateUpdateParams::Definition::Body::SMS }, nil?: true

          # @!attribute whatsapp
          #   WhatsApp-specific content that overrides multi-channel content for WhatsApp
          #   messages
          #
          #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body::Whatsapp, nil]
          optional :whatsapp, -> { Sentdm::TemplateUpdateParams::Definition::Body::Whatsapp }, nil?: true

          # @!method initialize(multi_channel: nil, rcs: nil, sms: nil, whatsapp: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::TemplateUpdateParams::Definition::Body} for more details.
          #
          #   Body section of a message template with channel-specific content
          #
          #   @param multi_channel [Sentdm::Models::TemplateUpdateParams::Definition::Body::MultiChannel, nil] Content that will be used for all channels (SMS and WhatsApp) unless channel-spe
          #
          #   @param rcs [Sentdm::Models::TemplateUpdateParams::Definition::Body::Rcs, nil] RCS-specific content that overrides multi-channel content for RCS messages
          #
          #   @param sms [Sentdm::Models::TemplateUpdateParams::Definition::Body::SMS, nil] SMS-specific content that overrides multi-channel content for SMS messages
          #
          #   @param whatsapp [Sentdm::Models::TemplateUpdateParams::Definition::Body::Whatsapp, nil] WhatsApp-specific content that overrides multi-channel content for WhatsApp mess

          # @see Sentdm::Models::TemplateUpdateParams::Definition::Body#multi_channel
          class MultiChannel < Sentdm::Internal::Type::BaseModel
            # @!attribute template
            #
            #   @return [String]
            required :template, String

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String, nil?: true

            # @!attribute variables
            #
            #   @return [Array<Sentdm::Models::TemplateUpdateParams::Definition::Body::MultiChannel::Variable>, nil]
            optional :variables,
                     -> {
                       Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateUpdateParams::Definition::Body::MultiChannel::Variable]
                     },
                     nil?: true

            # @!method initialize(template:, type: nil, variables: nil)
            #   Content that will be used for all channels (SMS and WhatsApp) unless
            #   channel-specific content is provided
            #
            #   @param template [String]
            #   @param type [String, nil]
            #   @param variables [Array<Sentdm::Models::TemplateUpdateParams::Definition::Body::MultiChannel::Variable>, nil]

            class Variable < Sentdm::Internal::Type::BaseModel
              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!attribute props
              #
              #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body::MultiChannel::Variable::Props]
              required :props, -> { Sentdm::TemplateUpdateParams::Definition::Body::MultiChannel::Variable::Props }

              # @!attribute type
              #
              #   @return [String]
              required :type, String

              # @!attribute id
              #
              #   @return [Integer, nil]
              optional :id, Integer

              # @!method initialize(name:, props:, type:, id: nil)
              #   @param name [String]
              #   @param props [Sentdm::Models::TemplateUpdateParams::Definition::Body::MultiChannel::Variable::Props]
              #   @param type [String]
              #   @param id [Integer]

              # @see Sentdm::Models::TemplateUpdateParams::Definition::Body::MultiChannel::Variable#props
              class Props < Sentdm::Internal::Type::BaseModel
                # @!attribute media_type
                #
                #   @return [String]
                required :media_type, String, api_name: :mediaType

                # @!attribute sample
                #
                #   @return [String]
                required :sample, String

                # @!attribute url
                #
                #   @return [String]
                required :url, String

                # @!attribute variable_type
                #
                #   @return [String]
                required :variable_type, String, api_name: :variableType

                # @!attribute alt
                #
                #   @return [String, nil]
                optional :alt, String, nil?: true

                # @!attribute regex
                #
                #   @return [String, nil]
                optional :regex, String, nil?: true

                # @!attribute short_url
                #
                #   @return [String, nil]
                optional :short_url, String, api_name: :shortUrl, nil?: true

                # @!method initialize(media_type:, sample:, url:, variable_type:, alt: nil, regex: nil, short_url: nil)
                #   @param media_type [String]
                #   @param sample [String]
                #   @param url [String]
                #   @param variable_type [String]
                #   @param alt [String, nil]
                #   @param regex [String, nil]
                #   @param short_url [String, nil]
              end
            end
          end

          # @see Sentdm::Models::TemplateUpdateParams::Definition::Body#rcs
          class Rcs < Sentdm::Internal::Type::BaseModel
            # @!attribute template
            #
            #   @return [String]
            required :template, String

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String, nil?: true

            # @!attribute variables
            #
            #   @return [Array<Sentdm::Models::TemplateUpdateParams::Definition::Body::Rcs::Variable>, nil]
            optional :variables,
                     -> {
                       Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateUpdateParams::Definition::Body::Rcs::Variable]
                     },
                     nil?: true

            # @!method initialize(template:, type: nil, variables: nil)
            #   RCS-specific content that overrides multi-channel content for RCS messages
            #
            #   @param template [String]
            #   @param type [String, nil]
            #   @param variables [Array<Sentdm::Models::TemplateUpdateParams::Definition::Body::Rcs::Variable>, nil]

            class Variable < Sentdm::Internal::Type::BaseModel
              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!attribute props
              #
              #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body::Rcs::Variable::Props]
              required :props, -> { Sentdm::TemplateUpdateParams::Definition::Body::Rcs::Variable::Props }

              # @!attribute type
              #
              #   @return [String]
              required :type, String

              # @!attribute id
              #
              #   @return [Integer, nil]
              optional :id, Integer

              # @!method initialize(name:, props:, type:, id: nil)
              #   @param name [String]
              #   @param props [Sentdm::Models::TemplateUpdateParams::Definition::Body::Rcs::Variable::Props]
              #   @param type [String]
              #   @param id [Integer]

              # @see Sentdm::Models::TemplateUpdateParams::Definition::Body::Rcs::Variable#props
              class Props < Sentdm::Internal::Type::BaseModel
                # @!attribute media_type
                #
                #   @return [String]
                required :media_type, String, api_name: :mediaType

                # @!attribute sample
                #
                #   @return [String]
                required :sample, String

                # @!attribute url
                #
                #   @return [String]
                required :url, String

                # @!attribute variable_type
                #
                #   @return [String]
                required :variable_type, String, api_name: :variableType

                # @!attribute alt
                #
                #   @return [String, nil]
                optional :alt, String, nil?: true

                # @!attribute regex
                #
                #   @return [String, nil]
                optional :regex, String, nil?: true

                # @!attribute short_url
                #
                #   @return [String, nil]
                optional :short_url, String, api_name: :shortUrl, nil?: true

                # @!method initialize(media_type:, sample:, url:, variable_type:, alt: nil, regex: nil, short_url: nil)
                #   @param media_type [String]
                #   @param sample [String]
                #   @param url [String]
                #   @param variable_type [String]
                #   @param alt [String, nil]
                #   @param regex [String, nil]
                #   @param short_url [String, nil]
              end
            end
          end

          # @see Sentdm::Models::TemplateUpdateParams::Definition::Body#sms
          class SMS < Sentdm::Internal::Type::BaseModel
            # @!attribute template
            #
            #   @return [String]
            required :template, String

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String, nil?: true

            # @!attribute variables
            #
            #   @return [Array<Sentdm::Models::TemplateUpdateParams::Definition::Body::SMS::Variable>, nil]
            optional :variables,
                     -> {
                       Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateUpdateParams::Definition::Body::SMS::Variable]
                     },
                     nil?: true

            # @!method initialize(template:, type: nil, variables: nil)
            #   SMS-specific content that overrides multi-channel content for SMS messages
            #
            #   @param template [String]
            #   @param type [String, nil]
            #   @param variables [Array<Sentdm::Models::TemplateUpdateParams::Definition::Body::SMS::Variable>, nil]

            class Variable < Sentdm::Internal::Type::BaseModel
              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!attribute props
              #
              #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body::SMS::Variable::Props]
              required :props, -> { Sentdm::TemplateUpdateParams::Definition::Body::SMS::Variable::Props }

              # @!attribute type
              #
              #   @return [String]
              required :type, String

              # @!attribute id
              #
              #   @return [Integer, nil]
              optional :id, Integer

              # @!method initialize(name:, props:, type:, id: nil)
              #   @param name [String]
              #   @param props [Sentdm::Models::TemplateUpdateParams::Definition::Body::SMS::Variable::Props]
              #   @param type [String]
              #   @param id [Integer]

              # @see Sentdm::Models::TemplateUpdateParams::Definition::Body::SMS::Variable#props
              class Props < Sentdm::Internal::Type::BaseModel
                # @!attribute media_type
                #
                #   @return [String]
                required :media_type, String, api_name: :mediaType

                # @!attribute sample
                #
                #   @return [String]
                required :sample, String

                # @!attribute url
                #
                #   @return [String]
                required :url, String

                # @!attribute variable_type
                #
                #   @return [String]
                required :variable_type, String, api_name: :variableType

                # @!attribute alt
                #
                #   @return [String, nil]
                optional :alt, String, nil?: true

                # @!attribute regex
                #
                #   @return [String, nil]
                optional :regex, String, nil?: true

                # @!attribute short_url
                #
                #   @return [String, nil]
                optional :short_url, String, api_name: :shortUrl, nil?: true

                # @!method initialize(media_type:, sample:, url:, variable_type:, alt: nil, regex: nil, short_url: nil)
                #   @param media_type [String]
                #   @param sample [String]
                #   @param url [String]
                #   @param variable_type [String]
                #   @param alt [String, nil]
                #   @param regex [String, nil]
                #   @param short_url [String, nil]
              end
            end
          end

          # @see Sentdm::Models::TemplateUpdateParams::Definition::Body#whatsapp
          class Whatsapp < Sentdm::Internal::Type::BaseModel
            # @!attribute template
            #
            #   @return [String]
            required :template, String

            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String, nil?: true

            # @!attribute variables
            #
            #   @return [Array<Sentdm::Models::TemplateUpdateParams::Definition::Body::Whatsapp::Variable>, nil]
            optional :variables,
                     -> {
                       Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateUpdateParams::Definition::Body::Whatsapp::Variable]
                     },
                     nil?: true

            # @!method initialize(template:, type: nil, variables: nil)
            #   WhatsApp-specific content that overrides multi-channel content for WhatsApp
            #   messages
            #
            #   @param template [String]
            #   @param type [String, nil]
            #   @param variables [Array<Sentdm::Models::TemplateUpdateParams::Definition::Body::Whatsapp::Variable>, nil]

            class Variable < Sentdm::Internal::Type::BaseModel
              # @!attribute name
              #
              #   @return [String]
              required :name, String

              # @!attribute props
              #
              #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Body::Whatsapp::Variable::Props]
              required :props, -> { Sentdm::TemplateUpdateParams::Definition::Body::Whatsapp::Variable::Props }

              # @!attribute type
              #
              #   @return [String]
              required :type, String

              # @!attribute id
              #
              #   @return [Integer, nil]
              optional :id, Integer

              # @!method initialize(name:, props:, type:, id: nil)
              #   @param name [String]
              #   @param props [Sentdm::Models::TemplateUpdateParams::Definition::Body::Whatsapp::Variable::Props]
              #   @param type [String]
              #   @param id [Integer]

              # @see Sentdm::Models::TemplateUpdateParams::Definition::Body::Whatsapp::Variable#props
              class Props < Sentdm::Internal::Type::BaseModel
                # @!attribute media_type
                #
                #   @return [String]
                required :media_type, String, api_name: :mediaType

                # @!attribute sample
                #
                #   @return [String]
                required :sample, String

                # @!attribute url
                #
                #   @return [String]
                required :url, String

                # @!attribute variable_type
                #
                #   @return [String]
                required :variable_type, String, api_name: :variableType

                # @!attribute alt
                #
                #   @return [String, nil]
                optional :alt, String, nil?: true

                # @!attribute regex
                #
                #   @return [String, nil]
                optional :regex, String, nil?: true

                # @!attribute short_url
                #
                #   @return [String, nil]
                optional :short_url, String, api_name: :shortUrl, nil?: true

                # @!method initialize(media_type:, sample:, url:, variable_type:, alt: nil, regex: nil, short_url: nil)
                #   @param media_type [String]
                #   @param sample [String]
                #   @param url [String]
                #   @param variable_type [String]
                #   @param alt [String, nil]
                #   @param regex [String, nil]
                #   @param short_url [String, nil]
              end
            end
          end
        end

        # @see Sentdm::Models::TemplateUpdateParams::Definition#authentication_config
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
          #   {Sentdm::Models::TemplateUpdateParams::Definition::AuthenticationConfig} for
          #   more details.
          #
          #   Configuration for AUTHENTICATION category templates
          #
          #   @param add_security_recommendation [Boolean] Whether to add the security recommendation text: "For your security, do not shar
          #
          #   @param code_expiration_minutes [Integer, nil] Code expiration time in minutes (1-90). If set, adds footer: "This code expires
        end

        class Button < Sentdm::Internal::Type::BaseModel
          # @!attribute props
          #   Properties specific to the button type
          #
          #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Button::Props]
          required :props, -> { Sentdm::TemplateUpdateParams::Definition::Button::Props }

          # @!attribute type
          #   The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
          #
          #   @return [String]
          required :type, String

          # @!attribute id
          #   The unique identifier of the button (1-based index)
          #
          #   @return [Integer, nil]
          optional :id, Integer

          # @!method initialize(props:, type:, id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::TemplateUpdateParams::Definition::Button} for more details.
          #
          #   Interactive button in a message template
          #
          #   @param props [Sentdm::Models::TemplateUpdateParams::Definition::Button::Props] Properties specific to the button type
          #
          #   @param type [String] The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
          #
          #   @param id [Integer] The unique identifier of the button (1-based index)

          # @see Sentdm::Models::TemplateUpdateParams::Definition::Button#props
          class Props < Sentdm::Internal::Type::BaseModel
            # @!attribute active_for
            #
            #   @return [Integer]
            required :active_for, Integer, api_name: :activeFor

            # @!attribute country_code
            #
            #   @return [String]
            required :country_code, String, api_name: :countryCode

            # @!attribute offer_code
            #
            #   @return [String]
            required :offer_code, String, api_name: :offerCode

            # @!attribute phone_number
            #
            #   @return [String]
            required :phone_number, String, api_name: :phoneNumber

            # @!attribute quick_reply_type
            #
            #   @return [String]
            required :quick_reply_type, String, api_name: :quickReplyType

            # @!attribute text
            #
            #   @return [String]
            required :text, String

            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute url_type
            #
            #   @return [String]
            required :url_type, String, api_name: :urlType

            # @!attribute autofill_text
            #
            #   @return [String, nil]
            optional :autofill_text, String, api_name: :autofillText, nil?: true

            # @!attribute otp_type
            #
            #   @return [String, nil]
            optional :otp_type, String, api_name: :otpType, nil?: true

            # @!attribute package_name
            #
            #   @return [String, nil]
            optional :package_name, String, api_name: :packageName, nil?: true

            # @!attribute signature_hash
            #
            #   @return [String, nil]
            optional :signature_hash, String, api_name: :signatureHash, nil?: true

            # @!method initialize(active_for:, country_code:, offer_code:, phone_number:, quick_reply_type:, text:, url:, url_type:, autofill_text: nil, otp_type: nil, package_name: nil, signature_hash: nil)
            #   Properties specific to the button type
            #
            #   @param active_for [Integer]
            #   @param country_code [String]
            #   @param offer_code [String]
            #   @param phone_number [String]
            #   @param quick_reply_type [String]
            #   @param text [String]
            #   @param url [String]
            #   @param url_type [String]
            #   @param autofill_text [String, nil]
            #   @param otp_type [String, nil]
            #   @param package_name [String, nil]
            #   @param signature_hash [String, nil]
          end
        end

        # @see Sentdm::Models::TemplateUpdateParams::Definition#footer
        class Footer < Sentdm::Internal::Type::BaseModel
          # @!attribute template
          #   The footer template text with optional variable placeholders
          #
          #   @return [String]
          required :template, String

          # @!attribute type
          #   The type of footer (typically "text")
          #
          #   @return [String, nil]
          optional :type, String, nil?: true

          # @!attribute variables
          #   List of variables used in the footer template
          #
          #   @return [Array<Sentdm::Models::TemplateUpdateParams::Definition::Footer::Variable>, nil]
          optional :variables,
                   -> {
                     Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateUpdateParams::Definition::Footer::Variable]
                   },
                   nil?: true

          # @!method initialize(template:, type: nil, variables: nil)
          #   Footer section of a message template
          #
          #   @param template [String] The footer template text with optional variable placeholders
          #
          #   @param type [String, nil] The type of footer (typically "text")
          #
          #   @param variables [Array<Sentdm::Models::TemplateUpdateParams::Definition::Footer::Variable>, nil] List of variables used in the footer template

          class Variable < Sentdm::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute props
            #
            #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Footer::Variable::Props]
            required :props, -> { Sentdm::TemplateUpdateParams::Definition::Footer::Variable::Props }

            # @!attribute type
            #
            #   @return [String]
            required :type, String

            # @!attribute id
            #
            #   @return [Integer, nil]
            optional :id, Integer

            # @!method initialize(name:, props:, type:, id: nil)
            #   @param name [String]
            #   @param props [Sentdm::Models::TemplateUpdateParams::Definition::Footer::Variable::Props]
            #   @param type [String]
            #   @param id [Integer]

            # @see Sentdm::Models::TemplateUpdateParams::Definition::Footer::Variable#props
            class Props < Sentdm::Internal::Type::BaseModel
              # @!attribute media_type
              #
              #   @return [String]
              required :media_type, String, api_name: :mediaType

              # @!attribute sample
              #
              #   @return [String]
              required :sample, String

              # @!attribute url
              #
              #   @return [String]
              required :url, String

              # @!attribute variable_type
              #
              #   @return [String]
              required :variable_type, String, api_name: :variableType

              # @!attribute alt
              #
              #   @return [String, nil]
              optional :alt, String, nil?: true

              # @!attribute regex
              #
              #   @return [String, nil]
              optional :regex, String, nil?: true

              # @!attribute short_url
              #
              #   @return [String, nil]
              optional :short_url, String, api_name: :shortUrl, nil?: true

              # @!method initialize(media_type:, sample:, url:, variable_type:, alt: nil, regex: nil, short_url: nil)
              #   @param media_type [String]
              #   @param sample [String]
              #   @param url [String]
              #   @param variable_type [String]
              #   @param alt [String, nil]
              #   @param regex [String, nil]
              #   @param short_url [String, nil]
            end
          end
        end

        # @see Sentdm::Models::TemplateUpdateParams::Definition#header
        class Header < Sentdm::Internal::Type::BaseModel
          # @!attribute template
          #   The header template text with optional variable placeholders (e.g., "Welcome to
          #   {{0:variable}}")
          #
          #   @return [String]
          required :template, String

          # @!attribute type
          #   The type of header (e.g., "text", "image", "video", "document")
          #
          #   @return [String, nil]
          optional :type, String, nil?: true

          # @!attribute variables
          #   List of variables used in the header template
          #
          #   @return [Array<Sentdm::Models::TemplateUpdateParams::Definition::Header::Variable>, nil]
          optional :variables,
                   -> {
                     Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateUpdateParams::Definition::Header::Variable]
                   },
                   nil?: true

          # @!method initialize(template:, type: nil, variables: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::TemplateUpdateParams::Definition::Header} for more details.
          #
          #   Header section of a message template
          #
          #   @param template [String] The header template text with optional variable placeholders (e.g., "Welcome to
          #
          #   @param type [String, nil] The type of header (e.g., "text", "image", "video", "document")
          #
          #   @param variables [Array<Sentdm::Models::TemplateUpdateParams::Definition::Header::Variable>, nil] List of variables used in the header template

          class Variable < Sentdm::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute props
            #
            #   @return [Sentdm::Models::TemplateUpdateParams::Definition::Header::Variable::Props]
            required :props, -> { Sentdm::TemplateUpdateParams::Definition::Header::Variable::Props }

            # @!attribute type
            #
            #   @return [String]
            required :type, String

            # @!attribute id
            #
            #   @return [Integer, nil]
            optional :id, Integer

            # @!method initialize(name:, props:, type:, id: nil)
            #   @param name [String]
            #   @param props [Sentdm::Models::TemplateUpdateParams::Definition::Header::Variable::Props]
            #   @param type [String]
            #   @param id [Integer]

            # @see Sentdm::Models::TemplateUpdateParams::Definition::Header::Variable#props
            class Props < Sentdm::Internal::Type::BaseModel
              # @!attribute media_type
              #
              #   @return [String]
              required :media_type, String, api_name: :mediaType

              # @!attribute sample
              #
              #   @return [String]
              required :sample, String

              # @!attribute url
              #
              #   @return [String]
              required :url, String

              # @!attribute variable_type
              #
              #   @return [String]
              required :variable_type, String, api_name: :variableType

              # @!attribute alt
              #
              #   @return [String, nil]
              optional :alt, String, nil?: true

              # @!attribute regex
              #
              #   @return [String, nil]
              optional :regex, String, nil?: true

              # @!attribute short_url
              #
              #   @return [String, nil]
              optional :short_url, String, api_name: :shortUrl, nil?: true

              # @!method initialize(media_type:, sample:, url:, variable_type:, alt: nil, regex: nil, short_url: nil)
              #   @param media_type [String]
              #   @param sample [String]
              #   @param url [String]
              #   @param variable_type [String]
              #   @param alt [String, nil]
              #   @param regex [String, nil]
              #   @param short_url [String, nil]
            end
          end
        end
      end
    end
  end
end
