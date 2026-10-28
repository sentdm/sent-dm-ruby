# frozen_string_literal: true

module Sentdm
  module Models
    module Voice
      class VoiceAgentSecret < Sentdm::Internal::Type::BaseModel
        # @!attribute signing_secret
        #   The new whsec\_ secret. The previous one stopped signing the moment this was
        #   returned. Shown once.
        #
        #   @return [String, nil]
        optional :signing_secret, String

        # @!method initialize(signing_secret: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Voice::VoiceAgentSecret} for more details.
        #
        #   A freshly rotated signing secret.
        #
        #   @param signing_secret [String] The new whsec\_ secret. The previous one stopped signing the moment this was
        #   retu
      end
    end

    VoiceAgentSecret = Voice::VoiceAgentSecret
  end
end
