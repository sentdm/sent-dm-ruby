# typed: strong

module Sentdm
  module Models
    class MeRetrieveResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::MeRetrieveResponse, Sentdm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(Sentdm::Models::MeRetrieveResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::MeRetrieveResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error details (null if successful)
      sig { returns(T.nilable(Sentdm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(Sentdm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
      sig { returns(T.nilable(Sentdm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: Sentdm::APIMeta::OrHash).void }
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
          error: T.nilable(Sentdm::APIError::OrHash),
          meta: Sentdm::APIMeta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The response data (null if error)
        data: nil,
        # Error details (null if successful)
        error: nil,
        # Metadata about the request and response
        meta: nil,
        # Indicates whether the request was successful
        success: nil
      )
      end

      sig do
        override.returns(
          {
            data: T.nilable(Sentdm::Models::MeRetrieveResponse::Data),
            error: T.nilable(Sentdm::APIError),
            meta: Sentdm::APIMeta,
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

        # Messaging channel configuration
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

        # Profile settings (only for profile type)
        sig { returns(T.nilable(Sentdm::ProfileSettings)) }
        attr_reader :settings

        sig do
          params(settings: T.nilable(Sentdm::ProfileSettings::OrHash)).void
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

        # The response data (null if error)
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
            settings: T.nilable(Sentdm::ProfileSettings::OrHash),
            short_name: T.nilable(String),
            status: T.nilable(String),
            type: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Customer ID (organization, account, or profile)
          id: nil,
          # Messaging channel configuration
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
          # Profile settings (only for profile type)
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
              settings: T.nilable(Sentdm::ProfileSettings),
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

          # RCS channel (provider: vibes)
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

          # SMS channel (providers: telnyx, sinch)
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

          # WhatsApp Business channel (provider: meta)
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

          # Messaging channel configuration
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
            # RCS channel (provider: vibes)
            rcs: nil,
            # SMS channel (providers: telnyx, sinch)
            sms: nil,
            # WhatsApp Business channel (provider: meta)
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

            # RCS channel (provider: vibes)
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

            # SMS channel (providers: telnyx, sinch)
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

            # WhatsApp Business channel (provider: meta)
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
          sig { returns(T.nilable(Sentdm::ProfileSettings)) }
          attr_reader :settings

          sig { params(settings: Sentdm::ProfileSettings::OrHash).void }
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
              settings: Sentdm::ProfileSettings::OrHash,
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
                settings: Sentdm::ProfileSettings,
                short_name: T.nilable(String),
                status: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
