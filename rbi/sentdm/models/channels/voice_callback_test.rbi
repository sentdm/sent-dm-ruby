# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceCallbackTest < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::VoiceCallbackTest,
              Sentdm::Internal::AnyHash
            )
          end

        # Your answer as Sent read it, with numbers in E.164 and a missing caller id
        # filled in. Set only when the outcome is ok.
        sig { returns(T.nilable(T.anything)) }
        attr_accessor :answer

        # The call id the test question carried. It does not exist anywhere else and
        # cannot be looked up.
        sig { returns(T.nilable(String)) }
        attr_reader :call_id

        sig { params(call_id: String).void }
        attr_writer :call_id

        # Why the test did not end with ok
        sig { returns(T.nilable(Sentdm::Channels::VoiceCallbackTestErrorInfo)) }
        attr_reader :error

        sig do
          params(
            error:
              T.nilable(Sentdm::Channels::VoiceCallbackTestErrorInfo::OrHash)
          ).void
        end
        attr_writer :error

        # What happened: ok, timeout, connection_failed, http_error or invalid_answer
        sig { returns(T.nilable(String)) }
        attr_reader :outcome

        sig { params(outcome: String).void }
        attr_writer :outcome

        # The test question exactly as it was sent
        sig do
          returns(T.nilable(Sentdm::Channels::VoiceCallbackTestRequestInfo))
        end
        attr_reader :request

        sig do
          params(
            request:
              T.nilable(Sentdm::Channels::VoiceCallbackTestRequestInfo::OrHash)
          ).void
        end
        attr_writer :request

        # What your endpoint answered
        sig do
          returns(T.nilable(Sentdm::Channels::VoiceCallbackTestResponseInfo))
        end
        attr_reader :response

        sig do
          params(
            response:
              T.nilable(Sentdm::Channels::VoiceCallbackTestResponseInfo::OrHash)
          ).void
        end
        attr_writer :response

        # The verdict of a test question sent to your callback URL
        sig do
          params(
            answer: T.nilable(T.anything),
            call_id: String,
            error:
              T.nilable(Sentdm::Channels::VoiceCallbackTestErrorInfo::OrHash),
            outcome: String,
            request:
              T.nilable(Sentdm::Channels::VoiceCallbackTestRequestInfo::OrHash),
            response:
              T.nilable(Sentdm::Channels::VoiceCallbackTestResponseInfo::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Your answer as Sent read it, with numbers in E.164 and a missing caller id
          # filled in. Set only when the outcome is ok.
          answer: nil,
          # The call id the test question carried. It does not exist anywhere else and
          # cannot be looked up.
          call_id: nil,
          # Why the test did not end with ok
          error: nil,
          # What happened: ok, timeout, connection_failed, http_error or invalid_answer
          outcome: nil,
          # The test question exactly as it was sent
          request: nil,
          # What your endpoint answered
          response: nil
        )
        end

        sig do
          override.returns(
            {
              answer: T.nilable(T.anything),
              call_id: String,
              error: T.nilable(Sentdm::Channels::VoiceCallbackTestErrorInfo),
              outcome: String,
              request:
                T.nilable(Sentdm::Channels::VoiceCallbackTestRequestInfo),
              response:
                T.nilable(Sentdm::Channels::VoiceCallbackTestResponseInfo)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
