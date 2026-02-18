# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateBody < Sentdm::Internal::Type::BaseModel
      # @!attribute multi_channel
      #   Content that will be used for all channels (SMS and WhatsApp) unless
      #   channel-specific content is provided
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :multi_channel, -> { Sentdm::TemplateBodyContent }, api_name: :multiChannel, nil?: true

      # @!attribute sms
      #   SMS-specific content that overrides multi-channel content for SMS messages
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :sms, -> { Sentdm::TemplateBodyContent }, nil?: true

      # @!attribute whatsapp
      #   WhatsApp-specific content that overrides multi-channel content for WhatsApp
      #   messages
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :whatsapp, -> { Sentdm::TemplateBodyContent }, nil?: true

      # @!method initialize(multi_channel: nil, sms: nil, whatsapp: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateBody} for more
      #   details.
      #
      #   Body section of a message template with channel-specific content
      #
      #   @param multi_channel [Sentdm::Models::TemplateBodyContent, nil] Content that will be used for all channels (SMS and WhatsApp) unless channel-spe
      #
      #   @param sms [Sentdm::Models::TemplateBodyContent, nil] SMS-specific content that overrides multi-channel content for SMS messages
      #
      #   @param whatsapp [Sentdm::Models::TemplateBodyContent, nil] WhatsApp-specific content that overrides multi-channel content for WhatsApp mess
    end
  end
end
