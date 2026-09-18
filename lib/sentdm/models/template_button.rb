# frozen_string_literal: true

module Sentdm
  module Models
    class TemplateButton < Sentdm::Internal::Type::BaseModel
      # @!attribute props
      #   Properties specific to the button type
      #
      #   @return [Sentdm::Models::TemplateButtonProps]
      required :props, -> { Sentdm::TemplateButtonProps }

      # @!attribute type
      #   The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
      #
      #   @return [String]
      required :type, String

      # @!attribute id
      #   The button's identifier (1-based index), unique within the template.
      #
      #   Omitting it is only safe for a template holding a single button. The field is a
      #   non-nullable int, so every button that leaves it out defaults to 0, and two such
      #   buttons are refused by the unique-id rule ("Button IDs must be unique"). Number
      #   them from 1 in the order they should appear — order matters on RCS, where only
      #   the first four buttons render.
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!method initialize(props:, type:, id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::TemplateButton} for more details.
      #
      #   Interactive button in a message template
      #
      #   @param props [Sentdm::Models::TemplateButtonProps] Properties specific to the button type
      #
      #   @param type [String] The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
      #
      #   @param id [Integer] The button's identifier (1-based index), unique within the template.
    end
  end
end
