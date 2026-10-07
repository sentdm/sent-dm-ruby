# typed: strong

module Sentdm
  module Models
    class TemplateDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateDeleteParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      # Whether to also delete the template from WhatsApp/Meta (optional, defaults to
      # false)
      sig { returns(T.nilable(T::Boolean)) }
      attr_accessor :delete_from_meta

      # Sandbox flag - when true, the operation is simulated without side effects Useful
      # for testing integrations without actual execution
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :sandbox

      sig { params(sandbox: T::Boolean).void }
      attr_writer :sandbox

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          id: String,
          delete_from_meta: T.nilable(T::Boolean),
          sandbox: T::Boolean,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Whether to also delete the template from WhatsApp/Meta (optional, defaults to
        # false)
        delete_from_meta: nil,
        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sandbox: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            delete_from_meta: T.nilable(T::Boolean),
            sandbox: T::Boolean,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
