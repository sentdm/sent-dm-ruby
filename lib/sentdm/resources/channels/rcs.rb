# frozen_string_literal: true

module Sentdm
  module Resources
    class Channels
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
      class Rcs
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::RcCreateParams} for more details.
        #
        # Asks for an RCS agent and records the order form the carriers vet it against.
        # Always `202`: an agent is approved by the carriers, not by this call, and
        # nothing here can make that happen sooner.
        #
        # ## What it asks for
        #
        # The RCS Agent Order Form — the same one our team fills in on your behalf today,
        # so nothing has to be collected from you twice. **All fields are required** and
        # must be submitted together so the carrier review has everything it needs. The
        # only exception is `opt_in_screenshot_url`.
        #
        # **Agent identity:** `display_name`, `description`, `agent_use_case` (must be one
        # of the accepted use cases; the error names the set), `brand_color` (six-digit
        # hex, `#RRGGBB`).
        #
        # **Brand identity:** `brand_name` — the brand this agent presents. Not taken from
        # `compliance.brand`: a business may present a different brand on RCS than the one
        # its 10DLC registration is filed against, and the carriers vet this one.
        # `privacy_policy_url`, `terms_and_conditions_url`, `website_url`, `logo_url`, and
        # `banner_url` must be absolute `http(s)` URLs that the carriers can fetch without
        # authentication. The form specifies 224×224 px and 50 KB for the logo and
        # 1440×448 px and 200 KB for the banner; these cannot be checked without the image
        # bytes.
        #
        # **Contact details:** `brand_phone_number`, `customer_support_phone_number`,
        # `brand_email`, `customer_support_email`, `contact_name_and_title`.
        #
        # **Company:** `company_ein`, `entity_type`, `official_address` (street, city,
        # state, postal_code, country), `brief_company_description`.
        #
        # **Consent and messages:** `opt_in_process_description`, `start_message`,
        # `help_message`, `stop_message`, `sample_messages` (at least one example
        # message).
        #
        # **Optional:** `opt_in_screenshot_url` (validated as an http(s) URL if supplied).
        #
        # Anything supplied is checked against accepted values rather than passed through:
        # a value the provider rejects would otherwise surface days later, to somebody who
        # cannot fix it without asking you.
        #
        # **A customer has one agent.** Asking again while you have one is `409`.
        #
        # ## What comes back, and what does not
        #
        # Returns **the agent** — the form as stored, plus `id` and `status`. Not your
        # other channels, which this call cannot have changed.
        #
        # `status` is `PROVISIONING` until the agent is handed to the carriers and
        # approved. **`GET /v3/channels` reports `rcs: null` until then** — a channel row
        # is what routing reads to decide you are sendable, and writing one for an
        # unapproved agent would claim a channel that cannot carry traffic.
        #
        # Send `x-profile-id` with an organization key to ask for one of your profiles'
        # agents.
        #
        # @overload create(agent_use_case: nil, banner_url: nil, brand_color: nil, brand_email: nil, brand_name: nil, brand_phone_number: nil, brief_company_description: nil, company_ein: nil, contact_name_and_title: nil, customer_support_email: nil, customer_support_phone_number: nil, description: nil, display_name: nil, entity_type: nil, help_message: nil, logo_url: nil, official_address: nil, opt_in_process_description: nil, opt_in_screenshot_url: nil, privacy_policy_url: nil, sample_messages: nil, sandbox: nil, start_message: nil, stop_message: nil, terms_and_conditions_url: nil, website_url: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param agent_use_case [Symbol, Sentdm::Models::Channels::RcCreateParams::AgentUseCase] Body param: Which kind of traffic the agent carries. One of the accepted use cas
        #
        # @param banner_url [String] Body param
        #
        # @param brand_color [String] Body param: Primary brand colour, as #RRGGBB. Three-digit shorthand is refused:
        #
        # @param brand_email [String] Body param
        #
        # @param brand_name [String] Body param: The brand this agent presents over RCS.
        #
        # @param brand_phone_number [String] Body param: The brand's own number. Also becomes the agent's canonical sending n
        #
        # @param brief_company_description [String] Body param
        #
        # @param company_ein [String] Body param
        #
        # @param contact_name_and_title [String] Body param
        #
        # @param customer_support_email [String] Body param
        #
        # @param customer_support_phone_number [String] Body param
        #
        # @param description [String] Body param: What the agent is for, shown to recipients. Capped by the carriers,
        #
        # @param display_name [String] Body param: The name the agent shows in the messaging client.
        #
        # @param entity_type [String] Body param
        #
        # @param help_message [String] Body param
        #
        # @param logo_url [String] Body param: Publicly reachable logo. It has to be fetchable without authenticati
        #
        # @param official_address [Sentdm::Models::Channels::RcsAddress] Body param: The registered address of the company behind the agent.
        #
        # @param opt_in_process_description [String] Body param: How recipients opt in, in prose. The carriers read this one.
        #
        # @param opt_in_screenshot_url [String, nil] Body param: A screenshot of the opt-in, as a publicly fetchable URL.
        #
        # @param privacy_policy_url [String] Body param: Required by US carriers. Must be an absolute http(s) URL they can fe
        #
        # @param sample_messages [Array<String>] Body param: Examples of what the agent will send, for the review.
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param start_message [String] Body param
        #
        # @param stop_message [String] Body param
        #
        # @param terms_and_conditions_url [String] Body param
        #
        # @param website_url [String] Body param: The brand's own site.
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfRcsAgent]
        #
        # @see Sentdm::Models::Channels::RcCreateParams
        def create(params = {})
          parsed, options = Sentdm::Channels::RcCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: "v3/channels/rcs",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfRcsAgent,
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
