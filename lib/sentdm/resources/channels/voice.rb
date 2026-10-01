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
      # and voice tokens are minted under `POST /v3/channels/voice/tokens`. Read your
      # voice numbers with `GET /v3/channels/voice` and change one with
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
      class Voice
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::VoiceCreateParams} for more details.
        #
        # Adds voice to one of the numbers you hold, or gives you a new one. Send `number`
        # for a number that is already yours (see `GET /v3/channels`); leave it out to be
        # given a new US number, optionally in a particular `area_code`. Sending both is
        # refused. Nothing registers, so the number can carry calls as soon as this
        # returns.
        #
        # What happens on a call is decided by your `callback_url`: when a call arrives on
        # the number, or a caller presses a key on a menu, Sent POSTs a signed question
        # there and follows the answer. The response carries the `callback_secret` the
        # questions are signed with, the one time it is shown without rotating; verify a
        # question the way you verify a webhook. `POST /v3/channels/voice/{number}/test`
        # sends a test question and reports the verdict.
        #
        # Your first voice number becomes the line app-originated calls are placed from
        # when a voice token names no number; send `default_for_app_calls: true` to give
        # that role to another number. A number you turned off earlier is turned back on,
        # and the same number with a different `callback_url` has its URL replaced and
        # keeps its secret.
        #
        # Read the number's settings with `GET /v3/channels/voice` and change them with
        # `PATCH /v3/channels/voice/{number}`.
        #
        # With `sandbox: true` the request is validated and a simulated number reported
        # with `202`; nothing is written and no number is bought.
        #
        # @overload create(callback_url:, area_code: nil, default_for_app_calls: nil, number: nil, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param callback_url [String] Body param: Where Sent asks what to do with each call on this number: an absolut
        #
        # @param area_code [String, nil] Body param: The US area code a new number should be in, as 212. Only for a reque
        #
        # @param default_for_app_calls [Boolean, nil] Body param: Make this the line app-originated calls are placed from when a voice
        #
        # @param number [String, nil] Body param: One of your phone numbers, in E.164 format. Leave the field out enti
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfVoiceNumberCreated]
        #
        # @see Sentdm::Models::Channels::VoiceCreateParams
        def create(params)
          parsed, options = Sentdm::Channels::VoiceCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: "v3/channels/voice",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfVoiceNumberCreated,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::VoiceRetrieveParams} for more details.
        #
        # Reads one of your voice numbers, active or inactive: its status, whether it is
        # the default line for calls placed from your app, and its callback URL. The
        # signing secret is not on this read.
        #
        # The same shape `GET /v3/channels/voice` lists, and the same shape `PATCH` on
        # this path accepts and returns, so what comes back can be sent back.
        #
        # The number is the E.164 value in the path with the plus sign URL-encoded
        # (`%2B`).
        #
        # @overload retrieve(number, x_profile_id: nil, request_options: {})
        #
        # @param number [String] The number in E.164 format with the plus sign URL-encoded, e.g. %2B12125550100
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfVoiceNumber]
        #
        # @see Sentdm::Models::Channels::VoiceRetrieveParams
        def retrieve(number, params = {})
          parsed, options = Sentdm::Channels::VoiceRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v3/channels/voice/%1$s", number],
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Channels::APIResponseOfVoiceNumber,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::VoiceUpdateParams} for more details.
        #
        # Changes one of your voice numbers and answers with the number as stored, the
        # same shape `GET` on this path returns, so what comes back can be sent back.
        #
        # ## What it changes
        #
        # | Body                                          | Effect                                                                                                                                                     |
        # | --------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
        # | `"status": "ACTIVE"`                          | turns calls on again for a number you turned off; the callback URL and the secret it had are kept                                                          |
        # | `"status": "INACTIVE"`                        | turns calls off; the callback URL and the secret stay on the number                                                                                        |
        # | `"default_for_app_calls": true`               | makes this the line app-originated calls are placed from when a voice token names no number                                                                |
        # | `"callback_url": "https://example.com/voice"` | replaces where Sent asks what to do with each call on the number; the signing secret is kept, and a number that was waiting for its first URL is turned on |
        # | key omitted                                   | left exactly as it is                                                                                                                                      |
        #
        # `status` is matched ignoring case. Any combination is accepted:
        # `status: "ACTIVE"` with `default_for_app_calls: true` turns a number on as the
        # new default, and a `callback_url` sent with either status is written too. A body
        # that names none of the three is refused.
        #
        # ## What it will refuse
        #
        # **`default_for_app_calls: false` is `400`.** An account with active voice
        # numbers always has exactly one default, so the default moves by giving it to
        # another number.
        #
        # **Turning the default line off is `409`** while other active voice numbers
        # remain. Move the default to another number first. Turning off your last voice
        # number is allowed; that turns phone calls off.
        #
        # **Making an inactive number the default is `400`.** Send `status: "ACTIVE"` in
        # the same call.
        #
        # A number added without a `callback_url` is `INACTIVE` for that one reason, so
        # sending it a `callback_url` turns it on by itself, and it becomes your default
        # line if you have no other active voice number. A number you turned off while it
        # had a URL stays off.
        #
        # **A number you never turned voice on for is `404`.** Add it with
        # `POST /v3/channels/voice`.
        #
        # The number is the E.164 value in the path with the plus sign URL-encoded
        # (`%2B`).
        #
        # With `sandbox: true` nothing is written: the request is validated against the
        # stored number and the number is reported with `200` as it would read after the
        # change.
        #
        # @overload update(number, callback_url: nil, default_for_app_calls: nil, sandbox: nil, status: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param number [String] Path param: The number in E.164 format with the plus sign URL-encoded, e.g. %2B1
        #
        # @param callback_url [String, nil] Body param: A new callback URL for the number, active or not: an absolute HTTP o
        #
        # @param default_for_app_calls [Boolean, nil] Body param: true makes this the line app-originated calls are placed from when a
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param status [Symbol, Sentdm::Models::Channels::VoiceUpdateParams::Status, nil] Body param: ACTIVE turns calls on for the number again, INACTIVE turns them off.
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfVoiceNumber]
        #
        # @see Sentdm::Models::Channels::VoiceUpdateParams
        def update(number, params = {})
          parsed, options = Sentdm::Channels::VoiceUpdateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :patch,
            path: ["v3/channels/voice/%1$s", number],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfVoiceNumber,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::VoiceListParams} for more details.
        #
        # Every number you turned phone calls on for, active or inactive, oldest first.
        # Each entry carries the number's status, whether it is the default line for calls
        # placed from your app, and its callback URL. The signing secret is never on a
        # read; it is shown when voice is turned on and by
        # `POST /v3/channels/voice/{number}/rotate-secret`.
        #
        # The same entries `GET /v3/channels` reports under `voice`, and the same shape
        # `GET /v3/channels/voice/{number}` returns for one of them. Change a number with
        # `PATCH /v3/channels/voice/{number}`.
        #
        # @overload list(x_profile_id: nil, request_options: {})
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfListOfVoiceNumber]
        #
        # @see Sentdm::Models::Channels::VoiceListParams
        def list(params = {})
          parsed, options = Sentdm::Channels::VoiceListParams.dump_request(params)
          @client.request(
            method: :get,
            path: "v3/channels/voice",
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Channels::APIResponseOfListOfVoiceNumber,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::VoiceCreateTokenParams} for more details.
        #
        # Mints a short-lived token for one of your app users. Call this from your backend
        # and return the token to your app, which passes it to the voice client SDK to
        # register. The identity is bound to the given number, or to your default app-call
        # number when omitted, and calls placed by that identity are routed through the
        # bound number. Minting again re-binds the identity, so an identity can move
        # between numbers.
        #
        # @overload create_token(identity: nil, number: nil, sandbox: nil, ttl: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param identity [String] Body param: Your identifier for the app user, such as an agent or account id. Le
        #
        # @param number [String, nil] Body param: One of your voice-enabled phone numbers in E.164 format. Calls place
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param ttl [Integer, nil] Body param: Token lifetime in seconds. Defaults to 600 and cannot exceed 3600.
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfVoiceToken]
        #
        # @see Sentdm::Models::Channels::VoiceCreateTokenParams
        def create_token(params = {})
          parsed, options = Sentdm::Channels::VoiceCreateTokenParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: "v3/channels/voice/tokens",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfVoiceToken,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::VoiceRotateSecretParams} for more details.
        #
        # Generates a new signing secret for the questions Sent sends to this number's
        # callback URL and returns it. The previous secret stops signing immediately, so
        # update your backend before the next call reaches it. The number is the E.164
        # value in the path with the plus sign URL-encoded (`%2B`).
        #
        # With `sandbox: true` a secret is generated and returned with `202`, and nothing
        # is written.
        #
        # @overload rotate_secret(number, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param number [String] Path param: The voice number from the route, in E.164 format with the plus sign
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfVoiceSecret]
        #
        # @see Sentdm::Models::Channels::VoiceRotateSecretParams
        def rotate_secret(number, params = {})
          parsed, options = Sentdm::Channels::VoiceRotateSecretParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: ["v3/channels/voice/%1$s/rotate-secret", number],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfVoiceSecret,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Channels::VoiceTestParams} for more details.
        #
        # Sends a synthetic call.request question, flagged "test": true, to the number's
        # callback URL, signed with that number's real secret, and reports what came back.
        # Use it to build and debug your callback endpoint without placing calls: no call
        # is placed, nothing is billed, and nothing is stored. One attempt with the same
        # deadline as a live call, no retry. The outcome is ok when your endpoint answered
        # 2xx with a valid answer; otherwise it is timeout, connection_failed, http_error
        # or invalid_answer, with the reason and, for an invalid answer, the field at
        # fault. The number is the E.164 value in the path with the plus sign URL-encoded
        # (`%2B`).
        #
        # With `sandbox: true` nothing is sent: the verdict comes back ok with `202` and
        # no request or response in it.
        #
        # @overload test_(number, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param number [String] Path param: The voice number from the route, in E.164 format with the plus sign
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Channels::APIResponseOfVoiceCallbackTest]
        #
        # @see Sentdm::Models::Channels::VoiceTestParams
        def test_(number, params = {})
          parsed, options = Sentdm::Channels::VoiceTestParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: ["v3/channels/voice/%1$s/test", number],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Channels::APIResponseOfVoiceCallbackTest,
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
