# frozen_string_literal: true

module SentDm
  module Models
    class TemplateBodyContent < SentDm::Internal::Type::BaseModel
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
      #   @return [Array<SentDm::Models::TemplateVariable>, nil]
      optional :variables, -> { SentDm::Internal::Type::ArrayOf[SentDm::TemplateVariable] }, nil?: true

      # @!method initialize(template: nil, type: nil, variables: nil)
      #   @param template [String]
      #   @param type [String, nil]
      #   @param variables [Array<SentDm::Models::TemplateVariable>, nil]
    end
  end
end
