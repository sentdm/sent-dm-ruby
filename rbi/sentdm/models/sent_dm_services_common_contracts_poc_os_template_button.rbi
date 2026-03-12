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

      # The unique identifier of the button (1-based index)
      sig { returns(T.nilable(Integer)) }
      attr_reader :id

      sig { params(id: Integer).void }
      attr_writer :id

      # Properties specific to the button type
      sig do
        returns(
          T.nilable(
            Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps
          )
        )
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
      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      # Interactive button in a message template
      sig do
        params(
          id: Integer,
          props:
            Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps::OrHash,
          type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The unique identifier of the button (1-based index)
        id: nil,
        # Properties specific to the button type
        props: nil,
        # The type of button (e.g., QUICK_REPLY, URL, PHONE_NUMBER, VOICE_CALL, COPY_CODE)
        type: nil
      )
      end

      sig do
        override.returns(
          {
            id: Integer,
            props:
              Sentdm::SentDmServicesCommonContractsPocOsTemplateButtonProps,
            type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
