# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateDefinition < Sentdm::Internal::Type::BaseModel
      # @!attribute body
      #   Required template body with content for different channels (multi-channel,
      #   SMS-specific, or WhatsApp-specific)
      #
      #   @return [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateBody]
      required :body, -> { Sentdm::SentDmServicesCommonContractsPocOsTemplateBody }

      # @!attribute authentication_config
      #   Configuration specific to AUTHENTICATION category templates (optional)
      #
      #   @return [Sentdm::Models::SentDmServicesCommonContractsPocOsAuthenticationConfig, nil]
      optional :authentication_config,
               -> { Sentdm::SentDmServicesCommonContractsPocOsAuthenticationConfig },
               api_name: :authenticationConfig,
               nil?: true

      # @!attribute buttons
      #   Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @return [Array<Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateButton>, nil]
      optional :buttons,
               -> {
                 Sentdm::Internal::Type::ArrayOf[Sentdm::SentDmServicesCommonContractsPocOsTemplateButton]
               },
               nil?: true

      # @!attribute definition_version
      #   The version of the template definition format
      #
      #   @return [String, nil]
      optional :definition_version, String, api_name: :definitionVersion, nil?: true

      # @!attribute footer
      #   Optional template footer with optional variables
      #
      #   @return [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateFooter, nil]
      optional :footer, -> { Sentdm::SentDmServicesCommonContractsPocOsTemplateFooter }, nil?: true

      # @!attribute header
      #   Optional template header with optional variables
      #
      #   @return [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateHeader, nil]
      optional :header, -> { Sentdm::SentDmServicesCommonContractsPocOsTemplateHeader }, nil?: true

      # @!method initialize(body:, authentication_config: nil, buttons: nil, definition_version: nil, footer: nil, header: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateDefinition} for more details.
      #
      #   Complete definition of a message template including header, body, footer, and
      #   buttons
      #
      #   @param body [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateBody] Required template body with content for different channels (multi-channel, SMS-s
      #
      #   @param authentication_config [Sentdm::Models::SentDmServicesCommonContractsPocOsAuthenticationConfig, nil] Configuration specific to AUTHENTICATION category templates (optional)
      #
      #   @param buttons [Array<Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateButton>, nil] Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @param definition_version [String, nil] The version of the template definition format
      #
      #   @param footer [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateFooter, nil] Optional template footer with optional variables
      #
      #   @param header [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateHeader, nil] Optional template header with optional variables
    end
  end
end
