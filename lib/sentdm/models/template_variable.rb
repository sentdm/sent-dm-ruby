# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateVariable < Sentdm::Internal::Type::BaseModel
      # @!attribute name
      #   The variable's name, and the key callers use for it in a send request's
      #   parameters object. Must start with a letter and hold only letters, digits and
      #   underscores.
      #
      #   @return [String]
      required :name, String

      # @!attribute props
      #
      #   @return [Sentdm::Models::TemplateVariableProps]
      required :props, -> { Sentdm::TemplateVariableProps }

      # @!attribute type
      #   One of variable, link or media. Decides which Props fields are required.
      #
      #   @return [String]
      required :type, String

      # @!attribute id
      #   The variable's index, and the number its {{index:variable}} placeholder refers
      #   to.
      #
      #   Omitting it is only safe for a section holding a single variable. The field is a
      #   non-nullable int, so every variable that leaves it out defaults to 0, and a
      #   section with two such variables is refused by the unique-id rule ("variables
      #   must have unique IDs"). Number them from 0 in the order they appear.
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!method initialize(name:, props:, type:, id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateVariable} for more details.
      #
      #   @param name [String] The variable's name, and the key callers use for it in a send request's paramete
      #
      #   @param props [Sentdm::Models::TemplateVariableProps]
      #
      #   @param type [String] One of variable, link or media. Decides which Props fields
      #
      #   @param id [Integer] The variable's index, and the number its {{index:variable}} placeholder refers t
    end
  end
end
