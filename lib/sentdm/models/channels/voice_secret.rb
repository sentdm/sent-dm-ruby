# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class VoiceSecret < Sentdm::Internal::Type::BaseModel
        # @!attribute callback_secret
        #   The new whsec\_ secret. The previous one stopped signing the moment this was
        #   returned, so update your backend before the next call reaches it. Shown once.
        #
        #   @return [String, nil]
        optional :callback_secret, String

        # @!method initialize(callback_secret: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceSecret} for more details.
        #
        #   A freshly rotated callback signing secret
        #
        #   @param callback_secret [String] The new whsec\_ secret. The previous one stopped signing the moment this was
        #   retu
      end
    end
  end
end
