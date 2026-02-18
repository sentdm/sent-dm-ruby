# typed: strong

module SentDm
  module Models
    class MeRetrieveResponse < SentDm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SentDm::Models::MeRetrieveResponse, SentDm::Internal::AnyHash)
        end

      # The response data (null if error)
      sig { returns(T.nilable(SentDm::Models::MeRetrieveResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(SentDm::Models::MeRetrieveResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error details (null if successful)
      sig { returns(T.nilable(SentDm::APIError)) }
      attr_reader :error

      sig { params(error: T.nilable(SentDm::APIError::OrHash)).void }
      attr_writer :error

      # Metadata about the request and response
      sig { returns(T.nilable(SentDm::APIMeta)) }
      attr_reader :meta

      sig { params(meta: SentDm::APIMeta::OrHash).void }
      attr_writer :meta

      # Indicates whether the request was successful
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :success

      sig { params(success: T::Boolean).void }
      attr_writer :success

      # Standard API response envelope for all v3 endpoints
      sig do
        params(
          data: T.nilable(SentDm::Models::MeRetrieveResponse::Data::OrHash),
          error: T.nilable(SentDm::APIError::OrHash),
          meta: SentDm::APIMeta::OrHash,
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
            data: T.nilable(SentDm::Models::MeRetrieveResponse::Data),
            error: T.nilable(SentDm::APIError),
            meta: SentDm::APIMeta,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < SentDm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SentDm::Models::MeRetrieveResponse::Data,
              SentDm::Internal::AnyHash
            )
          end

        # Customer ID (organization or profile)
        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        # When the account was created
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        # Account description
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Account icon URL
        sig { returns(T.nilable(String)) }
        attr_accessor :icon

        # Account name
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # List of profiles (only for organization type)
        sig do
          returns(
            T.nilable(
              T::Array[SentDm::Models::MeRetrieveResponse::Data::Profile]
            )
          )
        end
        attr_accessor :profiles

        # Profile settings (only for profile type)
        sig { returns(T.nilable(SentDm::ProfileSettings)) }
        attr_reader :settings

        sig do
          params(settings: T.nilable(SentDm::ProfileSettings::OrHash)).void
        end
        attr_writer :settings

        # Profile status (only for profile type): incomplete, pending_review, approved,
        # etc.
        sig { returns(T.nilable(String)) }
        attr_accessor :status

        # The response data (null if error)
        sig do
          params(
            id: String,
            created_at: Time,
            description: T.nilable(String),
            icon: T.nilable(String),
            name: String,
            profiles:
              T.nilable(
                T::Array[
                  SentDm::Models::MeRetrieveResponse::Data::Profile::OrHash
                ]
              ),
            settings: T.nilable(SentDm::ProfileSettings::OrHash),
            status: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Customer ID (organization or profile)
          id: nil,
          # When the account was created
          created_at: nil,
          # Account description
          description: nil,
          # Account icon URL
          icon: nil,
          # Account name
          name: nil,
          # List of profiles (only for organization type)
          profiles: nil,
          # Profile settings (only for profile type)
          settings: nil,
          # Profile status (only for profile type): incomplete, pending_review, approved,
          # etc.
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
              profiles:
                T.nilable(
                  T::Array[SentDm::Models::MeRetrieveResponse::Data::Profile]
                ),
              settings: T.nilable(SentDm::ProfileSettings),
              status: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        class Profile < SentDm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                SentDm::Models::MeRetrieveResponse::Data::Profile,
                SentDm::Internal::AnyHash
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
          sig { returns(T.nilable(SentDm::ProfileSettings)) }
          attr_reader :settings

          sig { params(settings: SentDm::ProfileSettings::OrHash).void }
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
              settings: SentDm::ProfileSettings::OrHash,
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
                settings: SentDm::ProfileSettings,
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
