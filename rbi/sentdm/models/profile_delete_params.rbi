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

      # Request to delete a profile
      sig { returns(Sentdm::ProfileDeleteParams::Body) }
      attr_reader :body

      sig { params(body: Sentdm::ProfileDeleteParams::Body::OrHash).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          profile_id: String,
          body: Sentdm::ProfileDeleteParams::Body::OrHash,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        profile_id:,
        # Request to delete a profile
        body:,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            profile_id: String,
            body: Sentdm::ProfileDeleteParams::Body,
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
            T.any(Sentdm::ProfileDeleteParams::Body, Sentdm::Internal::AnyHash)
          end

        # Request to delete a profile
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
