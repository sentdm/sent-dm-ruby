# frozen_string_literal: true

module Sentdm
  module Models
    class ComplianceSetupStep < Sentdm::Internal::Type::BaseModel
      # @!attribute attachments
      #   Files to attach as multipart, when this call takes any. Absent when it does not.
      #
      #   @return [Array<Sentdm::Models::ComplianceAttachmentTemplate>, nil]
      optional :attachments,
               -> { Sentdm::Internal::Type::ArrayOf[Sentdm::ComplianceAttachmentTemplate] },
               nil?: true

      # @!attribute body
      #   The request body, with every key this market wants already present and the
      #   values left blank. Send it as it stands and the response names each blank that
      #   still has to be filled.
      #
      #   @return [Object, nil]
      optional :body, Sentdm::Internal::Type::Unknown

      # @!attribute method_
      #
      #   @return [String, nil]
      optional :method_, String, api_name: :method

      # @!attribute path
      #   Path to call. Add the x-profile-id header with an organization key to make the
      #   same call for one of your sender profiles — there is no separate path for that.
      #
      #   @return [String, nil]
      optional :path, String

      # @!attribute resource
      #   What this call sets up: brand or channel.
      #
      #   @return [String, nil]
      optional :resource, String

      # @!attribute step
      #   Position in the sequence, from 1. Steps must be performed in this order.
      #
      #   @return [Integer, nil]
      optional :step, Integer

      # @!attribute why
      #   Why this market needs this call, in one sentence.
      #
      #   @return [String, nil]
      optional :why, String

      # @!method initialize(attachments: nil, body: nil, method_: nil, path: nil, resource: nil, step: nil, why: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ComplianceSetupStep} for more details.
      #
      #   One call to make, with a body that can be sent as it stands.
      #
      #   The steps are ordered and the order is load-bearing: a channel that registers
      #   with a regime is filed against a brand, so the brand call comes first and the
      #   channel call refuses until it has been made. Doing them in order is the whole of
      #   setting a market up.
      #
      #   @param attachments [Array<Sentdm::Models::ComplianceAttachmentTemplate>, nil] Files to attach as multipart, when this call takes any. Absent when it does not.
      #
      #   @param body [Object] The request body, with every key this market wants already present and the value
      #
      #   @param method_ [String]
      #
      #   @param path [String] Path to call. Add the x-profile-id header with an organization key to make the s
      #
      #   @param resource [String] What this call sets up: brand or channel.
      #
      #   @param step [Integer] Position in the sequence, from 1. Steps must be performed in this order.
      #
      #   @param why [String] Why this market needs this call, in one sentence.
    end
  end
end
