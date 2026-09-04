# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateEventPayload < Sentdm::Internal::Type::BaseModel
      # @!attribute status
      #   The review status the template just reached, for example APPROVED or REJECTED.
      #
      #   @return [String]
      required :status, String

      # @!attribute whatsapp_template_id
      #   The template's identifier with Meta, assigned when the template is submitted for
      #   review.
      #
      #   @return [String]
      required :whatsapp_template_id, String

      # @!attribute account_id
      #   The account the template belongs to.
      #
      #   @return [String, nil]
      optional :account_id, String

      # @!attribute category
      #   The template's category, for example UTILITY, MARKETING, or AUTHENTICATION.
      #
      #   @return [String, nil]
      optional :category, String

      # @!attribute channel
      #   The channel the template applies to.
      #
      #   @return [String, nil]
      optional :channel, String

      # @!attribute language
      #   The template's language code, for example en_US.
      #
      #   @return [String, nil]
      optional :language, String

      # @!attribute reason
      #   Why the template reached Status, when a reason was given. Populated on a
      #   rejection.
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute template_id
      #   The template in Sent.
      #
      #   @return [String, nil]
      optional :template_id, String

      # @!attribute template_name
      #   The template's display name.
      #
      #   @return [String, nil]
      optional :template_name, String

      # @!method initialize(status:, whatsapp_template_id:, account_id: nil, category: nil, channel: nil, language: nil, reason: nil, template_id: nil, template_name: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateEventPayload} for more details.
      #
      #   Body of a template status event. Delivered when a template's review outcome
      #   changes, so you can react without polling.
      #
      #   @param status [String] The review status the template just reached, for example APPROVED or
      #
      #   @param whatsapp_template_id [String] The template's identifier with Meta, assigned when the template is submitted for
      #
      #   @param account_id [String] The account the template belongs to.
      #
      #   @param category [String] The template's category, for example UTILITY, MARKETING, or
      #
      #   @param channel [String] The channel the template applies to.
      #
      #   @param language [String] The template's language code, for example en_US.
      #
      #   @param reason [String, nil] Why the template reached Status, when a reason was given. Populated on a
      #
      #   @param template_id [String] The template in Sent.
      #
      #   @param template_name [String] The template's display name.
    end
  end
end
