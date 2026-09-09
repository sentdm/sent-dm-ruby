# typed: strong

module Sentdm
  module Models
    module Profiles
      class CampaignUseCase < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Sentdm::Profiles::CampaignUseCase, Sentdm::Internal::AnyHash)
          end

        sig { returns(T.nilable(String)) }
        attr_reader :id

        sig { params(id: String).void }
        attr_writer :id

        sig { returns(T.nilable(String)) }
        attr_reader :campaign_id

        sig { params(campaign_id: String).void }
        attr_writer :campaign_id

        sig { returns(T.nilable(Time)) }
        attr_reader :created_at

        sig { params(created_at: Time).void }
        attr_writer :created_at

        sig { returns(T.nilable(String)) }
        attr_reader :customer_id

        sig { params(customer_id: String).void }
        attr_writer :customer_id

        sig do
          returns(T.nilable(Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol))
        end
        attr_reader :messaging_use_case_us

        sig do
          params(
            messaging_use_case_us:
              Sentdm::Profiles::MessagingUseCaseUs::OrSymbol
          ).void
        end
        attr_writer :messaging_use_case_us

        # Sample messages submitted to the registry for this use case.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :sample_messages

        sig { params(sample_messages: T::Array[String]).void }
        attr_writer :sample_messages

        sig { returns(T.nilable(Time)) }
        attr_accessor :updated_at

        # Customer-facing use-case representation for the public v3 campaign contract.
        # Exists for the same reason as BrandCampaignV3Response: nesting the
        # TcrCampaignUseCase database entity in a public response means any column added
        # to that table silently becomes part of the customer-facing contract. This DTO is
        # an explicit allowlist, so a new column stays invisible until it is added here on
        # purpose. This mirrors exactly the fields the entity already serialized, so it
        # removes nothing from the current response shape. It only closes the future-leak
        # path.
        sig do
          params(
            id: String,
            campaign_id: String,
            created_at: Time,
            customer_id: String,
            messaging_use_case_us:
              Sentdm::Profiles::MessagingUseCaseUs::OrSymbol,
            sample_messages: T::Array[String],
            updated_at: T.nilable(Time)
          ).returns(T.attached_class)
        end
        def self.new(
          id: nil,
          campaign_id: nil,
          created_at: nil,
          customer_id: nil,
          messaging_use_case_us: nil,
          # Sample messages submitted to the registry for this use case.
          sample_messages: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              campaign_id: String,
              created_at: Time,
              customer_id: String,
              messaging_use_case_us:
                Sentdm::Profiles::MessagingUseCaseUs::TaggedSymbol,
              sample_messages: T::Array[String],
              updated_at: T.nilable(Time)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
