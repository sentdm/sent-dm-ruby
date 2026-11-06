# typed: strong

module Sentdm
  module Models
    class TemplateVariable < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateVariable, Sentdm::Internal::AnyHash)
        end

      # The variable's name, and the key callers use for it in a send request's
      # parameters object. Must start with a letter and hold only letters, digits and
      # underscores.
      sig { returns(String) }
      attr_accessor :name

      sig { returns(Sentdm::TemplateVariableProps) }
      attr_reader :props

      sig { params(props: Sentdm::TemplateVariableProps::OrHash).void }
      attr_writer :props

      # One of variable, link or media. Decides which Props fields are required.
      sig { returns(String) }
      attr_accessor :type

      # The variable's index, and the number its {{index:variable}} placeholder refers
      # to.
      #
      # Omitting it is only safe for a section holding a single variable. The field is a
      # non-nullable int, so every variable that leaves it out defaults to 0, and a
      # section with two such variables is refused by the unique-id rule ("variables
      # must have unique IDs"). Number them from 0 in the order they appear.
      sig { returns(T.nilable(Integer)) }
      attr_reader :id

      sig { params(id: Integer).void }
      attr_writer :id

      sig do
        params(
          name: String,
          props: Sentdm::TemplateVariableProps::OrHash,
          type: String,
          id: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The variable's name, and the key callers use for it in a send request's
        # parameters object. Must start with a letter and hold only letters, digits and
        # underscores.
        name:,
        props:,
        # One of variable, link or media. Decides which Props fields are required.
        type:,
        # The variable's index, and the number its {{index:variable}} placeholder refers
        # to.
        #
        # Omitting it is only safe for a section holding a single variable. The field is a
        # non-nullable int, so every variable that leaves it out defaults to 0, and a
        # section with two such variables is refused by the unique-id rule ("variables
        # must have unique IDs"). Number them from 0 in the order they appear.
        id: nil
      )
      end

      sig do
        override.returns(
          {
            name: String,
            props: Sentdm::TemplateVariableProps,
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
