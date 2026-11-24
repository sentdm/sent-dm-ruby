# frozen_string_literal: true

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
          # Some parameter documentations has been truncated, see
          # {Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams} for more details.
          #
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
          #
          # @overload add_campaign(description:, help_keywords:, help_message:, message_flow:, opt_in_keywords:, opt_in_message:, opt_out_keywords:, opt_out_message:, privacy_policy_link:, terms_and_conditions_link:, use_cases:, volume:, idempotency_key:, sandbox: nil, x_profile_id: nil, request_options: {})
          #
          # @param description [String] Body param: What this programme sends. TCR description: what recipients will get
          #
          # @param help_keywords [String] Body param: Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Re
          #
          # @param help_message [String] Body param: Help reply. TCR helpMessage. Its presence is what sets subscriberHel
          #
          # @param message_flow [String] Body param: Consent narrative. TCR messageFlow: how recipients opt in, in prose.
          #
          # @param opt_in_keywords [String] Body param: Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES.
          #
          # @param opt_in_message [String] Body param: Opt-in confirmation. TCR optinMessage. Should state message frequenc
          #
          # @param opt_out_keywords [String] Body param: Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CA
          #
          # @param opt_out_message [String] Body param: Opt-out confirmation. TCR optoutMessage. Its presence is what sets s
          #
          # @param privacy_policy_link [String] Body param: Privacy policy URL. TCR privacyPolicyLink. Required when `compliance
          #
          # @param terms_and_conditions_link [String] Body param: Terms and conditions URL. TCR termsAndConditionsLink. Required when
          #
          # @param use_cases [Array<Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams::UseCase>] Body param: Use cases. What the campaign sends, and an example of each. One to f
          #
          # @param volume [String] Body param: Expected monthly volume. Required whenever the campaign's fields are
          #
          # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
          #
          # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
          #
          # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
          #
          # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sentdm::Models::Channels::APIResponseOfChannelMarket]
          #
          # @see Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams
          def add_campaign(params)
            parsed, options = Sentdm::Channels::SMS::TenDlcAddCampaignParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
            @client.request(
              method: :post,
              path: "v3/channels/sms/US/TEN_DLC/campaigns",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Sentdm::Channels::APIResponseOfChannelMarket,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {Sentdm::Models::Channels::SMS::TenDlcListCampaignsParams} for more details.
          #
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
          #
          # @overload list_campaigns(x_profile_id: nil, request_options: {})
          #
          # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
          #
          # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sentdm::Models::Channels::SMS::TenDlcListCampaignsResponse]
          #
          # @see Sentdm::Models::Channels::SMS::TenDlcListCampaignsParams
          def list_campaigns(params = {})
            parsed, options = Sentdm::Channels::SMS::TenDlcListCampaignsParams.dump_request(params)
            @client.request(
              method: :get,
              path: "v3/channels/sms/US/TEN_DLC/campaigns",
              headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
              model: Sentdm::Models::Channels::SMS::TenDlcListCampaignsResponse,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {Sentdm::Models::Channels::SMS::TenDlcUpdateCampaignParams} for more details.
          #
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
          #
          # @overload update_campaign(campaign_id, description: nil, help_keywords: nil, help_message: nil, message_flow: nil, opt_in_keywords: nil, opt_in_message: nil, opt_out_keywords: nil, opt_out_message: nil, privacy_policy_link: nil, sandbox: nil, terms_and_conditions_link: nil, use_cases: nil, volume: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
          #
          # @param campaign_id [String] Path param: The campaign: its id in the market's compliance.campaigns.
          #
          # @param description [String] Body param: What this programme sends. TCR description: what recipients will get
          #
          # @param help_keywords [String] Body param: Help keywords. TCR helpKeywords, comma separated, e.g. HELP,INFO. Re
          #
          # @param help_message [String] Body param: Help reply. TCR helpMessage. Its presence is what sets subscriberHel
          #
          # @param message_flow [String] Body param: Consent narrative. TCR messageFlow: how recipients opt in, in prose.
          #
          # @param opt_in_keywords [String] Body param: Opt-in keywords. TCR optinKeywords, comma separated, e.g. START,YES.
          #
          # @param opt_in_message [String] Body param: Opt-in confirmation. TCR optinMessage. Should state message frequenc
          #
          # @param opt_out_keywords [String] Body param: Opt-out keywords. TCR optoutKeywords, comma separated. STOP, END, CA
          #
          # @param opt_out_message [String] Body param: Opt-out confirmation. TCR optoutMessage. Its presence is what sets s
          #
          # @param privacy_policy_link [String] Body param: Privacy policy URL. TCR privacyPolicyLink. Required when `compliance
          #
          # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
          #
          # @param terms_and_conditions_link [String] Body param: Terms and conditions URL. TCR termsAndConditionsLink. Required when
          #
          # @param use_cases [Array<Sentdm::Models::Channels::SMS::TenDlcUpdateCampaignParams::UseCase>] Body param: Use cases. What the campaign sends, and an example of each. One to f
          #
          # @param volume [String] Body param: Expected monthly volume. Required whenever the campaign's fields are
          #
          # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
          #
          # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
          #
          # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sentdm::Models::Channels::APIResponseOfChannelMarket]
          #
          # @see Sentdm::Models::Channels::SMS::TenDlcUpdateCampaignParams
          def update_campaign(campaign_id, params = {})
            parsed, options = Sentdm::Channels::SMS::TenDlcUpdateCampaignParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
            @client.request(
              method: :patch,
              path: ["v3/channels/sms/US/TEN_DLC/campaigns/%1$s", campaign_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Sentdm::Channels::APIResponseOfChannelMarket,
              options: options
            )
          end

          # @api private
          #
          # @param client [Sentdm::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
