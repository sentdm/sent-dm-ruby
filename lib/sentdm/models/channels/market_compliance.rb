# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class MarketCompliance < Sentdm::Internal::Type::BaseModel
        # @!attribute brand
        #   Business identity. The identity the registration is filed against. Omit to have
        #   none; { "inherit": true } to register under your organization's.
        #
        #   @return [Sentdm::Models::Channels::MarketCompliance::Brand, nil]
        optional :brand, -> { Sentdm::Channels::MarketCompliance::Brand }

        # @!attribute campaign
        #   Messaging campaign. What the programme sends and how recipients consented. Omit
        #   to run on your organization's; supplying it takes one of your own. { "inherit":
        #   true } says so outright. Required when `compliance.campaign.inherit != true`.
        #
        #   @return [Sentdm::Models::Channels::MarketCompliance::Campaign, nil]
        optional :campaign, -> { Sentdm::Channels::MarketCompliance::Campaign }

        # @!method initialize(brand: nil, campaign: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::MarketCompliance} for more details.
        #
        #   The compliance values a market registers with. `brand` and `campaign` apply to
        #   US `TEN_DLC`; other markets fill this map with the document keys their own
        #   requirements name.
        #
        #   @param brand [Sentdm::Models::Channels::MarketCompliance::Brand] Business identity. The identity the registration is filed against. Omit to have
        #
        #   @param campaign [Sentdm::Models::Channels::MarketCompliance::Campaign] Messaging campaign. What the programme sends and how recipients consented. Omit

        # @see Sentdm::Models::Channels::MarketCompliance#brand
        class Brand < Sentdm::Internal::Type::BaseModel
          # @!attribute business_name
          #   Public-facing name. TCR displayName — the name recipients would recognise. Named
          #   for what it holds rather than for TCR's field, which is why it is not
          #   `display_name`. Required when `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :business_name, String

          # @!attribute city
          #   City. Required when `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :city, String

          # @!attribute contact_email
          #   Contact email. TCR email. Required when `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :contact_email, String

          # @!attribute contact_name
          #   Responsible contact. Split into TCR's firstName/lastName on submission.
          #   BrandService refuses a blank one, so a missing name is reported here rather than
          #   thrown after the profile was written. Required when
          #   `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :contact_name, String

          # @!attribute contact_phone
          #   Contact phone. TCR sends it as both phone and mobilePhone, so it is asked for
          #   once. Named for the contact it belongs to rather than as a bare `phone` on a
          #   block that also carries an address. Required when
          #   `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :contact_phone, String

          # @!attribute country
          #   Country of registration. Two letters — US. The country spelled out in full is
          #   accepted too and stored as its code, which is what a read answers with and what
          #   is filed. Required when `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :country, String

          # @!attribute ein_issuing_country
          #   Country that issued the tax id. TCR einIssuingCountry — where the tax id was
          #   issued, which is not always where the business trades. Defaults to `country`
          #   when omitted, which is right for most. Takes the code or the country spelled
          #   out, as `country` does.
          #
          #   @return [String, nil]
          optional :ein_issuing_country, String

          # @!attribute entity_type
          #   Entity type. TCR entityType. Decides which vetting TCR applies and, for
          #   SOLE_PROPRIETOR, fixes the campaign fee regardless of volume. Also refused at
          #   submission if absent. Required when `compliance.brand.inherit != true`.
          #
          #   @return [Symbol, Sentdm::Models::Channels::MarketCompliance::Brand::EntityType, nil]
          optional :entity_type, enum: -> { Sentdm::Channels::MarketCompliance::Brand::EntityType }

          # @!attribute inherit
          #   Run on the organization's brand. True to register under the parent
          #   organization's identity rather than one of this profile's own; every field below
          #   is then neither asked for nor accepted. Omitted, the brand is the organization's
          #   unless this block supplies identity fields, which says plainly enough that it
          #   wants one of its own.
          #
          #   @return [Boolean, nil]
          optional :inherit, Sentdm::Internal::Type::Boolean

          # @!attribute legal_name
          #   Registered legal name. TCR companyName — the name on the incorporation
          #   documents, which is often not the name recipients would recognise. Required when
          #   `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :legal_name, String

          # @!attribute postal_code
          #   Postal code. Required when `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :postal_code, String

          # @!attribute state
          #   State or region. TCR state. Two letters for a US registration. Required when
          #   `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :state, String

          # @!attribute street
          #   Street address. Required when `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :street, String

          # @!attribute tax_id
          #   Tax identifier. TCR ein. TcrBrandSubmissionValidator refuses a submission
          #   without one, so it is wanted here rather than discovered at filing time.
          #   Required when `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :tax_id, String

          # @!attribute tax_id_type
          #   Kind of tax identifier. Which kind of identifier `tax_id` is, e.g. us_ein.
          #   Derived onto the brand form, and not itself sent to TCR. Required when
          #   `compliance.brand.inherit != true`.
          #
          #   @return [String, nil]
          optional :tax_id_type, String

          # @!attribute website
          #   Website. TCR website. Optional, and worth sending: carriers weigh it when
          #   vetting, so a brand that has one and omits it is vetted on less than it could
          #   be.
          #
          #   @return [String, nil]
          optional :website, String

          # @!method initialize(business_name: nil, city: nil, contact_email: nil, contact_name: nil, contact_phone: nil, country: nil, ein_issuing_country: nil, entity_type: nil, inherit: nil, legal_name: nil, postal_code: nil, state: nil, street: nil, tax_id: nil, tax_id_type: nil, website: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Channels::MarketCompliance::Brand} for more details.
          #
          #   Business identity. The identity the registration is filed against. Omit to have
          #   none; { "inherit": true } to register under your organization's.
          #
          #   @param business_name [String] Public-facing name. TCR displayName — the name recipients would recognise. Named
          #
          #   @param city [String] City. Required when `compliance.brand.inherit != true`.
          #
          #   @param contact_email [String] Contact email. TCR email. Required when `compliance.brand.inherit != true`.
          #
          #   @param contact_name [String] Responsible contact. Split into TCR's firstName/lastName on submission. BrandSer
          #
          #   @param contact_phone [String] Contact phone. TCR sends it as both phone and mobilePhone, so it is asked for on
          #
          #   @param country [String] Country of registration. Two letters — US. The country spelled out in full is ac
          #
          #   @param ein_issuing_country [String] Country that issued the tax id. TCR einIssuingCountry — where the tax id was iss
          #
          #   @param entity_type [Symbol, Sentdm::Models::Channels::MarketCompliance::Brand::EntityType] Entity type. TCR entityType. Decides which vetting TCR applies and, for SOLE_PRO
          #
          #   @param inherit [Boolean] Run on the organization's brand. True to register under the parent organization'
          #
          #   @param legal_name [String] Registered legal name. TCR companyName — the name on the incorporation documents
          #
          #   @param postal_code [String] Postal code. Required when `compliance.brand.inherit != true`.
          #
          #   @param state [String] State or region. TCR state. Two letters for a US registration. Required when `co
          #
          #   @param street [String] Street address. Required when `compliance.brand.inherit != true`.
          #
          #   @param tax_id [String] Tax identifier. TCR ein. TcrBrandSubmissionValidator refuses a submission withou
          #
          #   @param tax_id_type [String] Kind of tax identifier. Which kind of identifier `tax_id` is, e.g. us_ein. Deriv
          #
          #   @param website [String] Website. TCR website. Optional, and worth sending: carriers weigh it when vettin

          # Entity type. TCR entityType. Decides which vetting TCR applies and, for
          # SOLE_PROPRIETOR, fixes the campaign fee regardless of volume. Also refused at
          # submission if absent. Required when `compliance.brand.inherit != true`.
          #
          # @see Sentdm::Models::Channels::MarketCompliance::Brand#entity_type
          module EntityType
            extend Sentdm::Internal::Type::Enum

            PRIVATE_PROFIT = :PRIVATE_PROFIT
            PUBLIC_PROFIT = :PUBLIC_PROFIT
            NON_PROFIT = :NON_PROFIT
            SOLE_PROPRIETOR = :SOLE_PROPRIETOR
            GOVERNMENT = :GOVERNMENT

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see Sentdm::Models::Channels::MarketCompliance#campaign
        class Campaign < Sentdm::Internal::Type::BaseModel
          # @!attribute description
          #   What this programme sends. TCR description: what recipients will get and why, in
          #   a sentence. The only one of these TCR takes verbatim as a description of the
          #   programme, which is why it is asked for rather than derived from the customer's
          #   name. Required when `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute help_keywords
          #   Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :help_keywords, String

          # @!attribute help_message
          #   Help reply. TCR helpMessage. Its presence is what sets subscriberHelp. Required
          #   when `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :help_message, String

          # @!attribute inherit
          #   Run on the organization's campaign. True to register under the parent
          #   organization's programme rather than one of this profile's own; every field
          #   below is then neither asked for nor accepted. Owning the identity and inheriting
          #   the campaign is refused — a campaign is filed against an identity registration,
          #   and chk_tcr_inheritance forbids that pairing outright.
          #
          #   @return [Boolean, nil]
          optional :inherit, Sentdm::Internal::Type::Boolean

          # @!attribute message_flow
          #   Consent narrative. TCR messageFlow: how recipients opt in, in prose. Under 40
          #   characters is refused, and carriers reject vague descriptions — say where opt-in
          #   happens, that the box is unchecked by default, and that consent is not a
          #   condition of purchase. Required when `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :message_flow, String

          # @!attribute opt_in_keywords
          #   Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES. Required
          #   when `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :opt_in_keywords, String

          # @!attribute opt_in_message
          #   Opt-in confirmation. TCR optinMessage. Should state message frequency and that
          #   rates may apply. Its presence is what sets subscriberOptin. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :opt_in_message, String

          # @!attribute opt_out_keywords
          #   Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CANCEL,
          #   UNSUBSCRIBE and QUIT are honoured regardless of what is declared. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :opt_out_keywords, String

          # @!attribute opt_out_message
          #   Opt-out confirmation. TCR optoutMessage. Its presence is what sets
          #   subscriberOptout. Required when `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :opt_out_message, String

          # @!attribute privacy_policy_link
          #   Privacy policy URL. TCR privacyPolicyLink. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :privacy_policy_link, String

          # @!attribute terms_and_conditions_link
          #   Terms and conditions URL. TCR termsAndConditionsLink. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [String, nil]
          optional :terms_and_conditions_link, String

          # @!attribute use_cases
          #   Use cases. What the campaign sends, and an example of each. One to five entries;
          #   how they register is decided by volume, never declared. Required when
          #   `compliance.campaign.inherit != true`.
          #
          #   @return [Array<Sentdm::Models::Channels::MarketCompliance::Campaign::UseCase>, nil]
          optional :use_cases,
                   -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Channels::MarketCompliance::Campaign::UseCase] }

          # @!attribute volume
          #   Expected monthly volume. Decides how the campaign registers and which fee tier
          #   applies: below the low-volume threshold it registers as LOW_VOLUME with
          #   sub-use-cases, above it as a single use case or MIXED. Omitting it registers the
          #   campaign at the higher-fee standard tier.
          #
          #   @return [String, nil]
          optional :volume, String

          # @!method initialize(description: nil, help_keywords: nil, help_message: nil, inherit: nil, message_flow: nil, opt_in_keywords: nil, opt_in_message: nil, opt_out_keywords: nil, opt_out_message: nil, privacy_policy_link: nil, terms_and_conditions_link: nil, use_cases: nil, volume: nil)
          #   Some parameter documentations has been truncated, see
          #   {Sentdm::Models::Channels::MarketCompliance::Campaign} for more details.
          #
          #   Messaging campaign. What the programme sends and how recipients consented. Omit
          #   to run on your organization's; supplying it takes one of your own. { "inherit":
          #   true } says so outright. Required when `compliance.campaign.inherit != true`.
          #
          #   @param description [String] What this programme sends. TCR description: what recipients will get and why, in
          #
          #   @param help_keywords [String] Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Required when
          #
          #   @param help_message [String] Help reply. TCR helpMessage. Its presence is what sets subscriberHelp. Required
          #
          #   @param inherit [Boolean] Run on the organization's campaign. True to register under the parent organizati
          #
          #   @param message_flow [String] Consent narrative. TCR messageFlow: how recipients opt in, in prose. Under 40 ch
          #
          #   @param opt_in_keywords [String] Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES. Required wh
          #
          #   @param opt_in_message [String] Opt-in confirmation. TCR optinMessage. Should state message frequency and that r
          #
          #   @param opt_out_keywords [String] Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CANCEL, UNSUBS
          #
          #   @param opt_out_message [String] Opt-out confirmation. TCR optoutMessage. Its presence is what sets subscriberOpt
          #
          #   @param privacy_policy_link [String] Privacy policy URL. TCR privacyPolicyLink. Required when `compliance.campaign.in
          #
          #   @param terms_and_conditions_link [String] Terms and conditions URL. TCR termsAndConditionsLink. Required when `compliance.
          #
          #   @param use_cases [Array<Sentdm::Models::Channels::MarketCompliance::Campaign::UseCase>] Use cases. What the campaign sends, and an example of each. One to five entries;
          #
          #   @param volume [String] Expected monthly volume. Decides how the campaign registers and which fee tier a

          class UseCase < Sentdm::Internal::Type::BaseModel
            # @!attribute sample_messages
            #   Sample messages. TCR sample1..sample5 for this use case. One to five, each
            #   carrying the brand name and an opt-out instruction.
            #
            #   @return [Array<Object>]
            required :sample_messages, Sentdm::Internal::Type::ArrayOf[Sentdm::Internal::Type::Unknown]

            # @!attribute use_case
            #   Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
            #   decides those.
            #
            #   @return [Symbol, Sentdm::Models::Channels::MarketCompliance::Campaign::UseCase::UseCase]
            required :use_case, enum: -> { Sentdm::Channels::MarketCompliance::Campaign::UseCase::UseCase }

            # @!method initialize(sample_messages:, use_case:)
            #   Some parameter documentations has been truncated, see
            #   {Sentdm::Models::Channels::MarketCompliance::Campaign::UseCase} for more
            #   details.
            #
            #   @param sample_messages [Array<Object>] Sample messages. TCR sample1..sample5 for this use case. One to five, each carry
            #
            #   @param use_case [Symbol, Sentdm::Models::Channels::MarketCompliance::Campaign::UseCase::UseCase] Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume decid

            # Use case. What this entry sends. MIXED and LOW_VOLUME are refused — volume
            # decides those.
            #
            # @see Sentdm::Models::Channels::MarketCompliance::Campaign::UseCase#use_case
            module UseCase
              extend Sentdm::Internal::Type::Enum

              MARKETING = :MARKETING
              ACCOUNT_NOTIFICATION = :ACCOUNT_NOTIFICATION
              CUSTOMER_CARE = :CUSTOMER_CARE
              FRAUD_ALERT = :FRAUD_ALERT
              USE_CASE_2_FA = :"2FA"
              DELIVERY_NOTIFICATION = :DELIVERY_NOTIFICATION
              SECURITY_ALERT = :SECURITY_ALERT
              M2_M = :M2M
              HIGHER_EDUCATION = :HIGHER_EDUCATION
              POLLING_VOTING = :POLLING_VOTING
              PUBLIC_SERVICE_ANNOUNCEMENT = :PUBLIC_SERVICE_ANNOUNCEMENT

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
