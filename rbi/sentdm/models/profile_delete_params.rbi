# typed: strong

module Sentdm
  module Models
    class ProfileDeleteParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::ProfileDeleteParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :profile_id

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
          profile_id: String,
          sandbox: T::Boolean,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        profile_id:,
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
            profile_id: String,
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
