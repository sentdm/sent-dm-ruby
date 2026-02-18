# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateHeader < Sentdm::Internal::Type::BaseModel
      # @!attribute template
      #   The header template text with optional variable placeholders (e.g., "Welcome to
      #   {{0:variable}}")
      #
      #   @return [String, nil]
      optional :template, String

      # @!attribute type
      #   The type of header (e.g., "text", "image", "video", "document")
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!attribute variables
      #   List of variables used in the header template
      #
      #   @return [Array<Sentdm::Models::TemplateVariable>, nil]
      optional :variables, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateVariable] }, nil?: true

      # @!method initialize(template: nil, type: nil, variables: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateHeader} for more
      #   details.
      #
      #   Header section of a message template
      #
      #   @param template [String] The header template text with optional variable placeholders (e.g., "Welcome to
      #
      #   @param type [String, nil] The type of header (e.g., "text", "image", "video", "document")
      #
      #   @param variables [Array<Sentdm::Models::TemplateVariable>, nil] List of variables used in the header template
    end
  end
end
