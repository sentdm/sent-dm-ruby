# typed: strong

module Sentdm
  module Models
    class BrandsBrandData < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::BrandsBrandData, Sentdm::Internal::AnyHash)
        end

      # Compliance and TCR-related information
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

      # Contact information for the brand
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

      # Business details and address information
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
        # Compliance and TCR-related information
        compliance:,
        # Contact information for the brand
        contact:,
        # Business details and address information
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
