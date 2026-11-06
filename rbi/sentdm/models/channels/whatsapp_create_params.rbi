# typed: strong

module Sentdm
  module Models
    module Channels
      class WhatsappCreateParams < Sentdm::Internal::Type::BaseModel
        extend Sentdm::Internal::Type::RequestParameters::Converter
        include Sentdm::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Channels::WhatsappCreateParams,
              Sentdm::Internal::AnyHash
            )
          end

        # The Meta phone-number id of the number on WabaId, which assigns it to this
        # profile as the number it sends from. It is not checked against the account here,
        # so name the account's number; it is refused if another profile already uses it.
        #
        # Optional: omit it to connect the account and settle the number later. Nothing
        # picks one on your behalf.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone_number_id

        # Sandbox flag - when true, the operation is simulated without side effects Useful
        # for testing integrations without actual execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :sandbox

        sig { params(sandbox: T::Boolean).void }
        attr_writer :sandbox

        # WhatsApp Business Account id — one of the accounts shared into your
        # organization. Required: the organization holds one per client, and nothing but
        # the caller says which is meant here.
        sig { returns(T.nilable(String)) }
        attr_reader :waba_id

        sig { params(waba_id: String).void }
        attr_writer :waba_id

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
            phone_number_id: T.nilable(String),
            sandbox: T::Boolean,
            waba_id: String,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The Meta phone-number id of the number on WabaId, which assigns it to this
          # profile as the number it sends from. It is not checked against the account here,
          # so name the account's number; it is refused if another profile already uses it.
          #
          # Optional: omit it to connect the account and settle the number later. Nothing
          # picks one on your behalf.
          phone_number_id: nil,
          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sandbox: nil,
          # WhatsApp Business Account id — one of the accounts shared into your
          # organization. Required: the organization holds one per client, and nothing but
          # the caller says which is meant here.
          waba_id: nil,
          idempotency_key: nil,
          x_profile_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              phone_number_id: T.nilable(String),
              sandbox: T::Boolean,
              waba_id: String,
              idempotency_key: String,
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
end
