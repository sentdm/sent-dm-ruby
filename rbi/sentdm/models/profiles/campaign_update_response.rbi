# typed: strong

module Sentdm
  module Models
    module Profiles
      class CampaignUpdateResponse < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::Profiles::CampaignUpdateResponse,
              Sentdm::Internal::AnyHash
            )
          end

        # The response data (null if error)
        sig do
          returns(
            T.nilable(Sentdm::Models::Profiles::CampaignUpdateResponse::Data)
          )
        end
        attr_reader :data

        sig do
          params(
            data:
              T.nilable(
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::OrHash
              )
          ).void
        end
        attr_writer :data

        # Error information
        sig do
          returns(
            T.nilable(Sentdm::Models::Profiles::CampaignUpdateResponse::Error)
          )
        end
        attr_reader :error

        sig do
          params(
            error:
              T.nilable(
                Sentdm::Models::Profiles::CampaignUpdateResponse::Error::OrHash
              )
          ).void
        end
        attr_writer :error

        # Request and response metadata
        sig do
          returns(
            T.nilable(Sentdm::Models::Profiles::CampaignUpdateResponse::Meta)
          )
        end
        attr_reader :meta

        sig do
          params(
            meta: Sentdm::Models::Profiles::CampaignUpdateResponse::Meta::OrHash
          ).void
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
            data:
              T.nilable(
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::OrHash
              ),
            error:
              T.nilable(
                Sentdm::Models::Profiles::CampaignUpdateResponse::Error::OrHash
              ),
            meta:
              Sentdm::Models::Profiles::CampaignUpdateResponse::Meta::OrHash,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # The response data (null if error)
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
              data:
                T.nilable(
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data
                ),
              error:
                T.nilable(
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Error
                ),
              meta: Sentdm::Models::Profiles::CampaignUpdateResponse::Meta,
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
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data,
                Sentdm::Internal::AnyHash
              )
            end

          # Unique identifier
          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          sig { returns(T.nilable(Time)) }
          attr_accessor :billed_date

          sig { returns(T.nilable(String)) }
          attr_accessor :brand_id

          sig { returns(T.nilable(Float)) }
          attr_accessor :cost

          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          sig { returns(T.nilable(String)) }
          attr_accessor :csp_id

          sig { returns(T.nilable(String)) }
          attr_reader :customer_id

          sig { params(customer_id: String).void }
          attr_writer :customer_id

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :dca_elections_complete

          sig { params(dca_elections_complete: T::Boolean).void }
          attr_writer :dca_elections_complete

          sig { returns(T.nilable(Time)) }
          attr_accessor :dca_elections_completed_at

          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig { returns(T.nilable(String)) }
          attr_accessor :help_keywords

          sig { returns(T.nilable(String)) }
          attr_accessor :help_message

          sig { returns(T.nilable(String)) }
          attr_accessor :kyc_submission_form_id

          sig { returns(T.nilable(String)) }
          attr_accessor :message_flow

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { returns(T.nilable(String)) }
          attr_accessor :optin_keywords

          sig { returns(T.nilable(String)) }
          attr_accessor :optin_message

          sig { returns(T.nilable(String)) }
          attr_accessor :optout_keywords

          sig { returns(T.nilable(String)) }
          attr_accessor :optout_message

          sig { returns(T.nilable(String)) }
          attr_accessor :privacy_policy_link

          sig { returns(T.nilable(String)) }
          attr_accessor :reseller_id

          sig do
            returns(
              T.nilable(
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::SharingStatus::TaggedSymbol
              )
            )
          end
          attr_accessor :sharing_status

          sig do
            returns(
              T.nilable(
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::Status::TaggedSymbol
              )
            )
          end
          attr_accessor :status

          sig { returns(T.nilable(Time)) }
          attr_accessor :submitted_at

          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :submitted_to_tcr

          sig { params(submitted_to_tcr: T::Boolean).void }
          attr_writer :submitted_to_tcr

          sig { returns(T.nilable(String)) }
          attr_accessor :tcr_campaign_id

          sig { returns(T.nilable(String)) }
          attr_accessor :tcr_sync_error

          sig { returns(T.nilable(String)) }
          attr_accessor :telnyx_campaign_id

          sig { returns(T.nilable(String)) }
          attr_accessor :terms_and_conditions_link

          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          sig { returns(T.nilable(Time)) }
          attr_accessor :updated_at

          sig { returns(T.nilable(String)) }
          attr_accessor :upstream_cnp_id

          sig do
            returns(
              T.nilable(
                T::Array[
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase
                ]
              )
            )
          end
          attr_reader :use_cases

          sig do
            params(
              use_cases:
                T::Array[
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::OrHash
                ]
            ).void
          end
          attr_writer :use_cases

          # The response data (null if error)
          sig do
            params(
              id: String,
              billed_date: T.nilable(Time),
              brand_id: T.nilable(String),
              cost: T.nilable(Float),
              created_at: Time,
              csp_id: T.nilable(String),
              customer_id: String,
              dca_elections_complete: T::Boolean,
              dca_elections_completed_at: T.nilable(Time),
              description: String,
              help_keywords: T.nilable(String),
              help_message: T.nilable(String),
              kyc_submission_form_id: T.nilable(String),
              message_flow: T.nilable(String),
              name: String,
              optin_keywords: T.nilable(String),
              optin_message: T.nilable(String),
              optout_keywords: T.nilable(String),
              optout_message: T.nilable(String),
              privacy_policy_link: T.nilable(String),
              reseller_id: T.nilable(String),
              sharing_status:
                T.nilable(
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::SharingStatus::OrSymbol
                ),
              status:
                T.nilable(
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::Status::OrSymbol
                ),
              submitted_at: T.nilable(Time),
              submitted_to_tcr: T::Boolean,
              tcr_campaign_id: T.nilable(String),
              tcr_sync_error: T.nilable(String),
              telnyx_campaign_id: T.nilable(String),
              terms_and_conditions_link: T.nilable(String),
              type: String,
              updated_at: T.nilable(Time),
              upstream_cnp_id: T.nilable(String),
              use_cases:
                T::Array[
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier
            id: nil,
            billed_date: nil,
            brand_id: nil,
            cost: nil,
            created_at: nil,
            csp_id: nil,
            customer_id: nil,
            dca_elections_complete: nil,
            dca_elections_completed_at: nil,
            description: nil,
            help_keywords: nil,
            help_message: nil,
            kyc_submission_form_id: nil,
            message_flow: nil,
            name: nil,
            optin_keywords: nil,
            optin_message: nil,
            optout_keywords: nil,
            optout_message: nil,
            privacy_policy_link: nil,
            reseller_id: nil,
            sharing_status: nil,
            status: nil,
            submitted_at: nil,
            submitted_to_tcr: nil,
            tcr_campaign_id: nil,
            tcr_sync_error: nil,
            telnyx_campaign_id: nil,
            terms_and_conditions_link: nil,
            type: nil,
            updated_at: nil,
            upstream_cnp_id: nil,
            use_cases: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                billed_date: T.nilable(Time),
                brand_id: T.nilable(String),
                cost: T.nilable(Float),
                created_at: Time,
                csp_id: T.nilable(String),
                customer_id: String,
                dca_elections_complete: T::Boolean,
                dca_elections_completed_at: T.nilable(Time),
                description: String,
                help_keywords: T.nilable(String),
                help_message: T.nilable(String),
                kyc_submission_form_id: T.nilable(String),
                message_flow: T.nilable(String),
                name: String,
                optin_keywords: T.nilable(String),
                optin_message: T.nilable(String),
                optout_keywords: T.nilable(String),
                optout_message: T.nilable(String),
                privacy_policy_link: T.nilable(String),
                reseller_id: T.nilable(String),
                sharing_status:
                  T.nilable(
                    Sentdm::Models::Profiles::CampaignUpdateResponse::Data::SharingStatus::TaggedSymbol
                  ),
                status:
                  T.nilable(
                    Sentdm::Models::Profiles::CampaignUpdateResponse::Data::Status::TaggedSymbol
                  ),
                submitted_at: T.nilable(Time),
                submitted_to_tcr: T::Boolean,
                tcr_campaign_id: T.nilable(String),
                tcr_sync_error: T.nilable(String),
                telnyx_campaign_id: T.nilable(String),
                terms_and_conditions_link: T.nilable(String),
                type: String,
                updated_at: T.nilable(Time),
                upstream_cnp_id: T.nilable(String),
                use_cases:
                  T::Array[
                    Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase
                  ]
              }
            )
          end
          def to_hash
          end

          module SharingStatus
            extend Sentdm::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::SharingStatus
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PENDING =
              T.let(
                :PENDING,
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::SharingStatus::TaggedSymbol
              )
            ACCEPTED =
              T.let(
                :ACCEPTED,
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::SharingStatus::TaggedSymbol
              )
            DECLINED =
              T.let(
                :DECLINED,
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::SharingStatus::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::SharingStatus::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Status
            extend Sentdm::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SENT_CREATED =
              T.let(
                :SENT_CREATED,
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::Status::TaggedSymbol
              )
            ACTIVE =
              T.let(
                :ACTIVE,
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::Status::TaggedSymbol
              )
            EXPIRED =
              T.let(
                :EXPIRED,
                Sentdm::Models::Profiles::CampaignUpdateResponse::Data::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class UseCase < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase,
                  Sentdm::Internal::AnyHash
                )
              end

            # Unique identifier
            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            sig { returns(T.nilable(String)) }
            attr_reader :campaign_id

            sig { params(campaign_id: String).void }
            attr_writer :campaign_id

            sig { returns(T.nilable(Time)) }
            attr_reader :created_at

            sig { params(created_at: Time).void }
            attr_writer :created_at

            sig { returns(T.nilable(String)) }
            attr_reader :customer_id

            sig { params(customer_id: String).void }
            attr_writer :customer_id

            sig do
              returns(
                T.nilable(
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              )
            end
            attr_reader :messaging_use_case_us

            sig do
              params(
                messaging_use_case_us:
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::OrSymbol
              ).void
            end
            attr_writer :messaging_use_case_us

            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :sample_messages

            sig { params(sample_messages: T::Array[String]).void }
            attr_writer :sample_messages

            sig { returns(T.nilable(Time)) }
            attr_accessor :updated_at

            sig do
              params(
                id: String,
                campaign_id: String,
                created_at: Time,
                customer_id: String,
                messaging_use_case_us:
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::OrSymbol,
                sample_messages: T::Array[String],
                updated_at: T.nilable(Time)
              ).returns(T.attached_class)
            end
            def self.new(
              # Unique identifier
              id: nil,
              campaign_id: nil,
              created_at: nil,
              customer_id: nil,
              messaging_use_case_us: nil,
              sample_messages: nil,
              updated_at: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  campaign_id: String,
                  created_at: Time,
                  customer_id: String,
                  messaging_use_case_us:
                    Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol,
                  sample_messages: T::Array[String],
                  updated_at: T.nilable(Time)
                }
              )
            end
            def to_hash
            end

            module MessagingUseCaseUs
              extend Sentdm::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MARKETING =
                T.let(
                  :MARKETING,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              ACCOUNT_NOTIFICATION =
                T.let(
                  :ACCOUNT_NOTIFICATION,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              CUSTOMER_CARE =
                T.let(
                  :CUSTOMER_CARE,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              FRAUD_ALERT =
                T.let(
                  :FRAUD_ALERT,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              TWO_FA =
                T.let(
                  :TWO_FA,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              DELIVERY_NOTIFICATION =
                T.let(
                  :DELIVERY_NOTIFICATION,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              SECURITY_ALERT =
                T.let(
                  :SECURITY_ALERT,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              M2_M =
                T.let(
                  :M2M,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              MIXED =
                T.let(
                  :MIXED,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              HIGHER_EDUCATION =
                T.let(
                  :HIGHER_EDUCATION,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              POLLING_VOTING =
                T.let(
                  :POLLING_VOTING,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              PUBLIC_SERVICE_ANNOUNCEMENT =
                T.let(
                  :PUBLIC_SERVICE_ANNOUNCEMENT,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )
              LOW_VOLUME =
                T.let(
                  :LOW_VOLUME,
                  Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Sentdm::Models::Profiles::CampaignUpdateResponse::Data::UseCase::MessagingUseCaseUs::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class Error < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::Profiles::CampaignUpdateResponse::Error,
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
                Sentdm::Models::Profiles::CampaignUpdateResponse::Meta,
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
            params(
              request_id: String,
              timestamp: Time,
              version: String
            ).returns(T.attached_class)
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
end
