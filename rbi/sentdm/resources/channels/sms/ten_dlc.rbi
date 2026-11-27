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
          # narrative, volume, sample messages and keywords, under their keys
          # (`description`, `message_flow`, `use_cases`, `volume`, …). It has to be
          # complete. A rejected field is keyed by its name (`description`). `id` and
          # `inherit` are ignored, so an entry of `campaigns` can be sent as read.
          #
          # The identity is the market's and is not sent here. A market whose identity has
          # no registration yet, or one not yet submitted for review, is `400`.
          #
          # ## What happens
          #
          # The campaign is recorded and goes for review; it is not filed with The Campaign
          # Registry by this call. **It comes without numbers**: send its `id` from
          # `compliance.campaigns` to `POST /v3/channels/sms/{country}/{type}/numbers` to
          # give it some. **The campaign you already have, and its numbers, are not
          # touched** — including a campaign you run on from your organization.
          #
          # **Each call files a new campaign**, which is charged when it is submitted. Send
          # an `Idempotency-Key` so a retried request does not file a second one.
          #
          # To change a campaign, use
          # `PATCH /v3/channels/sms/US/TEN_DLC/campaigns/{campaignId}`;
          # `PATCH /v3/channels/sms/US/TEN_DLC` changes the brand and documents only, and
          # refuses a campaign or numbers (`400`).
          #
          # Returns **the market**, in the shape `GET /v3/channels/sms/US/TEN_DLC` returns,
          # with `202`.
          sig do
            params(
              description: String,
              help_keywords: String,
              help_message: String,
              message_flow: String,
              opt_in_keywords: String,
              opt_in_message: String,
              opt_out_keywords: String,
              opt_out_message: String,
              privacy_policy_link: String,
              terms_and_conditions_link: String,
              use_cases:
                T::Array[Sentdm::Channels::SMS::TenDlcCampaignUseCase::OrHash],
              volume: String,
              idempotency_key: String,
              sandbox: T::Boolean,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(Sentdm::Channels::APIResponseOfChannelMarket)
          end
          def add_campaign(
            # Body param: What this programme sends. TCR description: what recipients will get
            # and why, in a sentence. The only one of these TCR takes verbatim as a
            # description of the programme, which is why it is asked for rather than derived
            # from the customer's name. Required when `compliance.campaign.inherit != true`.
            description:,
            # Body param: Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO.
            # Required when `compliance.campaign.inherit != true`.
            help_keywords:,
            # Body param: Help reply. TCR helpMessage. Its presence is what sets
            # subscriberHelp. Required when `compliance.campaign.inherit != true`.
            help_message:,
            # Body param: Consent narrative. TCR messageFlow: how recipients opt in, in prose.
            # Under 40 characters is refused, and carriers reject vague descriptions — say
            # where opt-in happens, that the box is unchecked by default, and that consent is
            # not a condition of purchase. Required when
            # `compliance.campaign.inherit != true`.
            message_flow:,
            # Body param: Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES.
            # Required when `compliance.campaign.inherit != true`.
            opt_in_keywords:,
            # Body param: Opt-in confirmation. TCR optinMessage. Should state message
            # frequency and that rates may apply. Its presence is what sets subscriberOptin.
            # Required when `compliance.campaign.inherit != true`.
            opt_in_message:,
            # Body param: Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END,
            # CANCEL, UNSUBSCRIBE and QUIT are honoured regardless of what is declared.
            # Required when `compliance.campaign.inherit != true`.
            opt_out_keywords:,
            # Body param: Opt-out confirmation. TCR optoutMessage. Its presence is what sets
            # subscriberOptout. Required when `compliance.campaign.inherit != true`.
            opt_out_message:,
            # Body param: Privacy policy URL. TCR privacyPolicyLink. Required when
            # `compliance.campaign.inherit != true`.
            privacy_policy_link:,
            # Body param: Terms and conditions URL. TCR termsAndConditionsLink. Required when
            # `compliance.campaign.inherit != true`.
            terms_and_conditions_link:,
            # Body param: Use cases. What the campaign sends, and an example of each. One to
            # five entries; how they register is decided by volume, never declared. Required
            # when `compliance.campaign.inherit != true`.
            use_cases:,
            # Body param: Expected monthly volume. Required whenever the campaign's fields are
            # written. A whole number of messages, e.g. 1000 or 10000. Decides how the
            # campaign registers and which fee tier applies: below the low-volume threshold it
            # registers as LOW_VOLUME with sub-use-cases, above it as a single use case or
            # MIXED. Omitting it registers the campaign at the higher-fee standard tier.
            # Required when `compliance.campaign.inherit != true`, whenever its block is
            # written.
            volume:,
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

          # Every campaign your US `TEN_DLC` market registers, oldest first, each with its
          # `id`, where it stands and `inherit` (`true` for your organization's) beside its
          # fields — the list `GET /v3/channels/sms/US/TEN_DLC` reports under
          # `compliance.campaigns`. Add one with `POST` on this path, and change one of your
          # own with `PATCH /v3/channels/sms/US/TEN_DLC/campaigns/{id}`.
          #
          # Each campaign has a `status` of its own, so a market on several says which is
          # approved: `ACTIVE` once the carriers have elected it, `PENDING_REVIEW` until
          # then, `ACTION_NEEDED` when it came back for correction, `DECLINED` when the
          # carriers refused it, `INACTIVE` once it has ended. Why the market is held up is
          # the market's own `reason`, which names the campaign concerned. `status` is
          # read-only and ignored when the entry is sent back.
          #
          # A customer without a US `TEN_DLC` market is `404`.
          sig do
            params(
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(
              Sentdm::Models::Channels::SMS::TenDlcListCampaignsResponse
            )
          end
          def list_campaigns(
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
          # The fields to change, at the top level of the body, under their keys
          # (`description`, `message_flow`, `use_cases`, `help_message`, …). A field you
          # leave out keeps its value, and a rejected one is keyed by its name. `id` and
          # `"inherit": false` are ignored, so an entry of `campaigns` can be sent as read;
          # `"inherit": true` is `400`, because this call changes a campaign's fields, not
          # whose campaign you run on. The campaign only: add numbers with
          # `POST /v3/channels/sms/US/TEN_DLC/numbers`, and change the brand or documents
          # with `PATCH /v3/channels/sms/US/TEN_DLC`.
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
                T::Array[Sentdm::Channels::SMS::TenDlcCampaignUseCase::OrHash],
              volume: String,
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(Sentdm::Channels::APIResponseOfChannelMarket)
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
            # Body param: Expected monthly volume. Required whenever the campaign's fields are
            # written. A whole number of messages, e.g. 1000 or 10000. Decides how the
            # campaign registers and which fee tier applies: below the low-volume threshold it
            # registers as LOW_VOLUME with sub-use-cases, above it as a single use case or
            # MIXED. Omitting it registers the campaign at the higher-fee standard tier.
            # Required when `compliance.campaign.inherit != true`, whenever its block is
            # written.
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
