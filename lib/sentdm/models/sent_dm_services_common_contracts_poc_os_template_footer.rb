# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateFooter < Sentdm::Internal::Type::BaseModel
      # @!attribute template
      #   The footer template text with optional variable placeholders
      #
      #   @return [String, nil]
      optional :template, String

      # @!attribute type
      #   The type of footer (typically "text")
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!attribute variables
      #   List of variables used in the footer template
      #
      #   @return [Array<Sentdm::Models::TemplateVariable>, nil]
      optional :variables, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateVariable] }, nil?: true

      # @!method initialize(template: nil, type: nil, variables: nil)
      #   Footer section of a message template
      #
      #   @param template [String] The footer template text with optional variable placeholders
      #
      #   @param type [String, nil] The type of footer (typically "text")
      #
      #   @param variables [Array<Sentdm::Models::TemplateVariable>, nil] List of variables used in the footer template
    end
  end
end
