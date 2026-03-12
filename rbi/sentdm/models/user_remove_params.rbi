# typed: strong

module Sentdm
  module Models
    class UserRemoveParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Sentdm::UserRemoveParams, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :user_id

      # Request to remove a user from an organization
      sig { returns(Sentdm::UserRemoveParams::Body) }
      attr_reader :body

      sig { params(body: Sentdm::UserRemoveParams::Body::OrHash).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          user_id: String,
          body: Sentdm::UserRemoveParams::Body::OrHash,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        user_id:,
        # Request to remove a user from an organization
        body:,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            user_id: String,
            body: Sentdm::UserRemoveParams::Body,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Body < Sentdm::Models::MutationRequest
        OrHash =
          T.type_alias do
            T.any(Sentdm::UserRemoveParams::Body, Sentdm::Internal::AnyHash)
          end

        # Request to remove a user from an organization
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
