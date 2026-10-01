# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class VoiceNumberCreated < Sentdm::Models::Channels::VoiceNumber
        # @!attribute callback_secret
        #   The whsec\_ secret every question to callback_url is signed with. Shown here and
        #   by POST /v3/channels/voice/{number}/rotate-secret, nowhere else: store it now.
        #   Verify a question exactly as you verify a webhook, with X-Webhook-ID,
        #   X-Webhook-Timestamp and the body.
        #
        #   @return [String, nil]
        optional :callback_secret, String

        # @!method initialize(callback_secret: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceNumberCreated} for more details.
        #
        #   One number the profile carries phone calls on.
        #
        #   @param callback_secret [String] The whsec\_ secret every question to callback_url is signed with. Shown here and
      end
    end
  end
end
