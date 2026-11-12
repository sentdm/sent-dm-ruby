# frozen_string_literal: true

module Sentdm
  module Resources
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
      # @return [Sentdm::Resources::Channels::SMS]
      attr_reader :sms

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
      # @return [Sentdm::Resources::Channels::Rcs]
      attr_reader :rcs

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
      # @return [Sentdm::Resources::Channels::Whatsapp]
      attr_reader :whatsapp

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
      # @return [Sentdm::Resources::Channels::Voice]
      attr_reader :voice

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::ChannelListParams} for more details.
      #
      # Every market you send SMS in, your WhatsApp account, your RCS agent and the
      # numbers you carry phone calls on — with each one's status, and what each market
      # has supplied.
      #
      # **Status lives on the channel, never on you or your brand.** An identity has no
      # lifecycle; what has one is the registration of a sender in a market and the
      # approval of a channel. So a customer live in one country and mid-registration in
      # another reports exactly that, rather than one flattened answer.
      #
      # `sms[n].compliance` carries what each market holds: `brand` and `campaign` for
      # markets that register with a compliance regime such as US TEN_DLC, and
      # `documents` for markets that pre-register an alphanumeric or similar sender.
      # Absent means the market registers with nobody and nothing has been supplied.
      # `GET /v3/compliance/requirements` says what a market demands of any new
      # customer; this says what you gave it.
      #
      # Send `x-profile-id` with an organization key to read one of your profiles'
      # channels.
      #
      # @overload list(x_profile_id: nil, request_options: {})
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseOfChannelsState]
      #
      # @see Sentdm::Models::ChannelListParams
      def list(params = {})
        parsed, options = Sentdm::ChannelListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v3/channels",
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseOfChannelsState,
          options: options
        )
      end

      # @api private
      #
      # @param client [Sentdm::Client]
      def initialize(client:)
        @client = client
        @sms = Sentdm::Resources::Channels::SMS.new(client: client)
        @rcs = Sentdm::Resources::Channels::Rcs.new(client: client)
        @whatsapp = Sentdm::Resources::Channels::Whatsapp.new(client: client)
        @voice = Sentdm::Resources::Channels::Voice.new(client: client)
      end
    end
  end
end
