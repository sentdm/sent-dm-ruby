# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateDefinition < Sentdm::Internal::Type::BaseModel
      # @!attribute body
      #   Body section of a message template with channel-specific content
      #
      #   @return [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateBody]
      required :body, -> { Sentdm::SentDmServicesCommonContractsPocOsTemplateBody }

      # @!attribute authentication_config
      #   Configuration for AUTHENTICATION category templates
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
      #   Footer section of a message template
      #
      #   @return [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateFooter, nil]
      optional :footer, -> { Sentdm::SentDmServicesCommonContractsPocOsTemplateFooter }, nil?: true

      # @!attribute header
      #   Header section of a message template
      #
      #   @return [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateHeader, nil]
      optional :header, -> { Sentdm::SentDmServicesCommonContractsPocOsTemplateHeader }, nil?: true

      # @!method initialize(body:, authentication_config: nil, buttons: nil, definition_version: nil, footer: nil, header: nil)
      #   Complete definition of a message template including header, body, footer, and
      #   buttons
      #
      #   @param body [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateBody] Body section of a message template with channel-specific content
      #
      #   @param authentication_config [Sentdm::Models::SentDmServicesCommonContractsPocOsAuthenticationConfig, nil] Configuration for AUTHENTICATION category templates
      #
      #   @param buttons [Array<Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateButton>, nil] Optional list of interactive buttons (e.g., quick replies, URLs, phone numbers)
      #
      #   @param definition_version [String, nil] The version of the template definition format
      #
      #   @param footer [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateFooter, nil] Footer section of a message template
      #
      #   @param header [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateHeader, nil] Header section of a message template
    end
  end
end
