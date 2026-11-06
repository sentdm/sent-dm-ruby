# frozen_string_literal: true

module Sentdm
  module Models
    class BrandWithKYC < Sentdm::Internal::Type::BaseModel
      # @!attribute id
      #   Unique identifier for the brand
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute business
      #   Business details and address information
      #
      #   @return [Sentdm::Models::BrandBusiness, nil]
      optional :business, -> { Sentdm::BrandBusiness }, nil?: true

      # @!attribute compliance
      #   Compliance and TCR-related information
      #
      #   @return [Sentdm::Models::BrandCompliance, nil]
      optional :compliance, -> { Sentdm::BrandCompliance }, nil?: true

      # @!attribute contact
      #   Contact information for the brand
      #
      #   @return [Sentdm::Models::BrandContact, nil]
      optional :contact, -> { Sentdm::BrandContact }, nil?: true

      # @!attribute created_at
      #   When the brand was created
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute csp_id
      #   @deprecated
      #
      #   Deprecated and scheduled for removal. Identifies the Campaign Service Provider
      #   that registered the brand, which is Sent, so the value is the same for every
      #   brand and every account. Nothing on your side can act on it and there is no
      #   replacement. Stop reading it.
      #
      #   @return [String, nil]
      optional :csp_id, String, nil?: true

      # @!attribute identity_status
      #
      #   @return [Symbol, Sentdm::Models::TcrBrandIdentityStatus, nil]
      optional :identity_status, enum: -> { Sentdm::TcrBrandIdentityStatus }, nil?: true

      # @!attribute is_inherited
      #   Whether this brand is inherited from the parent organization
      #
      #   @return [Boolean, nil]
      optional :is_inherited, Sentdm::Internal::Type::Boolean

      # @!attribute status
      #
      #   @return [Symbol, Sentdm::Models::TcrBrandStatus, nil]
      optional :status, enum: -> { Sentdm::TcrBrandStatus }, nil?: true

      # @!attribute submitted_at
      #   When the brand was submitted to TCR
      #
      #   @return [Time, nil]
      optional :submitted_at, Time, nil?: true

      # @!attribute submitted_to_tcr
      #   Whether this brand has been submitted to TCR
      #
      #   @return [Boolean, nil]
      optional :submitted_to_tcr, Sentdm::Internal::Type::Boolean

      # @!attribute tcr_brand_id
      #   TCR brand ID (populated after TCR submission)
      #
      #   @return [String, nil]
      optional :tcr_brand_id, String, nil?: true

      # @!attribute universal_ein
      #   Universal EIN from TCR
      #
      #   @return [String, nil]
      optional :universal_ein, String, nil?: true

      # @!attribute updated_at
      #   When the brand was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!method initialize(id: nil, business: nil, compliance: nil, contact: nil, created_at: nil, csp_id: nil, identity_status: nil, is_inherited: nil, status: nil, submitted_at: nil, submitted_to_tcr: nil, tcr_brand_id: nil, universal_ein: nil, updated_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::BrandWithKYC} for more details.
      #
      #   Brand response with nested contact, business, and compliance sections — mirrors
      #   the request structure.
      #
      #   @param id [String] Unique identifier for the brand
      #
      #   @param business [Sentdm::Models::BrandBusiness, nil] Business details and address information
      #
      #   @param compliance [Sentdm::Models::BrandCompliance, nil] Compliance and TCR-related information
      #
      #   @param contact [Sentdm::Models::BrandContact, nil] Contact information for the brand
      #
      #   @param created_at [Time] When the brand was created
      #
      #   @param csp_id [String, nil] Deprecated and scheduled for removal. Identifies the Campaign Service Provider t
      #
      #   @param identity_status [Symbol, Sentdm::Models::TcrBrandIdentityStatus, nil]
      #
      #   @param is_inherited [Boolean] Whether this brand is inherited from the parent organization
      #
      #   @param status [Symbol, Sentdm::Models::TcrBrandStatus, nil]
      #
      #   @param submitted_at [Time, nil] When the brand was submitted to TCR
      #
      #   @param submitted_to_tcr [Boolean] Whether this brand has been submitted to TCR
      #
      #   @param tcr_brand_id [String, nil] TCR brand ID (populated after TCR submission)
      #
      #   @param universal_ein [String, nil] Universal EIN from TCR
      #
      #   @param updated_at [Time, nil] When the brand was last updated
    end
  end
end
