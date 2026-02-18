# typed: strong

module SentDm
  module Models
    class TemplateDefinition < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::TemplateDefinition, SentDm::Internal::AnyHash)
        end

      # Required template body with content for different channels (multi-channel,
      # SMS-specific, or WhatsApp-specific)
      sig { returns(SentDm::TemplateDefinition::Body) }
      attr_reader :body

      sig { params(body: SentDm::TemplateDefinition::Body::OrHash).void }
      attr_writer :body

      # Configuration specific to AUTHENTICATION category templates (optional)
      sig do
        returns(T.nilable(SentDm::TemplateDefinition::AuthenticationConfig))
      end
      attr_reader :authentication_config

      sig do
        params(
          authentication_config:
            T.nilable(SentDm::TemplateDefinition::AuthenticationConfig::OrHash)
        ).void
      end
      attr_writer :authentication_config

      # Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      sig { returns(T.nilable(T::Array[SentDm::TemplateDefinition::Button])) }
      attr_accessor :buttons

      # The version of the template definition format
      sig { returns(T.nilable(String)) }
      attr_accessor :definition_version

      # Optional template footer with optional variables
      sig { returns(T.nilable(SentDm::TemplateDefinition::Footer)) }
      attr_reader :footer

      sig do
        params(
          footer: T.nilable(SentDm::TemplateDefinition::Footer::OrHash)
        ).void
      end
      attr_writer :footer

      # Optional template header with optional variables
      sig { returns(T.nilable(SentDm::TemplateDefinition::Header)) }
      attr_reader :header

      sig do
        params(
          header: T.nilable(SentDm::TemplateDefinition::Header::OrHash)
        ).void
      end
      attr_writer :header

      # Complete definition of a message template including header, body, footer, and
      # buttons
      sig do
        params(
          body: SentDm::TemplateDefinition::Body::OrHash,
          authentication_config:
            T.nilable(SentDm::TemplateDefinition::AuthenticationConfig::OrHash),
          buttons:
            T.nilable(T::Array[SentDm::TemplateDefinition::Button::OrHash]),
          definition_version: T.nilable(String),
          footer: T.nilable(SentDm::TemplateDefinition::Footer::OrHash),
          header: T.nilable(SentDm::TemplateDefinition::Header::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # Required template body with content for different channels (multi-channel,
        # SMS-specific, or WhatsApp-specific)
        body:,
        # Configuration specific to AUTHENTICATION category templates (optional)
        authentication_config: nil,
        # Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
        buttons: nil,
        # The version of the template definition format
        definition_version: nil,
        # Optional template footer with optional variables
        footer: nil,
        # Optional template header with optional variables
        header: nil
      )
      end

      sig do
        override.returns(
          {
            body: SentDm::TemplateDefinition::Body,
            authentication_config:
              T.nilable(SentDm::TemplateDefinition::AuthenticationConfig),
            buttons: T.nilable(T::Array[SentDm::TemplateDefinition::Button]),
            definition_version: T.nilable(String),
            footer: T.nilable(SentDm::TemplateDefinition::Footer),
            header: T.nilable(SentDm::TemplateDefinition::Header)
          }
        )
      end
      def to_hash
      end

      class Body < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SentDm::TemplateDefinition::Body, SentDm::Internal::AnyHash)
          end

        # Content that will be used for all channels (SMS and WhatsApp) unless
        # channel-specific content is provided
        sig { returns(T.nilable(SentDm::TemplateBodyContent)) }
        attr_reader :multi_channel

        sig do
          params(
            multi_channel: T.nilable(SentDm::TemplateBodyContent::OrHash)
          ).void
        end
        attr_writer :multi_channel

        # SMS-specific content that overrides multi-channel content for SMS messages
        sig { returns(T.nilable(SentDm::TemplateBodyContent)) }
        attr_reader :sms

        sig { params(sms: T.nilable(SentDm::TemplateBodyContent::OrHash)).void }
        attr_writer :sms

        # WhatsApp-specific content that overrides multi-channel content for WhatsApp
        # messages
        sig { returns(T.nilable(SentDm::TemplateBodyContent)) }
        attr_reader :whatsapp

        sig do
          params(whatsapp: T.nilable(SentDm::TemplateBodyContent::OrHash)).void
        end
        attr_writer :whatsapp

        # Required template body with content for different channels (multi-channel,
        # SMS-specific, or WhatsApp-specific)
        sig do
          params(
            multi_channel: T.nilable(SentDm::TemplateBodyContent::OrHash),
            sms: T.nilable(SentDm::TemplateBodyContent::OrHash),
            whatsapp: T.nilable(SentDm::TemplateBodyContent::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Content that will be used for all channels (SMS and WhatsApp) unless
          # channel-specific content is provided
          multi_channel: nil,
          # SMS-specific content that overrides multi-channel content for SMS messages
          sms: nil,
          # WhatsApp-specific content that overrides multi-channel content for WhatsApp
          # messages
          whatsapp: nil
        )
        end

        sig do
          override.returns(
            {
              multi_channel: T.nilable(SentDm::TemplateBodyContent),
              sms: T.nilable(SentDm::TemplateBodyContent),
              whatsapp: T.nilable(SentDm::TemplateBodyContent)
            }
          )
        end
        def to_hash
        end
      end

      class AuthenticationConfig < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::TemplateDefinition::AuthenticationConfig,
              SentDm::Internal::AnyHash
            )
          end

        # Whether to add the security recommendation text: "For your security, do not
        # share this code."
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :add_security_recommendation

        sig { params(add_security_recommendation: T::Boolean).void }
        attr_writer :add_security_recommendation

        # Code expiration time in minutes (1-90). If set, adds footer: "This code expires
        # in X minutes."
        sig { returns(T.nilable(Integer)) }
        attr_accessor :code_expiration_minutes

        # Configuration specific to AUTHENTICATION category templates (optional)
        sig do
          params(
            add_security_recommendation: T::Boolean,
            code_expiration_minutes: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether to add the security recommendation text: "For your security, do not
          # share this code."
          add_security_recommendation: nil,
          # Code expiration time in minutes (1-90). If set, adds footer: "This code expires
          # in X minutes."
          code_expiration_minutes: nil
        )
        end

        sig do
          override.returns(
            {
              add_security_recommendation: T::Boolean,
              code_expiration_minutes: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class Button < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SentDm::TemplateDefinition::Button, SentDm::Internal::AnyHash)
          end

        # The unique identifier of the button (1-based index)
        sig { returns(T.nilable(Integer)) }
        attr_reader :id

        sig { params(id: Integer).void }
        attr_writer :id

        # Properties specific to the button type
        sig { returns(T.nilable(SentDm::TemplateDefinition::Button::Props)) }
        attr_reader :props

        sig do
          params(props: SentDm::TemplateDefinition::Button::Props::OrHash).void
        end
        attr_writer :props

        # The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # Interactive button in a message template
        sig do
          params(
            id: Integer,
            props: SentDm::TemplateDefinition::Button::Props::OrHash,
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique identifier of the button (1-based index)
          id: nil,
          # Properties specific to the button type
          props: nil,
          # The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
          type: nil
        )
        end

        sig do
          override.returns(
            {
              id: Integer,
              props: SentDm::TemplateDefinition::Button::Props,
              type: String
            }
          )
        end
        def to_hash
        end

        class Props < SentDm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SentDm::TemplateDefinition::Button::Props,
                SentDm::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_accessor :active_for

          sig { returns(T.nilable(String)) }
          attr_accessor :autofill_text

          sig { returns(T.nilable(String)) }
          attr_accessor :country_code

          sig { returns(T.nilable(String)) }
          attr_accessor :offer_code

          sig { returns(T.nilable(String)) }
          attr_accessor :otp_type

          sig { returns(T.nilable(String)) }
          attr_accessor :package_name

          sig { returns(T.nilable(String)) }
          attr_accessor :phone_number

          sig { returns(T.nilable(String)) }
          attr_accessor :quick_reply_type

          sig { returns(T.nilable(String)) }
          attr_accessor :signature_hash

          sig { returns(T.nilable(String)) }
          attr_accessor :text

          sig { returns(T.nilable(String)) }
          attr_accessor :url

          sig { returns(T.nilable(String)) }
          attr_accessor :url_type

          # Properties specific to the button type
          sig do
            params(
              active_for: T.nilable(Integer),
              autofill_text: T.nilable(String),
              country_code: T.nilable(String),
              offer_code: T.nilable(String),
              otp_type: T.nilable(String),
              package_name: T.nilable(String),
              phone_number: T.nilable(String),
              quick_reply_type: T.nilable(String),
              signature_hash: T.nilable(String),
              text: T.nilable(String),
              url: T.nilable(String),
              url_type: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            active_for: nil,
            autofill_text: nil,
            country_code: nil,
            offer_code: nil,
            otp_type: nil,
            package_name: nil,
            phone_number: nil,
            quick_reply_type: nil,
            signature_hash: nil,
            text: nil,
            url: nil,
            url_type: nil
          )
          end

          sig do
            override.returns(
              {
                active_for: T.nilable(Integer),
                autofill_text: T.nilable(String),
                country_code: T.nilable(String),
                offer_code: T.nilable(String),
                otp_type: T.nilable(String),
                package_name: T.nilable(String),
                phone_number: T.nilable(String),
                quick_reply_type: T.nilable(String),
                signature_hash: T.nilable(String),
                text: T.nilable(String),
                url: T.nilable(String),
                url_type: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end

      class Footer < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SentDm::TemplateDefinition::Footer, SentDm::Internal::AnyHash)
          end

        # The footer template text with optional variable placeholders
        sig { returns(T.nilable(String)) }
        attr_reader :template

        sig { params(template: String).void }
        attr_writer :template

        # The type of footer (typically "text")
        sig { returns(T.nilable(String)) }
        attr_accessor :type

        # List of variables used in the footer template
        sig { returns(T.nilable(T::Array[SentDm::TemplateVariable])) }
        attr_accessor :variables

        # Optional template footer with optional variables
        sig do
          params(
            template: String,
            type: T.nilable(String),
            variables: T.nilable(T::Array[SentDm::TemplateVariable::OrHash])
          ).returns(T.attached_class)
        end
        def self.new(
          # The footer template text with optional variable placeholders
          template: nil,
          # The type of footer (typically "text")
          type: nil,
          # List of variables used in the footer template
          variables: nil
        )
        end

        sig do
          override.returns(
            {
              template: String,
              type: T.nilable(String),
              variables: T.nilable(T::Array[SentDm::TemplateVariable])
            }
          )
        end
        def to_hash
        end
      end

      class Header < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SentDm::TemplateDefinition::Header, SentDm::Internal::AnyHash)
          end

        # The header template text with optional variable placeholders (e.g., "Welcome to
        # {{0:variable}}")
        sig { returns(T.nilable(String)) }
        attr_reader :template

        sig { params(template: String).void }
        attr_writer :template

        # The type of header (e.g., "text", "image", "video", "document")
        sig { returns(T.nilable(String)) }
        attr_accessor :type

        # List of variables used in the header template
        sig { returns(T.nilable(T::Array[SentDm::TemplateVariable])) }
        attr_accessor :variables

        # Optional template header with optional variables
        sig do
          params(
            template: String,
            type: T.nilable(String),
            variables: T.nilable(T::Array[SentDm::TemplateVariable::OrHash])
          ).returns(T.attached_class)
        end
        def self.new(
          # The header template text with optional variable placeholders (e.g., "Welcome to
          # {{0:variable}}")
          template: nil,
          # The type of header (e.g., "text", "image", "video", "document")
          type: nil,
          # List of variables used in the header template
          variables: nil
        )
        end

        sig do
          override.returns(
            {
              template: String,
              type: T.nilable(String),
              variables: T.nilable(T::Array[SentDm::TemplateVariable])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
