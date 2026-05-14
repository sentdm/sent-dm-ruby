# typed: strong

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateButton < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesCommonContractsPocOsTemplateButton,
            Sentdm::Internal::AnyHash
          )
        end

      # Properties specific to the button type
      sig do
        returns(Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps)
      end
      attr_reader :props

      sig do
        params(
          props:
            Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps::OrHash
        ).void
      end
      attr_writer :props

      # The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
      sig { returns(String) }
      attr_accessor :type

      # The unique identifier of the button (1-based index)
      sig { returns(T.nilable(Integer)) }
      attr_reader :id

      sig { params(id: Integer).void }
      attr_writer :id

      # Interactive button in a message template
      sig do
        params(
          props:
            Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps::OrHash,
          type: String,
          id: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Properties specific to the button type
        props:,
        # The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
        type:,
        # The unique identifier of the button (1-based index)
        id: nil
      )
      end

      sig do
        override.returns(
          {
            props:
              Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps,
            type: String,
            id: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
