# typed: strong

module Sentdm
  module Models
    module Brands
      class SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData < Sentdm::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Sentdm::Brands::SentDmServicesEndpointsCustomerApIv3ContractsRequestsCampaignsCampaignUseCaseData,
              Sentdm::Internal::AnyHash
            )
          end

        # US messaging use case category
        sig { returns(Sentdm::Brands::MessagingUseCaseUs::OrSymbol) }
        attr_accessor :messaging_use_case_us

        # Sample messages for this use case (1-5 messages, max 1024 characters each)
        sig { returns(T::Array[String]) }
        attr_accessor :sample_messages

        # Campaign use case with sample messages
        sig do
          params(
            messaging_use_case_us: Sentdm::Brands::MessagingUseCaseUs::OrSymbol,
            sample_messages: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # US messaging use case category
          messaging_use_case_us:,
          # Sample messages for this use case (1-5 messages, max 1024 characters each)
          sample_messages:
        )
        end

        sig do
          override.returns(
            {
              messaging_use_case_us:
                Sentdm::Brands::MessagingUseCaseUs::OrSymbol,
              sample_messages: T::Array[String]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
