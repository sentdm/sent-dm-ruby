# typed: strong

module Sentdm
  module Models
    class TemplateButton < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateButton, Sentdm::Internal::AnyHash)
        end

      # Properties specific to the button type
      sig { returns(Sentdm::TemplateButtonProps) }
      attr_reader :props

      sig { params(props: Sentdm::TemplateButtonProps::OrHash).void }
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
          props: Sentdm::TemplateButtonProps::OrHash,
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
          { props: Sentdm::TemplateButtonProps, type: String, id: Integer }
        )
      end
      def to_hash
      end
    end
  end
end
