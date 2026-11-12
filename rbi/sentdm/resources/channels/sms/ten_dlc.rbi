# typed: strong

module Sentdm
  module Resources
    class Channels
      class SMS
        # The senders you send from, one per channel.
        #
        # **SMS is a list of markets**, each keyed by `(country, number_type)` — a
        # customer can hold `us/10dlc` and `gb/alphanumeric` at once, so a market is
        # addressed by the pair rather than by country alone. **WhatsApp and RCS are
        # single**: a customer has one business account and one agent. **Voice is per
        # number**: each number you hold can carry phone calls on its own
        # (`POST /v3/channels/voice`), each with the callback URL Sent asks what to do
        # with its calls, one of them is the default line for calls placed from your app,
        # and voice tokens are minted with `POST /v3/voice/tokens`. Read your voice
        # numbers with `GET /v3/channels/voice` and change one with
        # `PATCH /v3/channels/voice/{number}`.
        #
        # ## Compliance lives on the market
        #
        # Adding a market records everything that market registers with, in its
        # `compliance` object. Only **US `TEN_DLC`** registers with a regime — The
        # Campaign Registry — and it is the only market whose compliance carries `brand`
        # and `campaign`. Everywhere else compliance is documents, and many markets ask
        # for none at all.
        #
        # `GET` and `PATCH` on a market return and accept the same shape, so what comes
        # back can be sent back: an omitted key is left alone, and a key reported in
        # `requirements` is the path into the body that clears it.
        #
        # Call `GET /v3/compliance/requirements` first — it answers what a market demands
        # before you hold it, with a body you can fill in and post.
        class TenDlc
          # Registers **a new campaign** on the US `TEN_DLC` market you already hold — the
          # one market that registers campaigns. Use it when you want numbers for a
          # different use case than the market's existing campaign covers. The campaign is
          # filed under the brand the market files under — your organization's when you
          # inherit its identity.
          #
          # ## What to send
          #
          # The new campaign's fields, at the top level of the body: use cases, consent
          # narrative, volume, sample messages and keywords, under the
          # `compliance.campaign.*` keys
          # `GET /v3/compliance/requirements?country=US&type=TEN_DLC` lists, without that
          # prefix. It has to be complete. A rejected field is keyed by its name
          # (`description`). `id` and `inherit` are ignored, so an entry of
          # `compliance.campaigns` can be sent as read.
          #
          # The identity is the market's and is not sent here. A market whose identity has
          # no registration yet, or one not yet submitted for review, is `400`.
          #
          # ## What happens
          #
          # The campaign is recorded and goes for review; it is not filed with The Campaign
          # Registry by this call. **It comes without numbers**: send its `id` from
          # `compliance.campaigns` to `POST /v3/channels/sms/numbers/US/TEN_DLC` to give it
          # some. **The campaign you already have, and its numbers, are not touched** —
          # including a campaign you run on from your organization.
          #
          # **Each call files a new campaign**, which is charged when it is submitted. Send
          # an `Idempotency-Key` so a retried request does not file a second one.
          #
          # To change the campaign a market already has, use
          # `PATCH /v3/channels/sms/US/TEN_DLC`. Once a market holds more than one campaign,
          # that `PATCH` refuses a campaign or numbers change (`409`) rather than guess
          # which campaign is meant; numbers are added to a named campaign with
          # `POST /v3/channels/sms/numbers/US/TEN_DLC`.
          #
          # Returns **the market**, in the shape `GET /v3/channels/sms/US/TEN_DLC` returns,
          # with `202`.
          sig do
            params(
              idempotency_key: String,
              description: String,
              help_keywords: String,
              help_message: String,
              message_flow: String,
              opt_in_keywords: String,
              opt_in_message: String,
              opt_out_keywords: String,
              opt_out_message: String,
              privacy_policy_link: String,
              sandbox: T::Boolean,
              terms_and_conditions_link: String,
              use_cases:
                T::Array[
                  Sentdm::Channels::SMS::TenDlcAddCampaignParams::UseCase::OrHash
                ],
              volume: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(Sentdm::Channels::APIResponseOfSMSMarket)
          end
          def add_campaign(
            # Header param: Unique key to ensure idempotent request processing. Must be 1-255
            # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
            # hours per key per customer.
            idempotency_key:,
            # Body param: What this programme sends. TCR description: what recipients will get
            # and why, in a sentence. The only one of these TCR takes verbatim as a
            # description of the programme, which is why it is asked for rather than derived
            # from the customer's name. Required when `compliance.campaign.inherit != true`.
            description: nil,
            # Body param: Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO.
            # Required when `compliance.campaign.inherit != true`.
            help_keywords: nil,
            # Body param: Help reply. TCR helpMessage. Its presence is what sets
            # subscriberHelp. Required when `compliance.campaign.inherit != true`.
            help_message: nil,
            # Body param: Consent narrative. TCR messageFlow: how recipients opt in, in prose.
            # Under 40 characters is refused, and carriers reject vague descriptions — say
            # where opt-in happens, that the box is unchecked by default, and that consent is
            # not a condition of purchase. Required when
            # `compliance.campaign.inherit != true`.
            message_flow: nil,
            # Body param: Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES.
            # Required when `compliance.campaign.inherit != true`.
            opt_in_keywords: nil,
            # Body param: Opt-in confirmation. TCR optinMessage. Should state message
            # frequency and that rates may apply. Its presence is what sets subscriberOptin.
            # Required when `compliance.campaign.inherit != true`.
            opt_in_message: nil,
            # Body param: Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END,
            # CANCEL, UNSUBSCRIBE and QUIT are honoured regardless of what is declared.
            # Required when `compliance.campaign.inherit != true`.
            opt_out_keywords: nil,
            # Body param: Opt-out confirmation. TCR optoutMessage. Its presence is what sets
            # subscriberOptout. Required when `compliance.campaign.inherit != true`.
            opt_out_message: nil,
            # Body param: Privacy policy URL. TCR privacyPolicyLink. Required when
            # `compliance.campaign.inherit != true`.
            privacy_policy_link: nil,
            # Body param: Sandbox flag - when true, the operation is simulated without side
            # effects Useful for testing integrations without actual execution
            sandbox: nil,
            # Body param: Terms and conditions URL. TCR termsAndConditionsLink. Required when
            # `compliance.campaign.inherit != true`.
            terms_and_conditions_link: nil,
            # Body param: Use cases. What the campaign sends, and an example of each. One to
            # five entries; how they register is decided by volume, never declared. Required
            # when `compliance.campaign.inherit != true`.
            use_cases: nil,
            # Body param: Expected monthly volume. Decides how the campaign registers and
            # which fee tier applies: below the low-volume threshold it registers as
            # LOW_VOLUME with sub-use-cases, above it as a single use case or MIXED. Omitting
            # it registers the campaign at the higher-fee standard tier.
            volume: nil,
            # Header param: Profile UUID to scope the request to a child profile. Only
            # organization API keys can use this header. The profile must belong to the
            # calling organization.
            x_profile_id: nil,
            request_options: {}
          )
          end

          # Adds numbers to **one campaign of your own** on the US `TEN_DLC` market you
          # hold, named by `campaign_id` — the `id` of an entry in the market's
          # `compliance.campaigns`.
          #
          # ## What to send
          #
          # - `campaign_id` — the campaign. One you inherit from your organization is `400`:
          #   its numbers are the organization's. One out of service — expired, deactivated
          #   or released — is `409`.
          # - `numbers` — the list `POST /v3/channels/sms` takes, one entry per area code.
          #
          # ## What happens
          #
          # The entries are **added** to what the campaign already asks for. With everything
          # it asks for, a campaign holds at most 49 numbers, counting one for each sender
          # profile inheriting it. A campaign the carriers have not approved yet gets its
          # numbers when they do; an approved one gets them now. Until a number is assigned
          # it reads as `PROVISIONING` in the market's `numbers`, with the area code it was
          # asked for.
          #
          # Returns **the market**, in the shape `GET /v3/channels/sms/US/TEN_DLC` returns,
          # with `202`.
          sig do
            params(
              campaign_id: String,
              numbers:
                T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest::OrHash)],
              idempotency_key: String,
              sandbox: T::Boolean,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(Sentdm::Channels::APIResponseOfSMSMarket)
          end
          def add_numbers(
            # Body param: The campaign to add the numbers to, as compliance.campaigns[].id
            # reports it. Required.
            campaign_id:,
            # Body param: The numbers to add, one entry per area code, e.g. [{"area_code":
            # "415", "quantity": 2}, {"quantity": 1}]. quantity defaults to 1, and an entry
            # without area_code means any area code. Required.
            #
            # Added to what the campaign already asks for, never replacing it.
            numbers:,
            # Header param: Unique key to ensure idempotent request processing. Must be 1-255
            # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
            # hours per key per customer.
            idempotency_key:,
            # Body param: Sandbox flag - when true, the operation is simulated without side
            # effects Useful for testing integrations without actual execution
            sandbox: nil,
            # Header param: Profile UUID to scope the request to a child profile. Only
            # organization API keys can use this header. The profile must belong to the
            # calling organization.
            x_profile_id: nil,
            request_options: {}
          )
          end

          # Reads what the US `TEN_DLC` market you hold has registered: the `brand` it files
          # under, **every campaign** under `campaigns` (each with its `id` and `inherit`),
          # and its `documents`. It is the `compliance` object
          # `GET /v3/channels/sms/US/TEN_DLC` returns, without the sender and numbers.
          #
          # Use a campaign's `id` to change it with
          # `PATCH /v3/channels/sms/compliances/US/TEN_DLC/campaigns/{campaignId}`, or to
          # add numbers to it with `POST /v3/channels/sms/numbers/US/TEN_DLC`.
          #
          # Send `x-profile-id` with an organization key to read one of your profiles'
          # markets.
          sig do
            params(
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(Sentdm::Channels::SMS::APIResponseOfSuppliedCompliance)
          end
          def retrieve_compliance(
            # Profile UUID to scope the request to a child profile. Only organization API keys
            # can use this header. The profile must belong to the calling organization.
            x_profile_id: nil,
            request_options: {}
          )
          end

          # Changes **one campaign of your own** on the US `TEN_DLC` market, named by its
          # `id` in the market's `compliance.campaigns`.
          #
          # ## What to send
          #
          # The fields to change, at the top level of the body, under the
          # `compliance.campaign.*` keys
          # `GET /v3/compliance/requirements?country=US&type=TEN_DLC` lists, without that
          # prefix. A field you leave out keeps its value, and a rejected one is keyed by
          # its name. `id` and `"inherit": false` are ignored, so an entry of
          # `compliance.campaigns` can be sent as read; `"inherit": true` is `400`, because
          # this call changes a campaign's fields, not whose campaign you run on. The
          # campaign only: add numbers with `POST /v3/channels/sms/numbers/US/TEN_DLC`, and
          # change the brand or documents with `PATCH /v3/channels/sms/US/TEN_DLC`.
          #
          # ## When it can be changed
          #
          # Until it is filed with The Campaign Registry, and again when we ask you to
          # correct it. That correction sends it back for review. A filed campaign is
          # otherwise `409`, and so is a change between low and high volume once it is
          # registered. A campaign you run on from your organization is `409` too: it is the
          # organization's to change. So is one out of service: expired, deactivated or
          # released.
          #
          # Returns **the market**, in the shape `GET /v3/channels/sms/US/TEN_DLC` returns.
          sig do
            params(
              campaign_id: String,
              description: String,
              help_keywords: String,
              help_message: String,
              message_flow: String,
              opt_in_keywords: String,
              opt_in_message: String,
              opt_out_keywords: String,
              opt_out_message: String,
              privacy_policy_link: String,
              sandbox: T::Boolean,
              terms_and_conditions_link: String,
              use_cases:
                T::Array[
                  Sentdm::Channels::SMS::TenDlcUpdateCampaignParams::UseCase::OrHash
                ],
              volume: String,
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(Sentdm::Channels::APIResponseOfSMSMarket)
          end
          def update_campaign(
            # Path param: The campaign: its id in the market's compliance.campaigns.
            campaign_id,
            # Body param: What this programme sends. TCR description: what recipients will get
            # and why, in a sentence. The only one of these TCR takes verbatim as a
            # description of the programme, which is why it is asked for rather than derived
            # from the customer's name. Required when `compliance.campaign.inherit != true`.
            description: nil,
            # Body param: Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO.
            # Required when `compliance.campaign.inherit != true`.
            help_keywords: nil,
            # Body param: Help reply. TCR helpMessage. Its presence is what sets
            # subscriberHelp. Required when `compliance.campaign.inherit != true`.
            help_message: nil,
            # Body param: Consent narrative. TCR messageFlow: how recipients opt in, in prose.
            # Under 40 characters is refused, and carriers reject vague descriptions — say
            # where opt-in happens, that the box is unchecked by default, and that consent is
            # not a condition of purchase. Required when
            # `compliance.campaign.inherit != true`.
            message_flow: nil,
            # Body param: Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES.
            # Required when `compliance.campaign.inherit != true`.
            opt_in_keywords: nil,
            # Body param: Opt-in confirmation. TCR optinMessage. Should state message
            # frequency and that rates may apply. Its presence is what sets subscriberOptin.
            # Required when `compliance.campaign.inherit != true`.
            opt_in_message: nil,
            # Body param: Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END,
            # CANCEL, UNSUBSCRIBE and QUIT are honoured regardless of what is declared.
            # Required when `compliance.campaign.inherit != true`.
            opt_out_keywords: nil,
            # Body param: Opt-out confirmation. TCR optoutMessage. Its presence is what sets
            # subscriberOptout. Required when `compliance.campaign.inherit != true`.
            opt_out_message: nil,
            # Body param: Privacy policy URL. TCR privacyPolicyLink. Required when
            # `compliance.campaign.inherit != true`.
            privacy_policy_link: nil,
            # Body param: Sandbox flag - when true, the operation is simulated without side
            # effects Useful for testing integrations without actual execution
            sandbox: nil,
            # Body param: Terms and conditions URL. TCR termsAndConditionsLink. Required when
            # `compliance.campaign.inherit != true`.
            terms_and_conditions_link: nil,
            # Body param: Use cases. What the campaign sends, and an example of each. One to
            # five entries; how they register is decided by volume, never declared. Required
            # when `compliance.campaign.inherit != true`.
            use_cases: nil,
            # Body param: Expected monthly volume. Decides how the campaign registers and
            # which fee tier applies: below the low-volume threshold it registers as
            # LOW_VOLUME with sub-use-cases, above it as a single use case or MIXED. Omitting
            # it registers the campaign at the higher-fee standard tier.
            volume: nil,
            # Header param: Unique key to ensure idempotent request processing. Must be 1-255
            # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
            # hours per key per customer.
            idempotency_key: nil,
            # Header param: Profile UUID to scope the request to a child profile. Only
            # organization API keys can use this header. The profile must belong to the
            # calling organization.
            x_profile_id: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Sentdm::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
