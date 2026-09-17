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

      # @!attribute auto_reply_action
      #   Which consent keyword this template answers, when it is one of Sent's
      #   auto-replies: OPT_IN, OPT_OUT, HELP, or OTHER for a customer-defined keyword.
      #
      #   Omitted for an ordinary template, so its presence is the answer to "is this an
      #   auto-reply". Sent creates the three compliance auto-replies at signup and they
      #   go through review like any other template, so their events arrive mixed in with
      #   the customer's own with nothing else to tell them apart.
      #
      #   Named for the reader rather than after Template.OptAction, which it is mapped
      #   from. The MCP tool result deliberately keeps OptAction, OptKeywords and IsOpt:
      #   it mirrors the internal shape on purpose and publishes the keywords too, so
      #   renaming one of the three there would leave a surface half in each vocabulary.
      #   Two names for one concept, each consistent within its own surface, chosen over a
      #   rename that breaks MCP clients silently.
      #
      #   @return [String, nil]
      optional :auto_reply_action, String, nil?: true

      # @!attribute category
      #   The template's category, for example UTILITY, MARKETING, or AUTHENTICATION.
      #
      #   @return [String, nil]
      optional :category, String

      # @!attribute channel
      #   The channel leg this decision is about, for example whatsapp, sms, or rcs. A
      #   template is reviewed per channel and the legs come back independently, so each
      #   one reports separately.
      #
      #   Omitted when the decision applies to the template as a whole rather than to one
      #   leg. That event is the broader news: a template-wide rejection blocks every
      #   channel, whatever the individual legs say.
      #
      #   @return [String, nil]
      optional :channel, String, nil?: true

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

      # @!method initialize(status:, whatsapp_template_id:, account_id: nil, auto_reply_action: nil, category: nil, channel: nil, language: nil, reason: nil, template_id: nil, template_name: nil)
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
      #   @param auto_reply_action [String, nil] Which consent keyword this template answers, when it is one of Sent's auto-repli
      #
      #   @param category [String] The template's category, for example UTILITY, MARKETING, or
      #
      #   @param channel [String, nil] The channel leg this decision is about, for example whatsapp, sms, or rcs.
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
