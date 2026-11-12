# typed: strong

module Sentdm
  module Models
    module Channels
      module SMS
        class TenDlcAddNumbersParams < Sentdm::Internal::Type::BaseModel
          extend Sentdm::Internal::Type::RequestParameters::Converter
          include Sentdm::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::SMS::TenDlcAddNumbersParams,
                Sentdm::Internal::AnyHash
              )
            end

          # The campaign to add the numbers to, as compliance.campaigns[].id reports it.
          # Required.
          sig { returns(String) }
          attr_accessor :campaign_id

          # The numbers to add, one entry per area code, e.g. [{"area_code": "415",
          # "quantity": 2}, {"quantity": 1}]. quantity defaults to 1, and an entry without
          # area_code means any area code. Required.
          #
          # Added to what the campaign already asks for, never replacing it.
          sig do
            returns(T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest)])
          end
          attr_accessor :numbers

          # Sandbox flag - when true, the operation is simulated without side effects Useful
          # for testing integrations without actual execution
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :sandbox

          sig { params(sandbox: T::Boolean).void }
          attr_writer :sandbox

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
              campaign_id: String,
              numbers:
                T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest::OrHash)],
              sandbox: T::Boolean,
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The campaign to add the numbers to, as compliance.campaigns[].id reports it.
            # Required.
            campaign_id:,
            # The numbers to add, one entry per area code, e.g. [{"area_code": "415",
            # "quantity": 2}, {"quantity": 1}]. quantity defaults to 1, and an entry without
            # area_code means any area code. Required.
            #
            # Added to what the campaign already asks for, never replacing it.
            numbers:,
            # Sandbox flag - when true, the operation is simulated without side effects Useful
            # for testing integrations without actual execution
            sandbox: nil,
            idempotency_key: nil,
            x_profile_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                campaign_id: String,
                numbers:
                  T::Array[T.nilable(Sentdm::Channels::SMSNumberRequest)],
                sandbox: T::Boolean,
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
end
