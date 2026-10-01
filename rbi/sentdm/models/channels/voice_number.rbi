# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceNumber < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Channels::VoiceNumber, Sentdm::Internal::AnyHash)
          end

        # Where Sent asks what to do with each call on this number: a signed question is
        # POSTed here when a call arrives or a caller presses a key, and the answer
        # decides the call. The signing secret is not on this read; it is shown when voice
        # is turned on and by the rotate endpoint.
        sig { returns(T.nilable(String)) }
        attr_accessor :callback_url

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        # Whether this is the line app-originated calls are placed from when a voice token
        # names no number. Exactly one active voice number carries it while the profile
        # has any.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :default_for_app_calls

        sig { params(default_for_app_calls: T::Boolean).void }
        attr_writer :default_for_app_calls

        # The number, in E.164.
        sig { returns(T.nilable(String)) }
        attr_reader :number

        sig { params(number: String).void }
        attr_writer :number

        # ACTIVE while the number carries calls, INACTIVE once it was turned off. Nothing
        # provisions: a number the customer holds can carry calls the moment voice is
        # turned on for it.
        sig { returns(T.nilable(String)) }
        attr_reader :status

        sig { params(status: String).void }
        attr_writer :status

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
        attr_writer :updated_at

        # One number the profile carries phone calls on.
        sig do
          params(
            callback_url: T.nilable(String),
            created_at: Time,
            default_for_app_calls: T::Boolean,
            number: String,
            status: String,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Where Sent asks what to do with each call on this number: a signed question is
          # POSTed here when a call arrives or a caller presses a key, and the answer
          # decides the call. The signing secret is not on this read; it is shown when voice
          # is turned on and by the rotate endpoint.
          callback_url: nil,
          created_at: nil,
          # Whether this is the line app-originated calls are placed from when a voice token
          # names no number. Exactly one active voice number carries it while the profile
          # has any.
          default_for_app_calls: nil,
          # The number, in E.164.
          number: nil,
          # ACTIVE while the number carries calls, INACTIVE once it was turned off. Nothing
          # provisions: a number the customer holds can carry calls the moment voice is
          # turned on for it.
          status: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              callback_url: T.nilable(String),
              created_at: Time,
              default_for_app_calls: T::Boolean,
              number: String,
              status: String,
              updated_at: Time
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
