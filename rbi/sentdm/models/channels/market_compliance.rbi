# typed: strong

module Sentdm
  module Models
    module Channels
      class MarketCompliance < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::MarketCompliance, Sentdm::Internal::AnyHash)
          end

        # Business identity. The identity the registration is filed against. Omit to have
        # none; { "inherit": true } to register under your organization's.
        sig { returns(T.nilable(Sentdm::Channels::MarketCompliance::Brand)) }
        attr_reader :brand

        sig do
          params(brand: Sentdm::Channels::MarketCompliance::Brand::OrHash).void
        end
        attr_writer :brand

        # Messaging campaign. What the programme sends and how recipients consented. Omit
        # to run on your organization's; supplying it takes one of your own. { "inherit":
        # true } says so outright. Required when `compliance.campaign.inherit != true`.
        sig { returns(T.nilable(Sentdm::Channels::MarketCompliance::Campaign)) }
        attr_reader :campaign

        sig do
          params(
            campaign: Sentdm::Channels::MarketCompliance::Campaign::OrHash
          ).void
        end
        attr_writer :campaign

        # The compliance values a market registers with. `brand` and `campaign` apply to
        # US `TEN_DLC`; other markets fill this map with the document keys their own
        # requirements name.
        sig do
          params(
            brand: Sentdm::Channels::MarketCompliance::Brand::OrHash,
            campaign: Sentdm::Channels::MarketCompliance::Campaign::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Business identity. The identity the registration is filed against. Omit to have
          # none; { "inherit": true } to register under your organization's.
          brand: nil,
          # Messaging campaign. What the programme sends and how recipients consented. Omit
          # to run on your organization's; supplying it takes one of your own. { "inherit":
          # true } says so outright. Required when `compliance.campaign.inherit != true`.
          campaign: nil
        )
        end

        sig do
          override.returns(
            {
              brand: Sentdm::Channels::MarketCompliance::Brand,
              campaign: Sentdm::Channels::MarketCompliance::Campaign
            }
          )
        end
        def to_hash
        end

        class Brand < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::MarketCompliance::Brand,
                Sentdm::Internal::AnyHash
              )
            end

          # Public-facing name. TCR displayName — the name recipients would recognise. Named
          # for what it holds rather than for TCR's field, which is why it is not
          # `display_name`. Required when `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :business_name

          sig { params(business_name: String).void }
          attr_writer :business_name

          # City. Required when `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :city

          sig { params(city: String).void }
          attr_writer :city

          # Contact email. TCR email. Required when `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :contact_email

          sig { params(contact_email: String).void }
          attr_writer :contact_email

          # Responsible contact. Split into TCR's firstName/lastName on submission.
          # BrandService refuses a blank one, so a missing name is reported here rather than
          # thrown after the profile was written. Required when
          # `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :contact_name

          sig { params(contact_name: String).void }
          attr_writer :contact_name

          # Contact phone. TCR sends it as both phone and mobilePhone, so it is asked for
          # once. Named for the contact it belongs to rather than as a bare `phone` on a
          # block that also carries an address. Required when
          # `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :contact_phone

          sig { params(contact_phone: String).void }
          attr_writer :contact_phone

          # Country of registration. Two letters — US. The country spelled out in full is
          # accepted too and stored as its code, which is what a read answers with and what
          # is filed. Required when `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :country

          sig { params(country: String).void }
          attr_writer :country

          # Country that issued the tax id. TCR einIssuingCountry — where the tax id was
          # issued, which is not always where the business trades. Defaults to `country`
          # when omitted, which is right for most. Takes the code or the country spelled
          # out, as `country` does.
          sig { returns(T.nilable(String)) }
          attr_reader :ein_issuing_country

          sig { params(ein_issuing_country: String).void }
          attr_writer :ein_issuing_country

          # Entity type. TCR entityType. Decides which vetting TCR applies and, for
          # SOLE_PROPRIETOR, fixes the campaign fee regardless of volume. Also refused at
          # submission if absent. Required when `compliance.brand.inherit != true`.
          sig do
            returns(
              T.nilable(
                Sentdm::Channels::MarketCompliance::Brand::EntityType::OrSymbol
              )
            )
          end
          attr_reader :entity_type

          sig do
            params(
              entity_type:
                Sentdm::Channels::MarketCompliance::Brand::EntityType::OrSymbol
            ).void
          end
          attr_writer :entity_type

          # Run on the organization's brand. True to register under the parent
          # organization's identity rather than one of this profile's own; every field below
          # is then neither asked for nor accepted. Omitted, the brand is the organization's
          # unless this block supplies identity fields, which says plainly enough that it
          # wants one of its own.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :inherit

          sig { params(inherit: T::Boolean).void }
          attr_writer :inherit

          # Registered legal name. TCR companyName — the name on the incorporation
          # documents, which is often not the name recipients would recognise. Required when
          # `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :legal_name

          sig { params(legal_name: String).void }
          attr_writer :legal_name

          # Postal code. Required when `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :postal_code

          sig { params(postal_code: String).void }
          attr_writer :postal_code

          # State or region. TCR state. Two letters for a US registration. Required when
          # `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :state

          sig { params(state: String).void }
          attr_writer :state

          # Street address. Required when `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :street

          sig { params(street: String).void }
          attr_writer :street

          # Tax identifier. TCR ein. TcrBrandSubmissionValidator refuses a submission
          # without one, so it is wanted here rather than discovered at filing time.
          # Required when `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :tax_id

          sig { params(tax_id: String).void }
          attr_writer :tax_id

          # Kind of tax identifier. Which kind of identifier `tax_id` is, e.g. us_ein.
          # Derived onto the brand form, and not itself sent to TCR. Required when
          # `compliance.brand.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :tax_id_type

          sig { params(tax_id_type: String).void }
          attr_writer :tax_id_type

          # Website. TCR website. Optional, and worth sending: carriers weigh it when
          # vetting, so a brand that has one and omits it is vetted on less than it could
          # be.
          sig { returns(T.nilable(String)) }
          attr_reader :website

          sig { params(website: String).void }
          attr_writer :website

          # Business identity. The identity the registration is filed against. Omit to have
          # none; { "inherit": true } to register under your organization's.
          sig do
            params(
              business_name: String,
              city: String,
              contact_email: String,
              contact_name: String,
              contact_phone: String,
              country: String,
              ein_issuing_country: String,
              entity_type:
                Sentdm::Channels::MarketCompliance::Brand::EntityType::OrSymbol,
              inherit: T::Boolean,
              legal_name: String,
              postal_code: String,
              state: String,
              street: String,
              tax_id: String,
              tax_id_type: String,
              website: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Public-facing name. TCR displayName — the name recipients would recognise. Named
            # for what it holds rather than for TCR's field, which is why it is not
            # `display_name`. Required when `compliance.brand.inherit != true`.
            business_name: nil,
            # City. Required when `compliance.brand.inherit != true`.
            city: nil,
            # Contact email. TCR email. Required when `compliance.brand.inherit != true`.
            contact_email: nil,
            # Responsible contact. Split into TCR's firstName/lastName on submission.
            # BrandService refuses a blank one, so a missing name is reported here rather than
            # thrown after the profile was written. Required when
            # `compliance.brand.inherit != true`.
            contact_name: nil,
            # Contact phone. TCR sends it as both phone and mobilePhone, so it is asked for
            # once. Named for the contact it belongs to rather than as a bare `phone` on a
            # block that also carries an address. Required when
            # `compliance.brand.inherit != true`.
            contact_phone: nil,
            # Country of registration. Two letters — US. The country spelled out in full is
            # accepted too and stored as its code, which is what a read answers with and what
            # is filed. Required when `compliance.brand.inherit != true`.
            country: nil,
            # Country that issued the tax id. TCR einIssuingCountry — where the tax id was
            # issued, which is not always where the business trades. Defaults to `country`
            # when omitted, which is right for most. Takes the code or the country spelled
            # out, as `country` does.
            ein_issuing_country: nil,
            # Entity type. TCR entityType. Decides which vetting TCR applies and, for
            # SOLE_PROPRIETOR, fixes the campaign fee regardless of volume. Also refused at
            # submission if absent. Required when `compliance.brand.inherit != true`.
            entity_type: nil,
            # Run on the organization's brand. True to register under the parent
            # organization's identity rather than one of this profile's own; every field below
            # is then neither asked for nor accepted. Omitted, the brand is the organization's
            # unless this block supplies identity fields, which says plainly enough that it
            # wants one of its own.
            inherit: nil,
            # Registered legal name. TCR companyName — the name on the incorporation
            # documents, which is often not the name recipients would recognise. Required when
            # `compliance.brand.inherit != true`.
            legal_name: nil,
            # Postal code. Required when `compliance.brand.inherit != true`.
            postal_code: nil,
            # State or region. TCR state. Two letters for a US registration. Required when
            # `compliance.brand.inherit != true`.
            state: nil,
            # Street address. Required when `compliance.brand.inherit != true`.
            street: nil,
            # Tax identifier. TCR ein. TcrBrandSubmissionValidator refuses a submission
            # without one, so it is wanted here rather than discovered at filing time.
            # Required when `compliance.brand.inherit != true`.
            tax_id: nil,
            # Kind of tax identifier. Which kind of identifier `tax_id` is, e.g. us_ein.
            # Derived onto the brand form, and not itself sent to TCR. Required when
            # `compliance.brand.inherit != true`.
            tax_id_type: nil,
            # Website. TCR website. Optional, and worth sending: carriers weigh it when
            # vetting, so a brand that has one and omits it is vetted on less than it could
            # be.
            website: nil
          )
          end

          sig do
            override.returns(
              {
                business_name: String,
                city: String,
                contact_email: String,
                contact_name: String,
                contact_phone: String,
                country: String,
                ein_issuing_country: String,
                entity_type:
                  Sentdm::Channels::MarketCompliance::Brand::EntityType::OrSymbol,
                inherit: T::Boolean,
                legal_name: String,
                postal_code: String,
                state: String,
                street: String,
                tax_id: String,
                tax_id_type: String,
                website: String
              }
            )
          end
          def to_hash
          end

          # Entity type. TCR entityType. Decides which vetting TCR applies and, for
          # SOLE_PROPRIETOR, fixes the campaign fee regardless of volume. Also refused at
          # submission if absent. Required when `compliance.brand.inherit != true`.
          module EntityType
            extend Sentdm::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Sentdm::Channels::MarketCompliance::Brand::EntityType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PRIVATE_PROFIT =
              T.let(
                :PRIVATE_PROFIT,
                Sentdm::Channels::MarketCompliance::Brand::EntityType::TaggedSymbol
              )
            PUBLIC_PROFIT =
              T.let(
                :PUBLIC_PROFIT,
                Sentdm::Channels::MarketCompliance::Brand::EntityType::TaggedSymbol
              )
            NON_PROFIT =
              T.let(
                :NON_PROFIT,
                Sentdm::Channels::MarketCompliance::Brand::EntityType::TaggedSymbol
              )
            SOLE_PROPRIETOR =
              T.let(
                :SOLE_PROPRIETOR,
                Sentdm::Channels::MarketCompliance::Brand::EntityType::TaggedSymbol
              )
            GOVERNMENT =
              T.let(
                :GOVERNMENT,
                Sentdm::Channels::MarketCompliance::Brand::EntityType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Sentdm::Channels::MarketCompliance::Brand::EntityType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Campaign < Sentdm::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::MarketCompliance::Campaign,
                Sentdm::Internal::AnyHash
              )
            end

          # What this programme sends. TCR description: what recipients will get and why, in
          # a sentence. The only one of these TCR takes verbatim as a description of the
          # programme, which is why it is asked for rather than derived from the customer's
          # name. Required when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :help_keywords

          sig { params(help_keywords: String).void }
          attr_writer :help_keywords

          # Help reply. TCR helpMessage. Its presence is what sets subscriberHelp. Required
          # when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :help_message

          sig { params(help_message: String).void }
          attr_writer :help_message

          # Run on the organization's campaign. True to register under the parent
          # organization's programme rather than one of this profile's own; every field
          # below is then neither asked for nor accepted. Owning the identity and inheriting
          # the campaign is refused — a campaign is filed against an identity registration,
          # and chk_tcr_inheritance forbids that pairing outright.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :inherit

          sig { params(inherit: T::Boolean).void }
          attr_writer :inherit

          # Consent narrative. TCR messageFlow: how recipients opt in, in prose. Under 40
          # characters is refused, and carriers reject vague descriptions — say where opt-in
          # happens, that the box is unchecked by default, and that consent is not a
          # condition of purchase. Required when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :message_flow

          sig { params(message_flow: String).void }
          attr_writer :message_flow

          # Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES. Required
          # when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :opt_in_keywords

          sig { params(opt_in_keywords: String).void }
          attr_writer :opt_in_keywords

          # Opt-in confirmation. TCR optinMessage. Should state message frequency and that
          # rates may apply. Its presence is what sets subscriberOptin. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :opt_in_message

          sig { params(opt_in_message: String).void }
          attr_writer :opt_in_message

          # Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CANCEL,
          # UNSUBSCRIBE and QUIT are honoured regardless of what is declared. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :opt_out_keywords

          sig { params(opt_out_keywords: String).void }
          attr_writer :opt_out_keywords

          # Opt-out confirmation. TCR optoutMessage. Its presence is what sets
          # subscriberOptout. Required when `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :opt_out_message

          sig { params(opt_out_message: String).void }
          attr_writer :opt_out_message

          # Privacy policy URL. TCR privacyPolicyLink. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :privacy_policy_link

          sig { params(privacy_policy_link: String).void }
          attr_writer :privacy_policy_link

          # Terms and conditions URL. TCR termsAndConditionsLink. Required when
          # `compliance.campaign.inherit != true`.
          sig { returns(T.nilable(String)) }
          attr_reader :terms_and_conditions_link

          sig { params(terms_and_conditions_link: String).void }
          attr_writer :terms_and_conditions_link

          # Use cases. What the campaign sends, and an example of each. One to five entries;
          # how they register is decided by volume, never declared. Required when
          # `compliance.campaign.inherit != true`.
          sig do
            returns(
              T.nilable(
                T::Array[Sentdm::Channels::MarketCompliance::Campaign::UseCase]
              )
            )
          end
          attr_reader :use_cases

          sig do
            params(
              use_cases:
                T::Array[
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::OrHash
                ]
            ).void
          end
          attr_writer :use_cases

          # Expected monthly volume. Decides how the campaign registers and which fee tier
          # applies: below the low-volume threshold it registers as LOW_VOLUME with
          # sub-use-cases, above it as a single use case or MIXED. Omitting it registers the
          # campaign at the higher-fee standard tier.
          sig { returns(T.nilable(String)) }
          attr_reader :volume

          sig { params(volume: String).void }
          attr_writer :volume

          # Messaging campaign. What the programme sends and how recipients consented. Omit
          # to run on your organization's; supplying it takes one of your own. { "inherit":
          # true } says so outright. Required when `compliance.campaign.inherit != true`.
          sig do
            params(
              description: String,
              help_keywords: String,
              help_message: String,
              inherit: T::Boolean,
              message_flow: String,
              opt_in_keywords: String,
              opt_in_message: String,
              opt_out_keywords: String,
              opt_out_message: String,
              privacy_policy_link: String,
              terms_and_conditions_link: String,
              use_cases:
                T::Array[
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::OrHash
                ],
              volume: String
            ).returns(T.attached_class)
          end
          def self.new(
            # What this programme sends. TCR description: what recipients will get and why, in
            # a sentence. The only one of these TCR takes verbatim as a description of the
            # programme, which is why it is asked for rather than derived from the customer's
            # name. Required when `compliance.campaign.inherit != true`.
            description: nil,
            # Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Required when
            # `compliance.campaign.inherit != true`.
            help_keywords: nil,
            # Help reply. TCR helpMessage. Its presence is what sets subscriberHelp. Required
            # when `compliance.campaign.inherit != true`.
            help_message: nil,
            # Run on the organization's campaign. True to register under the parent
            # organization's programme rather than one of this profile's own; every field
            # below is then neither asked for nor accepted. Owning the identity and inheriting
            # the campaign is refused — a campaign is filed against an identity registration,
            # and chk_tcr_inheritance forbids that pairing outright.
            inherit: nil,
            # Consent narrative. TCR messageFlow: how recipients opt in, in prose. Under 40
            # characters is refused, and carriers reject vague descriptions — say where opt-in
            # happens, that the box is unchecked by default, and that consent is not a
            # condition of purchase. Required when `compliance.campaign.inherit != true`.
            message_flow: nil,
            # Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES. Required
            # when `compliance.campaign.inherit != true`.
            opt_in_keywords: nil,
            # Opt-in confirmation. TCR optinMessage. Should state message frequency and that
            # rates may apply. Its presence is what sets subscriberOptin. Required when
            # `compliance.campaign.inherit != true`.
            opt_in_message: nil,
            # Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CANCEL,
            # UNSUBSCRIBE and QUIT are honoured regardless of what is declared. Required when
            # `compliance.campaign.inherit != true`.
            opt_out_keywords: nil,
            # Opt-out confirmation. TCR optoutMessage. Its presence is what sets
            # subscriberOptout. Required when `compliance.campaign.inherit != true`.
            opt_out_message: nil,
            # Privacy policy URL. TCR privacyPolicyLink. Required when
            # `compliance.campaign.inherit != true`.
            privacy_policy_link: nil,
            # Terms and conditions URL. TCR termsAndConditionsLink. Required when
            # `compliance.campaign.inherit != true`.
            terms_and_conditions_link: nil,
            # Use cases. What the campaign sends, and an example of each. One to five entries;
            # how they register is decided by volume, never declared. Required when
            # `compliance.campaign.inherit != true`.
            use_cases: nil,
            # Expected monthly volume. Decides how the campaign registers and which fee tier
            # applies: below the low-volume threshold it registers as LOW_VOLUME with
            # sub-use-cases, above it as a single use case or MIXED. Omitting it registers the
            # campaign at the higher-fee standard tier.
            volume: nil
          )
          end

          sig do
            override.returns(
              {
                description: String,
                help_keywords: String,
                help_message: String,
                inherit: T::Boolean,
                message_flow: String,
                opt_in_keywords: String,
                opt_in_message: String,
                opt_out_keywords: String,
                opt_out_message: String,
                privacy_policy_link: String,
                terms_and_conditions_link: String,
                use_cases:
                  T::Array[
                    Sentdm::Channels::MarketCompliance::Campaign::UseCase
                  ],
                volume: String
              }
            )
          end
          def to_hash
          end

          class UseCase < Sentdm::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase,
                  Sentdm::Internal::AnyHash
                )
              end

            # Sample messages. TCR sample1..sample5 for this use case. One to five, each
            # carrying the brand name and an opt-out instruction.
            sig { returns(T::Array[T.anything]) }
            attr_accessor :sample_messages

            # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
            # decides those.
            sig do
              returns(
                Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::OrSymbol
              )
            end
            attr_accessor :use_case

            sig do
              params(
                sample_messages: T::Array[T.anything],
                use_case:
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Sample messages. TCR sample1..sample5 for this use case. One to five, each
              # carrying the brand name and an opt-out instruction.
              sample_messages:,
              # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
              # decides those.
              use_case:
            )
            end

            sig do
              override.returns(
                {
                  sample_messages: T::Array[T.anything],
                  use_case:
                    Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::OrSymbol
                }
              )
            end
            def to_hash
            end

            # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
            # decides those.
            module UseCase
              extend Sentdm::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MARKETING =
                T.let(
                  :MARKETING,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              ACCOUNT_NOTIFICATION =
                T.let(
                  :ACCOUNT_NOTIFICATION,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              CUSTOMER_CARE =
                T.let(
                  :CUSTOMER_CARE,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              FRAUD_ALERT =
                T.let(
                  :FRAUD_ALERT,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              USE_CASE_2_FA =
                T.let(
                  :"2FA",
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              DELIVERY_NOTIFICATION =
                T.let(
                  :DELIVERY_NOTIFICATION,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              SECURITY_ALERT =
                T.let(
                  :SECURITY_ALERT,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              M2_M =
                T.let(
                  :M2M,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              HIGHER_EDUCATION =
                T.let(
                  :HIGHER_EDUCATION,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              POLLING_VOTING =
                T.let(
                  :POLLING_VOTING,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )
              PUBLIC_SERVICE_ANNOUNCEMENT =
                T.let(
                  :PUBLIC_SERVICE_ANNOUNCEMENT,
                  Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
