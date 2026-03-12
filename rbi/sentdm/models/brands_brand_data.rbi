# typed: strong

module Sentdm
  module Models
    class BrandsBrandData < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::BrandsBrandData, Sentdm::Internal::AnyHash)
        end

      # Compliance and TCR information for brand registration
      sig do
        returns(
          Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo
        )
      end
      attr_reader :compliance

      sig do
        params(
          compliance:
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo::OrHash
        ).void
      end
      attr_writer :compliance

      # Contact information for brand KYC
      sig do
        returns(
          Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo
        )
      end
      attr_reader :contact

      sig do
        params(
          contact:
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo::OrHash
        ).void
      end
      attr_writer :contact

      # Business details and address for brand KYC
      sig do
        returns(
          T.nilable(
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo
          )
        )
      end
      attr_reader :business

      sig do
        params(
          business:
            T.nilable(
              Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::OrHash
            )
        ).void
      end
      attr_writer :business

      # Brand and KYC data grouped into contact, business, and compliance sections
      sig do
        params(
          compliance:
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo::OrHash,
          contact:
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo::OrHash,
          business:
            T.nilable(
              Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::OrHash
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # Compliance and TCR information for brand registration
        compliance:,
        # Contact information for brand KYC
        contact:,
        # Business details and address for brand KYC
        business: nil
      )
      end

      sig do
        override.returns(
          {
            compliance:
              Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandComplianceInfo,
            contact:
              Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandContactInfo,
            business:
              T.nilable(
                Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end
