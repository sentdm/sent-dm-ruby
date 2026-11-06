# typed: strong

module Sentdm
  module Models
    class BrandWithKYC < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Sentdm::BrandWithKYC, Sentdm::Internal::AnyHash) }

      # Unique identifier for the brand
      sig { returns(T.nilable(String)) }
      attr_reader :id

      sig { params(id: String).void }
      attr_writer :id

      # Business details and address information
      sig { returns(T.nilable(Sentdm::BrandBusiness)) }
      attr_reader :business

      sig { params(business: T.nilable(Sentdm::BrandBusiness::OrHash)).void }
      attr_writer :business

      # Compliance and TCR-related information
      sig { returns(T.nilable(Sentdm::BrandCompliance)) }
      attr_reader :compliance

      sig do
        params(compliance: T.nilable(Sentdm::BrandCompliance::OrHash)).void
      end
      attr_writer :compliance

      # Contact information for the brand
      sig { returns(T.nilable(Sentdm::BrandContact)) }
      attr_reader :contact

      sig { params(contact: T.nilable(Sentdm::BrandContact::OrHash)).void }
      attr_writer :contact

      # When the brand was created
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Deprecated and scheduled for removal. Identifies the Campaign Service Provider
      # that registered the brand, which is Sent, so the value is the same for every
      # brand and every account. Nothing on your side can act on it and there is no
      # replacement. Stop reading it.
      sig { returns(T.nilable(String)) }
      attr_accessor :csp_id

      sig { returns(T.nilable(Sentdm::TcrBrandIdentityStatus::TaggedSymbol)) }
      attr_accessor :identity_status

      # Whether this brand is inherited from the parent organization
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_inherited

      sig { params(is_inherited: T::Boolean).void }
      attr_writer :is_inherited

      sig { returns(T.nilable(Sentdm::TcrBrandStatus::TaggedSymbol)) }
      attr_accessor :status

      # When the brand was submitted to TCR
      sig { returns(T.nilable(Time)) }
      attr_accessor :submitted_at

      # Whether this brand has been submitted to TCR
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :submitted_to_tcr

      sig { params(submitted_to_tcr: T::Boolean).void }
      attr_writer :submitted_to_tcr

      # TCR brand ID (populated after TCR submission)
      sig { returns(T.nilable(String)) }
      attr_accessor :tcr_brand_id

      # Universal EIN from TCR
      sig { returns(T.nilable(String)) }
      attr_accessor :universal_ein

      # When the brand was last updated
      sig { returns(T.nilable(Time)) }
      attr_accessor :updated_at

      # Brand response with nested contact, business, and compliance sections — mirrors
      # the request structure.
      sig do
        params(
          id: String,
          business: T.nilable(Sentdm::BrandBusiness::OrHash),
          compliance: T.nilable(Sentdm::BrandCompliance::OrHash),
          contact: T.nilable(Sentdm::BrandContact::OrHash),
          created_at: Time,
          csp_id: T.nilable(String),
          identity_status: T.nilable(Sentdm::TcrBrandIdentityStatus::OrSymbol),
          is_inherited: T::Boolean,
          status: T.nilable(Sentdm::TcrBrandStatus::OrSymbol),
          submitted_at: T.nilable(Time),
          submitted_to_tcr: T::Boolean,
          tcr_brand_id: T.nilable(String),
          universal_ein: T.nilable(String),
          updated_at: T.nilable(Time)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique identifier for the brand
        id: nil,
        # Business details and address information
        business: nil,
        # Compliance and TCR-related information
        compliance: nil,
        # Contact information for the brand
        contact: nil,
        # When the brand was created
        created_at: nil,
        # Deprecated and scheduled for removal. Identifies the Campaign Service Provider
        # that registered the brand, which is Sent, so the value is the same for every
        # brand and every account. Nothing on your side can act on it and there is no
        # replacement. Stop reading it.
        csp_id: nil,
        identity_status: nil,
        # Whether this brand is inherited from the parent organization
        is_inherited: nil,
        status: nil,
        # When the brand was submitted to TCR
        submitted_at: nil,
        # Whether this brand has been submitted to TCR
        submitted_to_tcr: nil,
        # TCR brand ID (populated after TCR submission)
        tcr_brand_id: nil,
        # Universal EIN from TCR
        universal_ein: nil,
        # When the brand was last updated
        updated_at: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            business: T.nilable(Sentdm::BrandBusiness),
            compliance: T.nilable(Sentdm::BrandCompliance),
            contact: T.nilable(Sentdm::BrandContact),
            created_at: Time,
            csp_id: T.nilable(String),
            identity_status:
              T.nilable(Sentdm::TcrBrandIdentityStatus::TaggedSymbol),
            is_inherited: T::Boolean,
            status: T.nilable(Sentdm::TcrBrandStatus::TaggedSymbol),
            submitted_at: T.nilable(Time),
            submitted_to_tcr: T::Boolean,
            tcr_brand_id: T.nilable(String),
            universal_ein: T.nilable(String),
            updated_at: T.nilable(Time)
          }
        )
      end
      def to_hash
      end
    end
  end
end
