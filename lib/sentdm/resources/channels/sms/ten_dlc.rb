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
          #
          # @overload add_campaign(compliance: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
          #
          # @param compliance [Sentdm::Models::Channels::MarketCompliance] Body param: The compliance values a market registers with. `brand` and `campaign
          #
          # @param sandbox [Boolean] Body param
          #
          # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
          #
          # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
          #
          # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sentdm::Models::Channels::APIResponseOfSMSMarket]
          #
          # @see Sentdm::Models::Channels::SMS::TenDlcAddCampaignParams
          def add_campaign(params = {})
            parsed, options = Sentdm::Channels::SMS::TenDlcAddCampaignParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
            @client.request(
              method: :post,
              path: "v3/channels/sms/compliances/US/TEN_DLC/campaigns",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Sentdm::Channels::APIResponseOfSMSMarket,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {Sentdm::Models::Channels::SMS::TenDlcAddNumbersParams} for more details.
          #
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
          #
          # @overload add_numbers(campaign_id:, numbers:, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
          #
          # @param campaign_id [String] Body param: The campaign to add the numbers to, as compliance.campaigns[].id rep
          #
          # @param numbers [Array<Sentdm::Models::Channels::SMSNumberRequest, nil>] Body param: The numbers to add, one entry per area code, e.g. [{"area_code": "41
          #
          # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
          #
          # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
          #
          # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
          #
          # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sentdm::Models::Channels::APIResponseOfSMSMarket]
          #
          # @see Sentdm::Models::Channels::SMS::TenDlcAddNumbersParams
          def add_numbers(params)
            parsed, options = Sentdm::Channels::SMS::TenDlcAddNumbersParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
            @client.request(
              method: :post,
              path: "v3/channels/sms/numbers/US/TEN_DLC",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Sentdm::Channels::APIResponseOfSMSMarket,
              options: options
            )
          end

          # Some parameter documentations has been truncated, see
          # {Sentdm::Models::Channels::SMS::TenDlcRetrieveComplianceParams} for more
          # details.
          #
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
          #
          # @overload retrieve_compliance(x_profile_id: nil, request_options: {})
          #
          # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
          #
          # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sentdm::Models::Channels::SMS::APIResponseOfSuppliedCompliance]
          #
          # @see Sentdm::Models::Channels::SMS::TenDlcRetrieveComplianceParams
          def retrieve_compliance(params = {})
            parsed, options = Sentdm::Channels::SMS::TenDlcRetrieveComplianceParams.dump_request(params)
            @client.request(
              method: :get,
              path: "v3/channels/sms/compliances/US/TEN_DLC",
              headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
              model: Sentdm::Channels::SMS::APIResponseOfSuppliedCompliance,
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
          #
          # @overload update_campaign(campaign_id, compliance: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
          #
          # @param campaign_id [String] Path param: The campaign: its id in the market's compliance.campaigns.
          #
          # @param compliance [Sentdm::Models::Channels::MarketCompliance] Body param: The compliance values a market registers with. `brand` and `campaign
          #
          # @param sandbox [Boolean] Body param
          #
          # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
          #
          # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
          #
          # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Sentdm::Models::Channels::APIResponseOfSMSMarket]
          #
          # @see Sentdm::Models::Channels::SMS::TenDlcUpdateCampaignParams
          def update_campaign(campaign_id, params = {})
            parsed, options = Sentdm::Channels::SMS::TenDlcUpdateCampaignParams.dump_request(params)
            header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
            @client.request(
              method: :patch,
              path: ["v3/channels/sms/compliances/US/TEN_DLC/campaigns/%1$s", campaign_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Sentdm::Channels::APIResponseOfSMSMarket,
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
