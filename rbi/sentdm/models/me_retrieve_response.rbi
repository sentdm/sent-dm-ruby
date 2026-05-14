# typed: strong

module Sentdm
  module Models
    class MeRetrieveResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::MeRetrieveResponse, Sentdm::Internal::AnyHash)
        end

      # Account response for GET /v3/me endpoint. Returns organization (with profiles),
      # user (standalone), or profile (child of an organization) data depending on the
      # API key type. Always includes messaging channel configuration.
      sig { returns(T.nilable(Sentdm::Models::MeRetrieveResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::MeRetrieveResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::MeRetrieveResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(Sentdm::Models::MeRetrieveResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::MeRetrieveResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::MeRetrieveResponse::Meta::OrHash).void
      end
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(Sentdm::Models::MeRetrieveResponse::Data::OrHash),
          error: T.nilable(Sentdm::Models::MeRetrieveResponse::Error::OrHash),
          meta: Sentdm::Models::MeRetrieveResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Account response for GET /v3/me endpoint. Returns organization (with profiles),
        # user (standalone), or profile (child of an organization) data depending on the
        # API key type. Always includes messaging channel configuration.
        data: nil,
        # Error information
        error: nil,
        # Request and response metadata
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(Sentdm::Models::MeRetrieveResponse::Data),
            error: T.nilable(Sentdm::Models::MeRetrieveResponse::Error),
            meta: Sentdm::Models::MeRetrieveResponse::Meta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::MeRetrieveResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # Customer ID (organization, account, or profile)
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # Messaging channel configuration. All three channels are always present. Each
        # channel has a "configured" flag; configured channels expose additional details.
        sig do
          returns(T.nilable(Sentdm::Models::MeRetrieveResponse::Data::Channels))
        end
        attr_reader :channels

        sig do
          params(
            channels: Sentdm::Models::MeRetrieveResponse::Data::Channels::OrHash
          ).void
        end
        attr_writer :channels

        # When the account was created
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        # Account description
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Contact email address
        sig { returns(T.nilable(String)) }
        attr_accessor :email

        # Account icon URL
        sig { returns(T.nilable(String)) }
        attr_accessor :icon

        # Account name
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Organization ID (only for profile type — the parent organization)
        sig { returns(T.nilable(String)) }
        attr_accessor :organization_id

        # List of profiles (populated for organization type, empty for user and profile
        # types)
        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::Models::MeRetrieveResponse::Data::Profile]
            )
          )
        end
        attr_reader :profiles

        sig do
          params(
            profiles:
              T::Array[
                Sentdm::Models::MeRetrieveResponse::Data::Profile::OrHash
              ]
          ).void
        end
        attr_writer :profiles

        # Profile configuration settings
        sig do
          returns(T.nilable(Sentdm::Models::MeRetrieveResponse::Data::Settings))
        end
        attr_reader :settings

        sig do
          params(
            settings:
              T.nilable(
                Sentdm::Models::MeRetrieveResponse::Data::Settings::OrHash
              )
          ).void
        end
        attr_writer :settings

        # Short name / abbreviation (only for profile type)
        sig { returns(T.nilable(String)) }
        attr_accessor :short_name

        # Profile status (only for profile type): incomplete, pending_review, approved,
        # etc.
        sig { returns(T.nilable(String)) }
        attr_accessor :status

        # Account type: "organization" (has profiles), "user" (no profiles), or "profile"
        # (child of an organization)
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # Account response for GET /v3/me endpoint. Returns organization (with profiles),
        # user (standalone), or profile (child of an organization) data depending on the
        # API key type. Always includes messaging channel configuration.
        sig do
          params(
            id: String,
            channels:
              Sentdm::Models::MeRetrieveResponse::Data::Channels::OrHash,
            created_at: Time,
            description: T.nilable(String),
            email: T.nilable(String),
            icon: T.nilable(String),
            name: String,
            organization_id: T.nilable(String),
            profiles:
              T::Array[
                Sentdm::Models::MeRetrieveResponse::Data::Profile::OrHash
              ],
            settings:
              T.nilable(
                Sentdm::Models::MeRetrieveResponse::Data::Settings::OrHash
              ),
            short_name: T.nilable(String),
            status: T.nilable(String),
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Customer ID (organization, account, or profile)
          id: nil,
          # Messaging channel configuration. All three channels are always present. Each
          # channel has a "configured" flag; configured channels expose additional details.
          channels: nil,
          # When the account was created
          created_at: nil,
          # Account description
          description: nil,
          # Contact email address
          email: nil,
          # Account icon URL
          icon: nil,
          # Account name
          name: nil,
          # Organization ID (only for profile type — the parent organization)
          organization_id: nil,
          # List of profiles (populated for organization type, empty for user and profile
          # types)
          profiles: nil,
          # Profile configuration settings
          settings: nil,
          # Short name / abbreviation (only for profile type)
          short_name: nil,
          # Profile status (only for profile type): incomplete, pending_review, approved,
          # etc.
          status: nil,
          # Account type: "organization" (has profiles), "user" (no profiles), or "profile"
          # (child of an organization)
          type: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              channels: Sentdm::Models::MeRetrieveResponse::Data::Channels,
              created_at: Time,
              description: T.nilable(String),
              email: T.nilable(String),
              icon: T.nilable(String),
              name: String,
              organization_id: T.nilable(String),
              profiles:
                T::Array[Sentdm::Models::MeRetrieveResponse::Data::Profile],
              settings:
                T.nilable(Sentdm::Models::MeRetrieveResponse::Data::Settings),
              short_name: T.nilable(String),
              status: T.nilable(String),
              type: String
            }
          )
        end
        def to_hash
        end

        class Channels < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::MeRetrieveResponse::Data::Channels,
                Sentdm::Internal::AnyHash
              )
            end

          # RCS channel configuration. When configured, includes the RCS phone number.
          sig do
            returns(
              T.nilable(Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs)
            )
          end
          attr_reader :rcs

          sig do
            params(
              rcs:
                Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs::OrHash
            ).void
          end
          attr_writer :rcs

          # SMS channel configuration. When configured, includes the sending phone number.
          sig do
            returns(
              T.nilable(Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS)
            )
          end
          attr_reader :sms

          sig do
            params(
              sms:
                Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS::OrHash
            ).void
          end
          attr_writer :sms

          # WhatsApp Business channel configuration. When configured, includes the WhatsApp
          # phone number and business name.
          sig do
            returns(
              T.nilable(
                Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp
              )
            )
          end
          attr_reader :whatsapp

          sig do
            params(
              whatsapp:
                Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp::OrHash
            ).void
          end
          attr_writer :whatsapp

          # Messaging channel configuration. All three channels are always present. Each
          # channel has a "configured" flag; configured channels expose additional details.
          sig do
            params(
              rcs:
                Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs::OrHash,
              sms:
                Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS::OrHash,
              whatsapp:
                Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # RCS channel configuration. When configured, includes the RCS phone number.
            rcs: nil,
            # SMS channel configuration. When configured, includes the sending phone number.
            sms: nil,
            # WhatsApp Business channel configuration. When configured, includes the WhatsApp
            # phone number and business name.
            whatsapp: nil
          )
          end

          sig do
            override.returns(
              {
                rcs: Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs,
                sms: Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS,
                whatsapp:
                  Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp
              }
            )
          end
          def to_hash
          end

          class Rcs < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::MeRetrieveResponse::Data::Channels::Rcs,
                  Sentdm::Internal::AnyHash
                )
              end

            # Whether RCS is configured for this account
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :configured

            sig { params(configured: T::Boolean).void }
            attr_writer :configured

            # RCS-enabled phone number in E.164 format
            sig { returns(T.nilable(String)) }
            attr_accessor :phone_number

            # RCS channel configuration. When configured, includes the RCS phone number.
            sig do
              params(
                configured: T::Boolean,
                phone_number: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Whether RCS is configured for this account
              configured: nil,
              # RCS-enabled phone number in E.164 format
              phone_number: nil
            )
            end

            sig do
              override.returns(
                { configured: T::Boolean, phone_number: T.nilable(String) }
              )
            end
            def to_hash
            end
          end

          class SMS < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::MeRetrieveResponse::Data::Channels::SMS,
                  Sentdm::Internal::AnyHash
                )
              end

            # Whether SMS is configured for this account
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :configured

            sig { params(configured: T::Boolean).void }
            attr_writer :configured

            # Sending phone number in E.164 format
            sig { returns(T.nilable(String)) }
            attr_accessor :phone_number

            # SMS channel configuration. When configured, includes the sending phone number.
            sig do
              params(
                configured: T::Boolean,
                phone_number: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Whether SMS is configured for this account
              configured: nil,
              # Sending phone number in E.164 format
              phone_number: nil
            )
            end

            sig do
              override.returns(
                { configured: T::Boolean, phone_number: T.nilable(String) }
              )
            end
            def to_hash
            end
          end

          class Whatsapp < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::MeRetrieveResponse::Data::Channels::Whatsapp,
                  Sentdm::Internal::AnyHash
                )
              end

            # WhatsApp Business display name
            sig { returns(T.nilable(String)) }
            attr_accessor :business_name

            # Whether WhatsApp is configured for this account
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :configured

            sig { params(configured: T::Boolean).void }
            attr_writer :configured

            # WhatsApp phone number in E.164 format
            sig { returns(T.nilable(String)) }
            attr_accessor :phone_number

            # WhatsApp Business channel configuration. When configured, includes the WhatsApp
            # phone number and business name.
            sig do
              params(
                business_name: T.nilable(String),
                configured: T::Boolean,
                phone_number: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # WhatsApp Business display name
              business_name: nil,
              # Whether WhatsApp is configured for this account
              configured: nil,
              # WhatsApp phone number in E.164 format
              phone_number: nil
            )
            end

            sig do
              override.returns(
                {
                  business_name: T.nilable(String),
                  configured: T::Boolean,
                  phone_number: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end

        class Profile < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::MeRetrieveResponse::Data::Profile,
                Sentdm::Internal::AnyHash
              )
            end

          # Profile unique identifier
          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          # When the profile was created
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          # Profile description
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # Profile icon URL
          sig { returns(T.nilable(String)) }
          attr_accessor :icon

          # Profile name
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # User's role in this profile: admin, billing, developer (inherited from
          # organization if not explicitly set)
          sig { returns(T.nilable(String)) }
          attr_accessor :role

          # Profile configuration settings
          sig do
            returns(
              T.nilable(
                Sentdm::Models::MeRetrieveResponse::Data::Profile::Settings
              )
            )
          end
          attr_reader :settings

          sig do
            params(
              settings:
                Sentdm::Models::MeRetrieveResponse::Data::Profile::Settings::OrHash
            ).void
          end
          attr_writer :settings

          # Profile short name (abbreviation)
          sig { returns(T.nilable(String)) }
          attr_accessor :short_name

          # Profile setup status: incomplete, pending_review, approved, rejected
          sig { returns(T.nilable(String)) }
          attr_accessor :status

          # Profile (sender profile) response for v3 API
          sig do
            params(
              id: String,
              created_at: Time,
              description: T.nilable(String),
              icon: T.nilable(String),
              name: String,
              role: T.nilable(String),
              settings:
                Sentdm::Models::MeRetrieveResponse::Data::Profile::Settings::OrHash,
              short_name: T.nilable(String),
              status: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Profile unique identifier
            id: nil,
            # When the profile was created
            created_at: nil,
            # Profile description
            description: nil,
            # Profile icon URL
            icon: nil,
            # Profile name
            name: nil,
            # User's role in this profile: admin, billing, developer (inherited from
            # organization if not explicitly set)
            role: nil,
            # Profile configuration settings
            settings: nil,
            # Profile short name (abbreviation)
            short_name: nil,
            # Profile setup status: incomplete, pending_review, approved, rejected
            status: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                description: T.nilable(String),
                icon: T.nilable(String),
                name: String,
                role: T.nilable(String),
                settings:
                  Sentdm::Models::MeRetrieveResponse::Data::Profile::Settings,
                short_name: T.nilable(String),
                status: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class Settings < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::MeRetrieveResponse::Data::Profile::Settings,
                  Sentdm::Internal::AnyHash
                )
              end

            # Whether contacts are shared across profiles in the organization
            sig { returns(T.nilable(T::Boolean)) }
            attr_accessor :allow_contact_sharing

            # Whether templates are shared across profiles in the organization
            sig { returns(T.nilable(T::Boolean)) }
            attr_accessor :allow_template_sharing

            # Billing model: profile, organization, or profile_and_organization
            sig { returns(T.nilable(String)) }
            attr_accessor :billing_model

            # Whether this profile inherits contacts from the organization
            sig { returns(T.nilable(T::Boolean)) }
            attr_accessor :inherit_contacts

            # Whether this profile inherits TCR brand from the organization
            sig { returns(T.nilable(T::Boolean)) }
            attr_accessor :inherit_tcr_brand

            # Whether this profile inherits TCR campaign from the organization
            sig { returns(T.nilable(T::Boolean)) }
            attr_accessor :inherit_tcr_campaign

            # Whether this profile inherits templates from the organization
            sig { returns(T.nilable(T::Boolean)) }
            attr_accessor :inherit_templates

            # Profile configuration settings
            sig do
              params(
                allow_contact_sharing: T.nilable(T::Boolean),
                allow_template_sharing: T.nilable(T::Boolean),
                billing_model: T.nilable(String),
                inherit_contacts: T.nilable(T::Boolean),
                inherit_tcr_brand: T.nilable(T::Boolean),
                inherit_tcr_campaign: T.nilable(T::Boolean),
                inherit_templates: T.nilable(T::Boolean)
              ).returns(T.attached_class)
            end
            def self.new(
              # Whether contacts are shared across profiles in the organization
              allow_contact_sharing: nil,
              # Whether templates are shared across profiles in the organization
              allow_template_sharing: nil,
              # Billing model: profile, organization, or profile_and_organization
              billing_model: nil,
              # Whether this profile inherits contacts from the organization
              inherit_contacts: nil,
              # Whether this profile inherits TCR brand from the organization
              inherit_tcr_brand: nil,
              # Whether this profile inherits TCR campaign from the organization
              inherit_tcr_campaign: nil,
              # Whether this profile inherits templates from the organization
              inherit_templates: nil
            )
            end

            sig do
              override.returns(
                {
                  allow_contact_sharing: T.nilable(T::Boolean),
                  allow_template_sharing: T.nilable(T::Boolean),
                  billing_model: T.nilable(String),
                  inherit_contacts: T.nilable(T::Boolean),
                  inherit_tcr_brand: T.nilable(T::Boolean),
                  inherit_tcr_campaign: T.nilable(T::Boolean),
                  inherit_templates: T.nilable(T::Boolean)
                }
              )
            end
            def to_hash
            end
          end
        end

        class Settings < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::MeRetrieveResponse::Data::Settings,
                Sentdm::Internal::AnyHash
              )
            end

          # Whether contacts are shared across profiles in the organization
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :allow_contact_sharing

          # Whether templates are shared across profiles in the organization
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :allow_template_sharing

          # Billing model: profile, organization, or profile_and_organization
          sig { returns(T.nilable(String)) }
          attr_accessor :billing_model

          # Whether this profile inherits contacts from the organization
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :inherit_contacts

          # Whether this profile inherits TCR brand from the organization
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :inherit_tcr_brand

          # Whether this profile inherits TCR campaign from the organization
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :inherit_tcr_campaign

          # Whether this profile inherits templates from the organization
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :inherit_templates

          # Profile configuration settings
          sig do
            params(
              allow_contact_sharing: T.nilable(T::Boolean),
              allow_template_sharing: T.nilable(T::Boolean),
              billing_model: T.nilable(String),
              inherit_contacts: T.nilable(T::Boolean),
              inherit_tcr_brand: T.nilable(T::Boolean),
              inherit_tcr_campaign: T.nilable(T::Boolean),
              inherit_templates: T.nilable(T::Boolean)
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether contacts are shared across profiles in the organization
            allow_contact_sharing: nil,
            # Whether templates are shared across profiles in the organization
            allow_template_sharing: nil,
            # Billing model: profile, organization, or profile_and_organization
            billing_model: nil,
            # Whether this profile inherits contacts from the organization
            inherit_contacts: nil,
            # Whether this profile inherits TCR brand from the organization
            inherit_tcr_brand: nil,
            # Whether this profile inherits TCR campaign from the organization
            inherit_tcr_campaign: nil,
            # Whether this profile inherits templates from the organization
            inherit_templates: nil
          )
          end

          sig do
            override.returns(
              {
                allow_contact_sharing: T.nilable(T::Boolean),
                allow_template_sharing: T.nilable(T::Boolean),
                billing_model: T.nilable(String),
                inherit_contacts: T.nilable(T::Boolean),
                inherit_tcr_brand: T.nilable(T::Boolean),
                inherit_tcr_campaign: T.nilable(T::Boolean),
                inherit_templates: T.nilable(T::Boolean)
              }
            )
          end
          def to_hash
          end
        end
      end

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::MeRetrieveResponse::Error,
              Sentdm::Internal::AnyHash
            )
          end

        # Machine-readable error code (e.g., "RESOURCE_001")
        sig { returns(T.nilable(String)) }
        attr_reader :code

        sig { params(code: String).void }
        attr_writer :code

        # Additional validation error details (field-level errors)
        sig { returns(T.nilable(T::Hash[Symbol, T::Array[String]])) }
        attr_accessor :details

        # URL to documentation about this error
        sig { returns(T.nilable(String)) }
        attr_accessor :doc_url

        # Human-readable error message
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        # Error information
        sig do
          params(
            code: String,
            details: T.nilable(T::Hash[Symbol, T::Array[String]]),
            doc_url: T.nilable(String),
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Machine-readable error code (e.g., "RESOURCE_001")
          code: nil,
          # Additional validation error details (field-level errors)
          details: nil,
          # URL to documentation about this error
          doc_url: nil,
          # Human-readable error message
          message: nil
        )
        end

        sig do
          override.returns(
            {
              code: String,
              details: T.nilable(T::Hash[Symbol, T::Array[String]]),
              doc_url: T.nilable(String),
              message: String
            }
          )
        end
        def to_hash
        end
      end

      class Meta < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::MeRetrieveResponse::Meta,
              Sentdm::Internal::AnyHash
            )
          end

        # Unique identifier for this request (for tracing and support)
        sig { returns(T.nilable(String)) }
        attr_reader :request_id

        sig { params(request_id: String).void }
        attr_writer :request_id

        # Server timestamp when the response was generated
        sig { returns(T.nilable(Time)) }
        attr_reader :timestamp

        sig { params(timestamp: Time).void }
        attr_writer :timestamp

        # API version used for this request
        sig { returns(T.nilable(String)) }
        attr_reader :version

        sig { params(version: String).void }
        attr_writer :version

        # Request and response metadata
        sig do
          params(request_id: String, timestamp: Time, version: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Unique identifier for this request (for tracing and support)
          request_id: nil,
          # Server timestamp when the response was generated
          timestamp: nil,
          # API version used for this request
          version: nil
        )
        end

        sig do
          override.returns(
            { request_id: String, timestamp: Time, version: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
