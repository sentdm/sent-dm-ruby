# frozen_string_literal: true

module Sentdm
  module Models
    module Channels
      class VoiceCallbackTest < Sentdm::Internal::Type::BaseModel
        # @!attribute answer
        #   Your answer as Sent read it, with numbers in E.164 and a missing caller id
        #   filled in. Set only when the outcome is ok.
        #
        #   @return [Object, nil]
        optional :answer, Sentdm::Internal::Type::Unknown, nil?: true

        # @!attribute call_id
        #   The call id the test question carried. It does not exist anywhere else and
        #   cannot be looked up.
        #
        #   @return [String, nil]
        optional :call_id, String

        # @!attribute error
        #   Why the test did not end with ok
        #
        #   @return [Sentdm::Models::Channels::VoiceCallbackTestErrorInfo, nil]
        optional :error, -> { Sentdm::Channels::VoiceCallbackTestErrorInfo }, nil?: true

        # @!attribute outcome
        #   What happened: ok, timeout, connection_failed, http_error or invalid_answer
        #
        #   @return [String, nil]
        optional :outcome, String

        # @!attribute request
        #   The test question exactly as it was sent
        #
        #   @return [Sentdm::Models::Channels::VoiceCallbackTestRequestInfo, nil]
        optional :request, -> { Sentdm::Channels::VoiceCallbackTestRequestInfo }, nil?: true

        # @!attribute response
        #   What your endpoint answered
        #
        #   @return [Sentdm::Models::Channels::VoiceCallbackTestResponseInfo, nil]
        optional :response, -> { Sentdm::Channels::VoiceCallbackTestResponseInfo }, nil?: true

        # @!method initialize(answer: nil, call_id: nil, error: nil, outcome: nil, request: nil, response: nil)
        #   Some parameter documentations has been truncated, see
        #   {Sentdm::Models::Channels::VoiceCallbackTest} for more details.
        #
        #   The verdict of a test question sent to your callback URL
        #
        #   @param answer [Object, nil] Your answer as Sent read it, with numbers in E.164 and a missing caller id fille
        #
        #   @param call_id [String] The call id the test question carried. It does not exist anywhere else and canno
        #
        #   @param error [Sentdm::Models::Channels::VoiceCallbackTestErrorInfo, nil] Why the test did not end with ok
        #
        #   @param outcome [String] What happened: ok, timeout, connection_failed, http_error or invalid_answer
        #
        #   @param request [Sentdm::Models::Channels::VoiceCallbackTestRequestInfo, nil] The test question exactly as it was sent
        #
        #   @param response [Sentdm::Models::Channels::VoiceCallbackTestResponseInfo, nil] What your endpoint answered
      end
    end
  end
end
