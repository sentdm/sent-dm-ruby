# typed: strong

module Sentdm
  module Models
    class BrandsBrandData < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::BrandsBrandData, Sentdm::Internal::AnyHash)
        end

      # Compliance and TCR information for brand registration
      sig { returns(Sentdm::BrandComplianceInfo) }
      attr_reader :compliance

      sig { params(compliance: Sentdm::BrandComplianceInfo::OrHash).void }
      attr_writer :compliance

      # Contact information for brand KYC
      sig { returns(Sentdm::BrandContactInfo) }
      attr_reader :contact

      sig { params(contact: Sentdm::BrandContactInfo::OrHash).void }
      attr_writer :contact

      # Business details and address for brand KYC
      sig { returns(T.nilable(Sentdm::BrandBusinessInfo)) }
      attr_reader :business

      sig do
        params(business: T.nilable(Sentdm::BrandBusinessInfo::OrHash)).void
      end
      attr_writer :business

      # Brand and KYC data grouped into contact, business, and compliance sections
      sig do
        params(
          compliance: Sentdm::BrandComplianceInfo::OrHash,
          contact: Sentdm::BrandContactInfo::OrHash,
          business: T.nilable(Sentdm::BrandBusinessInfo::OrHash)
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
            compliance: Sentdm::BrandComplianceInfo,
            contact: Sentdm::BrandContactInfo,
            business: T.nilable(Sentdm::BrandBusinessInfo)
          }
        )
      end
      def to_hash
      end
    end
  end
end
