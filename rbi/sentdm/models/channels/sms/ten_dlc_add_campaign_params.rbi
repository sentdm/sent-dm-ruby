# typed: strong

module Sentdm
  module Models
    module Channels
      module SMS
        class TenDlcAddCampaignParams < Sentdm::Internal::Type::BaseModel
          extend Sentdm::Internal::Type::RequestParameters::Converter
          include Sentdm::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Sentdm::Channels::SMS::TenDlcAddCampaignParams,
                Sentdm::Internal::AnyHash
              )
            end

          # The compliance values a market registers with. `brand` and `campaign` apply to
          # US `TEN_DLC`; other markets fill this map with the document keys their own
          # requirements name.
          sig { returns(T.nilable(Sentdm::Channels::MarketCompliance)) }
          attr_reader :compliance

          sig do
            params(compliance: Sentdm::Channels::MarketCompliance::OrHash).void
          end
          attr_writer :compliance

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
              compliance: Sentdm::Channels::MarketCompliance::OrHash,
              sandbox: T::Boolean,
              idempotency_key: String,
              x_profile_id: String,
              request_options: Sentdm::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The compliance values a market registers with. `brand` and `campaign` apply to
            # US `TEN_DLC`; other markets fill this map with the document keys their own
            # requirements name.
            compliance: nil,
            sandbox: nil,
            idempotency_key: nil,
            x_profile_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                compliance: Sentdm::Channels::MarketCompliance,
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
