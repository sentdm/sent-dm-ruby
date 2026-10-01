# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class VoiceCallbackTestRequestInfo < Sentdm::Internal::Type::BaseModel
        # @!attribute body
        #   The request body byte for byte. This is what the signature covers.
        #
        #   @return [String, nil]
        optional :body, String

        # @!attribute headers
        #   Every header Sent added, the signature included, so you can compare against what
        #   your endpoint verified. The signing secret itself is never included.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :headers, Sentdm::Internal::Type::HashOf[String]

        # @!attribute url
        #   The callback URL that was called
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(body: nil, headers: nil, url: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceCallbackTestRequestInfo} for more details.
        #
        #   The test question exactly as it was sent
        #
        #   @param body [String] The request body byte for byte. This is what the signature covers.
        #
        #   @param headers [Hash{Symbol=>String}] Every header Sent added, the signature included, so you can compare against what
        #
        #   @param url [String] The callback URL that was called
      end
    end
  end
end
