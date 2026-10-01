# typed: strong

module Sentdm
  module Models
    module Channels
      class VoiceUpdateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::VoiceUpdateParams,
              Sentdm::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :number

        # A new callback URL for the number, active or not: an absolute HTTP or HTTPS URL
        # on a public host, where Sent asks what to do with each call. The signing secret
        # is kept.
        sig { returns(T.nilable(String)) }
        attr_accessor :callback_url

        # true makes this the line app-originated calls are placed from when a voice token
        # names no number. false is refused: an account with active voice numbers always
        # has exactly one default, so the default moves by giving it to another number.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :default_for_app_calls

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        # ACTIVE turns calls on for the number again, INACTIVE turns them off. Matched
        # ignoring case. Turning the default line off is refused while other active voice
        # numbers remain.
        sig do
          returns(
            T.nilable(Sentdm::Channels::VoiceUpdateParams::Status::OrSymbol)
          )
        end
        attr_accessor :status

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig { returns(T.nilable(String)) }
        attr_reader :x_profile_id

        sig { params(x_profile_id: String).void }
        attr_writer :x_profile_id

        sig do
          params(
            number: String,
            callback_url: T.nilable(String),
            default_for_app_calls: T.nilable(T::Boolean),
            sandbox: T::Boolean,
            status:
              T.nilable(Sentdm::Channels::VoiceUpdateParams::Status::OrSymbol),
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          number:,
          # A new callback URL for the number, active or not: an absolute HTTP or HTTPS URL
          # on a public host, where Sent asks what to do with each call. The signing secret
          # is kept.
          callback_url: nil,
          # true makes this the line app-originated calls are placed from when a voice token
          # names no number. false is refused: an account with active voice numbers always
          # has exactly one default, so the default moves by giving it to another number.
          default_for_app_calls: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          # ACTIVE turns calls on for the number again, INACTIVE turns them off. Matched
          # ignoring case. Turning the default line off is refused while other active voice
          # numbers remain.
          status: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              number: String,
              callback_url: T.nilable(String),
              default_for_app_calls: T.nilable(T::Boolean),
              sandbox: T::Boolean,
              status:
                T.nilable(
                  Sentdm::Channels::VoiceUpdateParams::Status::OrSymbol
                ),
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions
            }
          )
        end
        def to_hash
        end

        # ACTIVE turns calls on for the number again, INACTIVE turns them off. Matched
        # ignoring case. Turning the default line off is refused while other active voice
        # numbers remain.
        module Status
          extend Sentdm::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Sentdm::Channels::VoiceUpdateParams::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Turns calls on for the number again. The callback URL and the signing secret it had are kept; send `callback_url` in the same call to replace the URL.
          ACTIVE =
            T.let(
              :ACTIVE,
              Sentdm::Channels::VoiceUpdateParams::Status::TaggedSymbol
            )

          # Turns calls off for the number. Refused while the number is the default line for app calls and other active voice numbers remain; move the default first. The callback URL and the secret stay on the number.
          INACTIVE =
            T.let(
              :INACTIVE,
              Sentdm::Channels::VoiceUpdateParams::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Sentdm::Channels::VoiceUpdateParams::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
