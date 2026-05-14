# typed: strong

module Sentdm
  module Models
    class TemplateVariable < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateVariable, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Sentdm::TemplateVariable::Props) }
      attr_reader :props

      sig { params(props: Sentdm::TemplateVariable::Props::OrHash).void }
      attr_writer :props

      sig { returns(String) }
      attr_accessor :type

      sig { returns(T.nilable(Integer)) }
      attr_reader :id

      sig { params(id: Integer).void }
      attr_writer :id

      sig do
        params(
          name: String,
          props: Sentdm::TemplateVariable::Props::OrHash,
          type: String,
          id: Integer
        ).returns(T.attached_class)
      end
      def self.new(name:, props:, type:, id: nil)
      end

      sig do
        override.returns(
          {
            name: String,
            props: Sentdm::TemplateVariable::Props,
            type: String,
            id: Integer
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

        sig { returns(String) }
        attr_accessor :media_type

        sig { returns(String) }
        attr_accessor :sample

        sig { returns(String) }
        attr_accessor :url

        sig { returns(String) }
        attr_accessor :variable_type

        sig { returns(T.nilable(String)) }
        attr_accessor :alt

        sig { returns(T.nilable(String)) }
        attr_accessor :regex

        sig { returns(T.nilable(String)) }
        attr_accessor :short_url

        sig do
          params(
            media_type: String,
            sample: String,
            url: String,
            variable_type: String,
            alt: T.nilable(String),
            regex: T.nilable(String),
            short_url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          media_type:,
          sample:,
          url:,
          variable_type:,
          alt: nil,
          regex: nil,
          short_url: nil
        )
        end

        sig do
          override.returns(
            {
              media_type: String,
              sample: String,
              url: String,
              variable_type: String,
              alt: T.nilable(String),
              regex: T.nilable(String),
              short_url: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
