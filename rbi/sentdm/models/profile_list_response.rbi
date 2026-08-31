# typed: strong

module Sentdm
  module Models
    class ProfileListResponse < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::Models::ProfileListResponse, Sentdm::Internal::AnyHash)
        end

      # The profiles in the organization.
      sig { returns(T.nilable(Sentdm::Models::ProfileListResponse::Data)) }
      attr_reader :data

      sig do
        params(
          data: T.nilable(Sentdm::Models::ProfileListResponse::Data::OrHash)
        ).void
      end
      attr_writer :data

      # Error information
      sig { returns(T.nilable(Sentdm::Models::ProfileListResponse::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(Sentdm::Models::ProfileListResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Request and response metadata
      sig { returns(T.nilable(Sentdm::Models::ProfileListResponse::Meta)) }
      attr_reader :meta

      sig do
        params(meta: Sentdm::Models::ProfileListResponse::Meta::OrHash).void
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
          data: T.nilable(Sentdm::Models::ProfileListResponse::Data::OrHash),
          error: T.nilable(Sentdm::Models::ProfileListResponse::Error::OrHash),
          meta: Sentdm::Models::ProfileListResponse::Meta::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The profiles in the organization.
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
            data: T.nilable(Sentdm::Models::ProfileListResponse::Data),
            error: T.nilable(Sentdm::Models::ProfileListResponse::Error),
            meta: Sentdm::Models::ProfileListResponse::Meta,
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
              Sentdm::Models::ProfileListResponse::Data,
              Sentdm::Internal::AnyHash
            )
          end

        # Pagination metadata for list responses
        sig do
          returns(
            T.nilable(Sentdm::Models::ProfileListResponse::Data::Pagination)
          )
        end
        attr_reader :pagination

        sig do
          params(
            pagination:
              Sentdm::Models::ProfileListResponse::Data::Pagination::OrHash
          ).void
        end
        attr_writer :pagination

        # The profiles on this page.
        sig do
          returns(
            T.nilable(
              T::Array[Sentdm::Models::ProfileListResponse::Data::Profile]
            )
          )
        end
        attr_reader :profiles

        sig do
          params(
            profiles:
              T::Array[
                Sentdm::Models::ProfileListResponse::Data::Profile::OrHash
              ]
          ).void
        end
        attr_writer :profiles

        # The profiles in the organization.
        sig do
          params(
            pagination:
              Sentdm::Models::ProfileListResponse::Data::Pagination::OrHash,
            profiles:
              T::Array[
                Sentdm::Models::ProfileListResponse::Data::Profile::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Pagination metadata for list responses
          pagination: nil,
          # The profiles on this page.
          profiles: nil
        )
        end

        sig do
          override.returns(
            {
              pagination: Sentdm::Models::ProfileListResponse::Data::Pagination,
              profiles:
                T::Array[Sentdm::Models::ProfileListResponse::Data::Profile]
            }
          )
        end
        def to_hash
        end

        class Pagination < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Models::ProfileListResponse::Data::Pagination,
                Sentdm::Internal::AnyHash
              )
            end

          # Cursor-based pagination. Never populated — see Cursors.
          sig do
            returns(
              T.nilable(
                Sentdm::Models::ProfileListResponse::Data::Pagination::Cursors
              )
            )
          end
          attr_reader :cursors

          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Pagination::Cursors::OrHash
                )
            ).void
          end
          attr_writer :cursors

          # Whether there are more pages after this one
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :has_more

          sig { params(has_more: T::Boolean).void }
          attr_writer :has_more

          # Current page number (1-indexed)
          sig { returns(T.nilable(Integer)) }
          attr_reader :page

          sig { params(page: Integer).void }
          attr_writer :page

          # Number of items per page
          sig { returns(T.nilable(Integer)) }
          attr_reader :page_size

          sig { params(page_size: Integer).void }
          attr_writer :page_size

          # Total number of items across all pages
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_count

          sig { params(total_count: Integer).void }
          attr_writer :total_count

          # Total number of pages
          sig { returns(T.nilable(Integer)) }
          attr_reader :total_pages

          sig { params(total_pages: Integer).void }
          attr_writer :total_pages

          # Pagination metadata for list responses
          sig do
            params(
              cursors:
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Pagination::Cursors::OrHash
                ),
              has_more: T::Boolean,
              page: Integer,
              page_size: Integer,
              total_count: Integer,
              total_pages: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Cursor-based pagination. Never populated — see Cursors.
            cursors: nil,
            # Whether there are more pages after this one
            has_more: nil,
            # Current page number (1-indexed)
            page: nil,
            # Number of items per page
            page_size: nil,
            # Total number of items across all pages
            total_count: nil,
            # Total number of pages
            total_pages: nil
          )
          end

          sig do
            override.returns(
              {
                cursors:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Pagination::Cursors
                  ),
                has_more: T::Boolean,
                page: Integer,
                page_size: Integer,
                total_count: Integer,
                total_pages: Integer
              }
            )
          end
          def to_hash
          end

          class Cursors < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::ProfileListResponse::Data::Pagination::Cursors,
                  Sentdm::Internal::AnyHash
                )
              end

            # Cursor to fetch the next page.
            sig { returns(T.nilable(String)) }
            attr_accessor :after

            # Cursor to fetch the previous page.
            sig { returns(T.nilable(String)) }
            attr_accessor :before

            # Cursor-based pagination. Never populated — see Cursors.
            sig do
              params(
                after: T.nilable(String),
                before: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Cursor to fetch the next page.
              after: nil,
              # Cursor to fetch the previous page.
              before: nil
            )
            end

            sig do
              override.returns(
                { after: T.nilable(String), before: T.nilable(String) }
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
                Sentdm::Models::ProfileListResponse::Data::Profile,
                Sentdm::Internal::AnyHash
              )
            end

          # Profile unique identifier
          sig { returns(T.nilable(String)) }
          attr_reader :id

          sig { params(id: String).void }
          attr_writer :id

          # Always false. A profile no longer shares contacts with sibling profiles — it
          # sees only what it owns. Retained so existing v3 clients reading
          # allow_contact_sharing keep deserializing; it carries no information.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :allow_contact_sharing

          # Whether number changes are allowed during onboarding
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :allow_number_change_during_onboarding

          # Always false. A profile no longer shares templates with sibling profiles.
          # Retained so existing v3 clients reading allow_template_sharing keep
          # deserializing; it carries no information.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :allow_template_sharing

          # Billing contact info returned in profile responses
          sig do
            returns(
              T.nilable(
                Sentdm::Models::ProfileListResponse::Data::Profile::BillingContact
              )
            )
          end
          attr_reader :billing_contact

          sig do
            params(
              billing_contact:
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::BillingContact::OrHash
                )
            ).void
          end
          attr_writer :billing_contact

          # Billing model: profile, organization, or profile_and_organization
          sig { returns(T.nilable(String)) }
          attr_reader :billing_model

          sig { params(billing_model: String).void }
          attr_writer :billing_model

          # Brand response with nested contact, business, and compliance sections — mirrors
          # the request structure.
          sig do
            returns(
              T.nilable(
                Sentdm::Models::ProfileListResponse::Data::Profile::Brand
              )
            )
          end
          attr_reader :brand

          sig do
            params(
              brand:
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::OrHash
                )
            ).void
          end
          attr_writer :brand

          # When the profile was created
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at

          sig { params(created_at: Time).void }
          attr_writer :created_at

          # Profile description
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # Profile email (inherited from organization)
          sig { returns(T.nilable(String)) }
          attr_accessor :email

          # Profile icon URL
          sig { returns(T.nilable(String)) }
          attr_accessor :icon

          # Always false. A profile no longer inherits its organization's contacts. Retained
          # so existing v3 clients reading inherit_contacts keep deserializing; it carries
          # no information.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :inherit_contacts

          # Whether this profile inherits TCR brand from the organization
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :inherit_tcr_brand

          sig { params(inherit_tcr_brand: T::Boolean).void }
          attr_writer :inherit_tcr_brand

          # Whether this profile inherits TCR campaign from the organization
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :inherit_tcr_campaign

          sig { params(inherit_tcr_campaign: T::Boolean).void }
          attr_writer :inherit_tcr_campaign

          # Always false. A profile no longer inherits its organization's templates.
          # Retained so existing v3 clients reading inherit_templates keep deserializing; it
          # carries no information.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :inherit_templates

          # Profile name
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Parent organization ID
          sig { returns(T.nilable(String)) }
          attr_accessor :organization_id

          # Direct SMS phone number
          sig { returns(T.nilable(String)) }
          attr_accessor :sending_phone_number

          # Deprecated. Always null. Sender borrowing is gone: a profile no longer points at
          # another profile for its SMS sender, and every profile owns the sender it sends
          # from.
          #
          # Kept on the wire, and never populated, because those are two different promises.
          # Removing the key changes the response's shape — a generated client loses the
          # property and stops compiling on the next regenerate, for a value that is now
          # null for every profile in existence. Keeping it null costs a key and breaks
          # nobody, and null is the honest answer rather than a placeholder: there is no
          # borrowing left to report.
          #
          # Nothing could populate it. Migration 260813161500 dropped the column and copied
          # each borrower its own channel-provider row; its Down() says outright that the
          # borrower-to-lender pairing is not recoverable. The only surviving trace is a
          # notes string on the copied row.
          sig { returns(T.nilable(String)) }
          attr_accessor :sending_phone_number_profile_id

          sig { returns(T.nilable(String)) }
          attr_accessor :sending_whatsapp_number_profile_id

          # Profile short name/abbreviation. 3–11 characters: letters, numbers, and spaces
          # only, with at least one letter.
          sig { returns(T.nilable(String)) }
          attr_accessor :short_name

          # Profile setup status: incomplete, pending_review, approved, rejected
          sig { returns(T.nilable(String)) }
          attr_reader :status

          sig { params(status: String).void }
          attr_writer :status

          # When the profile was last updated
          sig { returns(T.nilable(Time)) }
          attr_accessor :updated_at

          # WhatsApp Business Account ID associated with this profile. Present whether the
          # WABA is inherited from the organization or configured directly.
          sig { returns(T.nilable(String)) }
          attr_accessor :waba_id

          # Direct WhatsApp phone number
          sig { returns(T.nilable(String)) }
          attr_accessor :whatsapp_phone_number

          # Detailed profile response for v3 API
          sig do
            params(
              id: String,
              allow_contact_sharing: T.nilable(T::Boolean),
              allow_number_change_during_onboarding: T.nilable(T::Boolean),
              allow_template_sharing: T.nilable(T::Boolean),
              billing_contact:
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::BillingContact::OrHash
                ),
              billing_model: String,
              brand:
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::OrHash
                ),
              created_at: Time,
              description: T.nilable(String),
              email: T.nilable(String),
              icon: T.nilable(String),
              inherit_contacts: T.nilable(T::Boolean),
              inherit_tcr_brand: T::Boolean,
              inherit_tcr_campaign: T::Boolean,
              inherit_templates: T.nilable(T::Boolean),
              name: String,
              organization_id: T.nilable(String),
              sending_phone_number: T.nilable(String),
              sending_phone_number_profile_id: T.nilable(String),
              sending_whatsapp_number_profile_id: T.nilable(String),
              short_name: T.nilable(String),
              status: String,
              updated_at: T.nilable(Time),
              waba_id: T.nilable(String),
              whatsapp_phone_number: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Profile unique identifier
            id: nil,
            # Always false. A profile no longer shares contacts with sibling profiles — it
            # sees only what it owns. Retained so existing v3 clients reading
            # allow_contact_sharing keep deserializing; it carries no information.
            allow_contact_sharing: nil,
            # Whether number changes are allowed during onboarding
            allow_number_change_during_onboarding: nil,
            # Always false. A profile no longer shares templates with sibling profiles.
            # Retained so existing v3 clients reading allow_template_sharing keep
            # deserializing; it carries no information.
            allow_template_sharing: nil,
            # Billing contact info returned in profile responses
            billing_contact: nil,
            # Billing model: profile, organization, or profile_and_organization
            billing_model: nil,
            # Brand response with nested contact, business, and compliance sections — mirrors
            # the request structure.
            brand: nil,
            # When the profile was created
            created_at: nil,
            # Profile description
            description: nil,
            # Profile email (inherited from organization)
            email: nil,
            # Profile icon URL
            icon: nil,
            # Always false. A profile no longer inherits its organization's contacts. Retained
            # so existing v3 clients reading inherit_contacts keep deserializing; it carries
            # no information.
            inherit_contacts: nil,
            # Whether this profile inherits TCR brand from the organization
            inherit_tcr_brand: nil,
            # Whether this profile inherits TCR campaign from the organization
            inherit_tcr_campaign: nil,
            # Always false. A profile no longer inherits its organization's templates.
            # Retained so existing v3 clients reading inherit_templates keep deserializing; it
            # carries no information.
            inherit_templates: nil,
            # Profile name
            name: nil,
            # Parent organization ID
            organization_id: nil,
            # Direct SMS phone number
            sending_phone_number: nil,
            # Deprecated. Always null. Sender borrowing is gone: a profile no longer points at
            # another profile for its SMS sender, and every profile owns the sender it sends
            # from.
            #
            # Kept on the wire, and never populated, because those are two different promises.
            # Removing the key changes the response's shape — a generated client loses the
            # property and stops compiling on the next regenerate, for a value that is now
            # null for every profile in existence. Keeping it null costs a key and breaks
            # nobody, and null is the honest answer rather than a placeholder: there is no
            # borrowing left to report.
            #
            # Nothing could populate it. Migration 260813161500 dropped the column and copied
            # each borrower its own channel-provider row; its Down() says outright that the
            # borrower-to-lender pairing is not recoverable. The only surviving trace is a
            # notes string on the copied row.
            sending_phone_number_profile_id: nil,
            sending_whatsapp_number_profile_id: nil,
            # Profile short name/abbreviation. 3–11 characters: letters, numbers, and spaces
            # only, with at least one letter.
            short_name: nil,
            # Profile setup status: incomplete, pending_review, approved, rejected
            status: nil,
            # When the profile was last updated
            updated_at: nil,
            # WhatsApp Business Account ID associated with this profile. Present whether the
            # WABA is inherited from the organization or configured directly.
            waba_id: nil,
            # Direct WhatsApp phone number
            whatsapp_phone_number: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                allow_contact_sharing: T.nilable(T::Boolean),
                allow_number_change_during_onboarding: T.nilable(T::Boolean),
                allow_template_sharing: T.nilable(T::Boolean),
                billing_contact:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::BillingContact
                  ),
                billing_model: String,
                brand:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand
                  ),
                created_at: Time,
                description: T.nilable(String),
                email: T.nilable(String),
                icon: T.nilable(String),
                inherit_contacts: T.nilable(T::Boolean),
                inherit_tcr_brand: T::Boolean,
                inherit_tcr_campaign: T::Boolean,
                inherit_templates: T.nilable(T::Boolean),
                name: String,
                organization_id: T.nilable(String),
                sending_phone_number: T.nilable(String),
                sending_phone_number_profile_id: T.nilable(String),
                sending_whatsapp_number_profile_id: T.nilable(String),
                short_name: T.nilable(String),
                status: String,
                updated_at: T.nilable(Time),
                waba_id: T.nilable(String),
                whatsapp_phone_number: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class BillingContact < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::ProfileListResponse::Data::Profile::BillingContact,
                  Sentdm::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_accessor :address

            sig { returns(T.nilable(String)) }
            attr_accessor :email

            sig { returns(T.nilable(String)) }
            attr_accessor :name

            sig { returns(T.nilable(String)) }
            attr_accessor :phone

            # Billing contact info returned in profile responses
            sig do
              params(
                address: T.nilable(String),
                email: T.nilable(String),
                name: T.nilable(String),
                phone: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(address: nil, email: nil, name: nil, phone: nil)
            end

            sig do
              override.returns(
                {
                  address: T.nilable(String),
                  email: T.nilable(String),
                  name: T.nilable(String),
                  phone: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end

          class Brand < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand,
                  Sentdm::Internal::AnyHash
                )
              end

            # Unique identifier for the brand
            sig { returns(T.nilable(String)) }
            attr_reader :id

            sig { params(id: String).void }
            attr_writer :id

            # Business details and address information
            sig do
              returns(
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Business
                )
              )
            end
            attr_reader :business

            sig do
              params(
                business:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Business::OrHash
                  )
              ).void
            end
            attr_writer :business

            # Compliance and TCR-related information
            sig do
              returns(
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance
                )
              )
            end
            attr_reader :compliance

            sig do
              params(
                compliance:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance::OrHash
                  )
              ).void
            end
            attr_writer :compliance

            # Contact information for the brand
            sig do
              returns(
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Contact
                )
              )
            end
            attr_reader :contact

            sig do
              params(
                contact:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Contact::OrHash
                  )
              ).void
            end
            attr_writer :contact

            # When the brand was created
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at

            sig { params(created_at: Time).void }
            attr_writer :created_at

            # Deprecated and scheduled for removal. Identifies the Campaign Service Provider
            # that registered the brand, which is Sent, so the value is the same for every
            # brand and every account. Nothing on your side can act on it and there is no
            # replacement. Stop reading it.
            sig { returns(T.nilable(String)) }
            attr_accessor :csp_id

            sig do
              returns(
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus::TaggedSymbol
                )
              )
            end
            attr_accessor :identity_status

            # Whether this brand is inherited from the parent organization
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :is_inherited

            sig { params(is_inherited: T::Boolean).void }
            attr_writer :is_inherited

            sig do
              returns(
                T.nilable(
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status::TaggedSymbol
                )
              )
            end
            attr_accessor :status

            # When the brand was submitted to TCR
            sig { returns(T.nilable(Time)) }
            attr_accessor :submitted_at

            # Whether this brand has been submitted to TCR
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :submitted_to_tcr

            sig { params(submitted_to_tcr: T::Boolean).void }
            attr_writer :submitted_to_tcr

            # TCR brand ID (populated after TCR submission)
            sig { returns(T.nilable(String)) }
            attr_accessor :tcr_brand_id

            # Universal EIN from TCR
            sig { returns(T.nilable(String)) }
            attr_accessor :universal_ein

            # When the brand was last updated
            sig { returns(T.nilable(Time)) }
            attr_accessor :updated_at

            # Brand response with nested contact, business, and compliance sections — mirrors
            # the request structure.
            sig do
              params(
                id: String,
                business:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Business::OrHash
                  ),
                compliance:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance::OrHash
                  ),
                contact:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Contact::OrHash
                  ),
                created_at: Time,
                csp_id: T.nilable(String),
                identity_status:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus::OrSymbol
                  ),
                is_inherited: T::Boolean,
                status:
                  T.nilable(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status::OrSymbol
                  ),
                submitted_at: T.nilable(Time),
                submitted_to_tcr: T::Boolean,
                tcr_brand_id: T.nilable(String),
                universal_ein: T.nilable(String),
                updated_at: T.nilable(Time)
              ).returns(T.attached_class)
            end
            def self.new(
              # Unique identifier for the brand
              id: nil,
              # Business details and address information
              business: nil,
              # Compliance and TCR-related information
              compliance: nil,
              # Contact information for the brand
              contact: nil,
              # When the brand was created
              created_at: nil,
              # Deprecated and scheduled for removal. Identifies the Campaign Service Provider
              # that registered the brand, which is Sent, so the value is the same for every
              # brand and every account. Nothing on your side can act on it and there is no
              # replacement. Stop reading it.
              csp_id: nil,
              identity_status: nil,
              # Whether this brand is inherited from the parent organization
              is_inherited: nil,
              status: nil,
              # When the brand was submitted to TCR
              submitted_at: nil,
              # Whether this brand has been submitted to TCR
              submitted_to_tcr: nil,
              # TCR brand ID (populated after TCR submission)
              tcr_brand_id: nil,
              # Universal EIN from TCR
              universal_ein: nil,
              # When the brand was last updated
              updated_at: nil
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  business:
                    T.nilable(
                      Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Business
                    ),
                  compliance:
                    T.nilable(
                      Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance
                    ),
                  contact:
                    T.nilable(
                      Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Contact
                    ),
                  created_at: Time,
                  csp_id: T.nilable(String),
                  identity_status:
                    T.nilable(
                      Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus::TaggedSymbol
                    ),
                  is_inherited: T::Boolean,
                  status:
                    T.nilable(
                      Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status::TaggedSymbol
                    ),
                  submitted_at: T.nilable(Time),
                  submitted_to_tcr: T::Boolean,
                  tcr_brand_id: T.nilable(String),
                  universal_ein: T.nilable(String),
                  updated_at: T.nilable(Time)
                }
              )
            end
            def to_hash
            end

            class Business < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Business,
                    Sentdm::Internal::AnyHash
                  )
                end

              # City
              sig { returns(T.nilable(String)) }
              attr_accessor :city

              # Country code (e.g., US, CA)
              sig { returns(T.nilable(String)) }
              attr_accessor :country

              # Country where the business is registered
              sig { returns(T.nilable(String)) }
              attr_accessor :country_of_registration

              # Business entity type
              sig { returns(T.nilable(String)) }
              attr_accessor :entity_type

              # Legal business name
              sig { returns(T.nilable(String)) }
              attr_accessor :legal_name

              # Postal/ZIP code
              sig { returns(T.nilable(String)) }
              attr_accessor :postal_code

              # State/province code
              sig { returns(T.nilable(String)) }
              attr_accessor :state

              # Street address
              sig { returns(T.nilable(String)) }
              attr_accessor :street

              # Tax ID/EIN number
              sig { returns(T.nilable(String)) }
              attr_accessor :tax_id

              # Type of tax ID (e.g., us_ein, ca_bn)
              sig { returns(T.nilable(String)) }
              attr_accessor :tax_id_type

              # Business website URL
              sig { returns(T.nilable(String)) }
              attr_accessor :url

              # Business details and address information
              sig do
                params(
                  city: T.nilable(String),
                  country: T.nilable(String),
                  country_of_registration: T.nilable(String),
                  entity_type: T.nilable(String),
                  legal_name: T.nilable(String),
                  postal_code: T.nilable(String),
                  state: T.nilable(String),
                  street: T.nilable(String),
                  tax_id: T.nilable(String),
                  tax_id_type: T.nilable(String),
                  url: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # City
                city: nil,
                # Country code (e.g., US, CA)
                country: nil,
                # Country where the business is registered
                country_of_registration: nil,
                # Business entity type
                entity_type: nil,
                # Legal business name
                legal_name: nil,
                # Postal/ZIP code
                postal_code: nil,
                # State/province code
                state: nil,
                # Street address
                street: nil,
                # Tax ID/EIN number
                tax_id: nil,
                # Type of tax ID (e.g., us_ein, ca_bn)
                tax_id_type: nil,
                # Business website URL
                url: nil
              )
              end

              sig do
                override.returns(
                  {
                    city: T.nilable(String),
                    country: T.nilable(String),
                    country_of_registration: T.nilable(String),
                    entity_type: T.nilable(String),
                    legal_name: T.nilable(String),
                    postal_code: T.nilable(String),
                    state: T.nilable(String),
                    street: T.nilable(String),
                    tax_id: T.nilable(String),
                    tax_id_type: T.nilable(String),
                    url: T.nilable(String)
                  }
                )
              end
              def to_hash
              end
            end

            class Compliance < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Compliance,
                    Sentdm::Internal::AnyHash
                  )
                end

              sig do
                returns(T.nilable(Sentdm::TcrBrandRelationship::TaggedSymbol))
              end
              attr_accessor :brand_relationship

              # List of destination countries for messaging
              sig { returns(T.nilable(T::Array[Sentdm::DestinationCountry])) }
              attr_reader :destination_countries

              sig do
                params(
                  destination_countries:
                    T::Array[Sentdm::DestinationCountry::OrHash]
                ).void
              end
              attr_writer :destination_countries

              # Whether this is a TCR (Campaign Registry) application
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :is_tcr_application

              sig { params(is_tcr_application: T::Boolean).void }
              attr_writer :is_tcr_application

              # Additional notes about the business or use case
              sig { returns(T.nilable(String)) }
              attr_accessor :notes

              # Phone number prefix for messaging (e.g., "+1")
              sig { returns(T.nilable(String)) }
              attr_accessor :phone_number_prefix

              # Always null. The brand's free-text primary use case is no longer stored: it
              # reached neither TCR nor any decision, and its column is dropped with no
              # backfill, because the values were prose and the typed equivalent is the
              # campaign's MessagingUseCaseUS.
              #
              # Retained so existing v3 clients reading primary_use_case keep deserializing.
              # Unlike the profile sharing flags, which can answer false truthfully, there is no
              # value to report here — the field is present and empty rather than present and
              # wrong.
              sig { returns(T.nilable(String)) }
              attr_accessor :primary_use_case

              sig { returns(T.nilable(Sentdm::TcrVertical::TaggedSymbol)) }
              attr_accessor :vertical

              # Compliance and TCR-related information
              sig do
                params(
                  brand_relationship:
                    T.nilable(Sentdm::TcrBrandRelationship::OrSymbol),
                  destination_countries:
                    T::Array[Sentdm::DestinationCountry::OrHash],
                  is_tcr_application: T::Boolean,
                  notes: T.nilable(String),
                  phone_number_prefix: T.nilable(String),
                  primary_use_case: T.nilable(String),
                  vertical: T.nilable(Sentdm::TcrVertical::OrSymbol)
                ).returns(T.attached_class)
              end
              def self.new(
                brand_relationship: nil,
                # List of destination countries for messaging
                destination_countries: nil,
                # Whether this is a TCR (Campaign Registry) application
                is_tcr_application: nil,
                # Additional notes about the business or use case
                notes: nil,
                # Phone number prefix for messaging (e.g., "+1")
                phone_number_prefix: nil,
                # Always null. The brand's free-text primary use case is no longer stored: it
                # reached neither TCR nor any decision, and its column is dropped with no
                # backfill, because the values were prose and the typed equivalent is the
                # campaign's MessagingUseCaseUS.
                #
                # Retained so existing v3 clients reading primary_use_case keep deserializing.
                # Unlike the profile sharing flags, which can answer false truthfully, there is no
                # value to report here — the field is present and empty rather than present and
                # wrong.
                primary_use_case: nil,
                vertical: nil
              )
              end

              sig do
                override.returns(
                  {
                    brand_relationship:
                      T.nilable(Sentdm::TcrBrandRelationship::TaggedSymbol),
                    destination_countries: T::Array[Sentdm::DestinationCountry],
                    is_tcr_application: T::Boolean,
                    notes: T.nilable(String),
                    phone_number_prefix: T.nilable(String),
                    primary_use_case: T.nilable(String),
                    vertical: T.nilable(Sentdm::TcrVertical::TaggedSymbol)
                  }
                )
              end
              def to_hash
              end
            end

            class Contact < Sentdm::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Contact,
                    Sentdm::Internal::AnyHash
                  )
                end

              # Business/brand name
              sig { returns(T.nilable(String)) }
              attr_accessor :business_name

              # Contact email address
              sig { returns(T.nilable(String)) }
              attr_accessor :email

              # Primary contact name
              sig { returns(T.nilable(String)) }
              attr_reader :name

              sig { params(name: String).void }
              attr_writer :name

              # Contact phone number in E.164 format
              sig { returns(T.nilable(String)) }
              attr_accessor :phone

              # Contact phone country code (e.g., "1" for US)
              sig { returns(T.nilable(String)) }
              attr_accessor :phone_country_code

              # Contact's role in the business
              sig { returns(T.nilable(String)) }
              attr_accessor :role

              # Contact information for the brand
              sig do
                params(
                  business_name: T.nilable(String),
                  email: T.nilable(String),
                  name: String,
                  phone: T.nilable(String),
                  phone_country_code: T.nilable(String),
                  role: T.nilable(String)
                ).returns(T.attached_class)
              end
              def self.new(
                # Business/brand name
                business_name: nil,
                # Contact email address
                email: nil,
                # Primary contact name
                name: nil,
                # Contact phone number in E.164 format
                phone: nil,
                # Contact phone country code (e.g., "1" for US)
                phone_country_code: nil,
                # Contact's role in the business
                role: nil
              )
              end

              sig do
                override.returns(
                  {
                    business_name: T.nilable(String),
                    email: T.nilable(String),
                    name: String,
                    phone: T.nilable(String),
                    phone_country_code: T.nilable(String),
                    role: T.nilable(String)
                  }
                )
              end
              def to_hash
              end
            end

            module IdentityStatus
              extend Sentdm::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              SELF_DECLARED =
                T.let(
                  :SELF_DECLARED,
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus::TaggedSymbol
                )
              UNVERIFIED =
                T.let(
                  :UNVERIFIED,
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus::TaggedSymbol
                )
              VERIFIED =
                T.let(
                  :VERIFIED,
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus::TaggedSymbol
                )
              VETTED_VERIFIED =
                T.let(
                  :VETTED_VERIFIED,
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::IdentityStatus::TaggedSymbol
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
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ACTIVE =
                T.let(
                  :ACTIVE,
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status::TaggedSymbol
                )
              INACTIVE =
                T.let(
                  :INACTIVE,
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status::TaggedSymbol
                )
              SUSPENDED =
                T.let(
                  :SUSPENDED,
                  Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Sentdm::Models::ProfileListResponse::Data::Profile::Brand::Status::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end

      class Error < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Models::ProfileListResponse::Error,
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
              Sentdm::Models::ProfileListResponse::Meta,
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
