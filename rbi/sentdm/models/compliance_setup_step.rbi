# typed: strong

module Sentdm
  module Models
    class ComplianceSetupStep < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::ComplianceSetupStep, Sentdm::Internal::AnyHash)
        end

      # Files to attach as multipart, when this call takes any. Absent when it does not.
      sig { returns(T.nilable(T::Array[Sentdm::ComplianceAttachmentTemplate])) }
      attr_accessor :attachments

      # The request body, with every key this market wants already present and the
      # values left blank. Send it as it stands and the response names each blank that
      # still has to be filled.
      sig { returns(T.nilable(T.anything)) }
      attr_reader :body

      sig { params(body: T.anything).void }
      attr_writer :body

      sig { returns(T.nilable(String)) }
      attr_reader :method_

      sig { params(method_: String).void }
      attr_writer :method_

      # Path to call. Add the x-profile-id header with an organization key to make the
      # same call for one of your sender profiles — there is no separate path for that.
      sig { returns(T.nilable(String)) }
      attr_reader :path

      sig { params(path: String).void }
      attr_writer :path

      # What this call sets up: brand or channel.
      sig { returns(T.nilable(String)) }
      attr_reader :resource

      sig { params(resource: String).void }
      attr_writer :resource

      # Position in the sequence, from 1. Steps must be performed in this order.
      sig { returns(T.nilable(Integer)) }
      attr_reader :step

      sig { params(step: Integer).void }
      attr_writer :step

      # Why this market needs this call, in one sentence.
      sig { returns(T.nilable(String)) }
      attr_reader :why

      sig { params(why: String).void }
      attr_writer :why

      # One call to make, with a body that can be sent as it stands.
      #
      # The steps are ordered and the order is load-bearing: a channel that registers
      # with a regime is filed against a brand, so the brand call comes first and the
      # channel call refuses until it has been made. Doing them in order is the whole of
      # setting a market up.
      sig do
        params(
          attachments:
            T.nilable(T::Array[Sentdm::ComplianceAttachmentTemplate::OrHash]),
          body: T.anything,
          method_: String,
          path: String,
          resource: String,
          step: Integer,
          why: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Files to attach as multipart, when this call takes any. Absent when it does not.
        attachments: nil,
        # The request body, with every key this market wants already present and the
        # values left blank. Send it as it stands and the response names each blank that
        # still has to be filled.
        body: nil,
        method_: nil,
        # Path to call. Add the x-profile-id header with an organization key to make the
        # same call for one of your sender profiles — there is no separate path for that.
        path: nil,
        # What this call sets up: brand or channel.
        resource: nil,
        # Position in the sequence, from 1. Steps must be performed in this order.
        step: nil,
        # Why this market needs this call, in one sentence.
        why: nil
      )
      end

      sig do
        override.returns(
          {
            attachments:
              T.nilable(T::Array[Sentdm::ComplianceAttachmentTemplate]),
            body: T.anything,
            method_: String,
            path: String,
            resource: String,
            step: Integer,
            why: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
