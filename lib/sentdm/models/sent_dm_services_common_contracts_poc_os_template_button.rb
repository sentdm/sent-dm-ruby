# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateButton < Sentdm::Internal::Type::BaseModel
      # @!attribute props
      #   Properties specific to the button type
      #
      #   @return [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateButtonProps]
      required :props, -> { Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps }

      # @!attribute type
      #   The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
      #
      #   @return [String]
      required :type, String

      # @!attribute id
      #   The unique identifier of the button (1-based index)
      #
      #   @return [Integer, nil]
      optional :id, Integer

      # @!method initialize(props:, type:, id: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateButton} for more
      #   details.
      #
      #   Interactive button in a message template
      #
      #   @param props [Sentdm::Models::SentDmServicesCommonContractsPocOsTemplateButtonProps] Properties specific to the button type
      #
      #   @param type [String] The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
      #
      #   @param id [Integer] The unique identifier of the button (1-based index)
    end
  end
end
