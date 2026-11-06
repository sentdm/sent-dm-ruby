# typed: strong

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
        sig do
          params(
            agent_use_case:
              Sentdm::Channels::RcCreateParams::AgentUseCase::OrSymbol,
            banner_url: String,
            brand_color: String,
            brand_email: String,
            brand_name: String,
            brand_phone_number: String,
            brief_company_description: String,
            company_ein: String,
            contact_name_and_title: String,
            customer_support_email: String,
            customer_support_phone_number: String,
            description: String,
            display_name: String,
            entity_type: String,
            help_message: String,
            logo_url: String,
            official_address: Sentdm::Channels::RcsAddress::OrHash,
            opt_in_process_description: String,
            opt_in_screenshot_url: T.nilable(String),
            privacy_policy_url: String,
            sample_messages: T::Array[String],
            sandbox: T::Boolean,
            start_message: String,
            stop_message: String,
            terms_and_conditions_url: String,
            website_url: String,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Channels::APIResponseOfRcsAgent)
        end
        def create(
          # Body param: Which kind of traffic the agent carries. One of the accepted use
          # cases; the error names the set.
          agent_use_case: nil,
          # Body param
          banner_url: nil,
          # Body param: Primary brand colour, as #RRGGBB. Three-digit shorthand is refused:
          # the value is submitted verbatim, so two spellings of one colour is only a way
          # for the stored value to disagree with the form.
          brand_color: nil,
          # Body param
          brand_email: nil,
          # Body param: The brand this agent presents over RCS.
          #
          # Not taken from your compliance.brand: a business may present a different brand
          # on RCS than the one its 10DLC registration is filed against, and the carriers
          # vet this one.
          brand_name: nil,
          # Body param: The brand's own number. Also becomes the agent's canonical sending
          # number for routing, which is why it is normalised to E.164 rather than stored as
          # sent.
          brand_phone_number: nil,
          # Body param
          brief_company_description: nil,
          # Body param
          company_ein: nil,
          # Body param
          contact_name_and_title: nil,
          # Body param
          customer_support_email: nil,
          # Body param
          customer_support_phone_number: nil,
          # Body param: What the agent is for, shown to recipients. Capped by the carriers,
          # not by us.
          description: nil,
          # Body param: The name the agent shows in the messaging client.
          display_name: nil,
          # Body param
          entity_type: nil,
          # Body param
          help_message: nil,
          # Body param: Publicly reachable logo. It has to be fetchable without
          # authentication at review time, so a URL behind a login passes this call and
          # fails the review.
          logo_url: nil,
          # Body param: The registered address of the company behind the agent.
          official_address: nil,
          # Body param: How recipients opt in, in prose. The carriers read this one.
          opt_in_process_description: nil,
          # Body param: A screenshot of the opt-in, as a publicly fetchable URL.
          opt_in_screenshot_url: nil,
          # Body param: Required by US carriers. Must be an absolute http(s) URL they can
          # fetch.
          privacy_policy_url: nil,
          # Body param: Examples of what the agent will send, for the review.
          sample_messages: nil,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Body param
          start_message: nil,
          # Body param
          stop_message: nil,
          # Body param
          terms_and_conditions_url: nil,
          # Body param: The brand's own site.
          website_url: nil,
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
