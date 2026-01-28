# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateBodyContent < Sentdm::Internal::Type::BaseModel
      # @!attribute template
      #
      #   @return [String, nil]
      optional :template, String

      # @!attribute type
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!attribute variables
      #
      #   @return [Array<Sentdm::Models::TemplateVariable>, nil]
      optional :variables, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::TemplateVariable] }, nil?: true

      # @!method initialize(template: nil, type: nil, variables: nil)
      #   @param template [String]
      #   @param type [String, nil]
      #   @param variables [Array<Sentdm::Models::TemplateVariable>, nil]
    end
  end
end
