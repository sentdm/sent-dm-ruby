# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateDefinition < Sentdm::Internal::Type::BaseModel
      # @!attribute body
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
      #   @return [Sentdm::Models::TemplateBody]
      required :body, -> { Sentdm::TemplateBody }

      # @!attribute authentication_config
      #   Configuration for AUTHENTICATION category templates
      #
      #   @return [Sentdm::Models::AuthenticationConfig, nil]
      optional :authentication_config,
               -> { Sentdm::AuthenticationConfig },
               api_name: :authenticationConfig,
               nil?: true

      # @!attribute buttons
      #   Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @return [Array<Sentdm::Models::TemplateButton>, nil]
      optional :buttons, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateButton] }, nil?: true

      # @!attribute definition_version
      #   The version of the template definition format
      #
      #   @return [String, nil]
      optional :definition_version, String, api_name: :definitionVersion, nil?: true

      # @!attribute footer
      #   Footer section of a message template
      #
      #   @return [Sentdm::Models::TemplateFooter, nil]
      optional :footer, -> { Sentdm::TemplateFooter }, nil?: true

      # @!attribute header
      #   Header section of a message template
      #
      #   @return [Sentdm::Models::TemplateHeader, nil]
      optional :header, -> { Sentdm::TemplateHeader }, nil?: true

      # @!method initialize(body:, authentication_config: nil, buttons: nil, definition_version: nil, footer: nil, header: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateDefinition} for more details.
      #
      #   Complete definition of a message template including header, body, footer, and
      #   buttons
      #
      #   @param body [Sentdm::Models::TemplateBody] Body section of a message template.
      #
      #   @param authentication_config [Sentdm::Models::AuthenticationConfig, nil] Configuration for AUTHENTICATION category templates
      #
      #   @param buttons [Array<Sentdm::Models::TemplateButton>, nil] Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @param definition_version [String, nil] The version of the template definition format
      #
      #   @param footer [Sentdm::Models::TemplateFooter, nil] Footer section of a message template
      #
      #   @param header [Sentdm::Models::TemplateHeader, nil] Header section of a message template
    end
  end
end
