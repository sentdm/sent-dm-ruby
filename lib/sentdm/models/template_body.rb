# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateBody < Sentdm::Internal::Type::BaseModel
      # @!attribute multi_channel
      #   The shared body, used for every channel. One half of the choice described above.
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :multi_channel, -> { Sentdm::TemplateBodyContent }, api_name: :multiChannel, nil?: true

      # @!attribute rcs
      #   RCS-specific copy that overrides the chosen strategy for RCS only. The one true
      #   override: optional on top of either strategy, but it cannot be the only body
      #   present. Its length cap is the higher one described on Template.
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :rcs, -> { Sentdm::TemplateBodyContent }, nil?: true

      # @!attribute sms
      #   The SMS body. It does not override multiChannel, it replaces it.
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :sms, -> { Sentdm::TemplateBodyContent }, nil?: true

      # @!attribute whatsapp
      #   The WhatsApp body. It does not override multiChannel, it replaces it.
      #
      #   @return [Sentdm::Models::TemplateBodyContent, nil]
      optional :whatsapp, -> { Sentdm::TemplateBodyContent }, nil?: true

      # @!method initialize(multi_channel: nil, rcs: nil, sms: nil, whatsapp: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateBody} for more details.
      #
      #   Body section of a message template.
      #
      #   A body picks one of two authoring strategies, and mixing them is refused
      #   (TemplateDefinitionValidator.HaveValidChannelConfiguration): a shared
      #   multiChannel body on its own, or an explicit sms + whatsapp pair, both present.
      #
      #   multiChannel together with sms or whatsapp is rejected, and so is sms or
      #   whatsapp on its own — every template is expected to be deliverable on every
      #   channel. rcs is the one true override: it may accompany either strategy to vary
      #   the copy, but cannot stand alone.
      #
      #   @param multi_channel [Sentdm::Models::TemplateBodyContent, nil] The shared body, used for every channel. One half of the choice described above.
      #
      #   @param rcs [Sentdm::Models::TemplateBodyContent, nil] RCS-specific copy that overrides the chosen strategy for RCS only. The one true
      #
      #   @param sms [Sentdm::Models::TemplateBodyContent, nil] The SMS body. It does not override multiChannel, it replaces it.
      #
      #   @param whatsapp [Sentdm::Models::TemplateBodyContent, nil] The WhatsApp body. It does not override multiChannel, it replaces it.
    end
  end
end
