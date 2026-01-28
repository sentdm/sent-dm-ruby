# typed: strong

module Sentdm
  module Models
    class TemplateVariable < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateVariable, Sentdm::Internal::AnyHash)
        end

      sig { returns(T.nilable(Integer)) }
      attr_reader :id

      sig { params(id: Integer).void }
      attr_writer :id

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(Sentdm::TemplateVariable::Props)) }
      attr_reader :props

      sig { params(props: Sentdm::TemplateVariable::Props::OrHash).void }
      attr_writer :props

      sig { returns(T.nilable(String)) }
      attr_reader :type

      sig { params(type: String).void }
      attr_writer :type

      sig do
        params(
          id: Integer,
          name: String,
          props: Sentdm::TemplateVariable::Props::OrHash,
          type: String
        ).returns(T.attached_class)
      end
      def self.new(id: nil, name: nil, props: nil, type: nil)
      end

      sig do
        override.returns(
          {
            id: Integer,
            name: String,
            props: Sentdm::TemplateVariable::Props,
            type: String
          }
        )
      end
      def to_hash
      end

      class Props < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::TemplateVariable::Props, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_accessor :alt

        sig { returns(T.nilable(String)) }
        attr_accessor :media_type

        sig { returns(T.nilable(String)) }
        attr_accessor :sample

        sig { returns(T.nilable(String)) }
        attr_accessor :short_url

        sig { returns(T.nilable(String)) }
        attr_accessor :url

        sig { returns(T.nilable(String)) }
        attr_accessor :variable_type

        sig do
          params(
            alt: T.nilable(String),
            media_type: T.nilable(String),
            sample: T.nilable(String),
            short_url: T.nilable(String),
            url: T.nilable(String),
            variable_type: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          alt: nil,
          media_type: nil,
          sample: nil,
          short_url: nil,
          url: nil,
          variable_type: nil
        )
        end

        sig do
          override.returns(
            {
              alt: T.nilable(String),
              media_type: T.nilable(String),
              sample: T.nilable(String),
              short_url: T.nilable(String),
              url: T.nilable(String),
              variable_type: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
