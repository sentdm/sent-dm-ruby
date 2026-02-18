# typed: strong

module SentDm
  module Resources
    class Brands
      sig { returns(SentDm::Resources::Brands::Campaigns) }
      attr_reader :campaigns

      # Creates a new brand and associated information. This endpoint automatically sets
      # inheritTcrBrand=false when a brand is created.
      sig do
        params(
          brand: SentDm::BrandData::OrHash,
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::APIResponseBrandWithKYC)
      end
      def create(
        # Body param: Brand and KYC information
        brand:,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Updates an existing brand and its associated information. Cannot update brands
      # that have already been submitted to TCR or inherited brands.
      sig do
        params(
          brand_id: String,
          brand: SentDm::BrandData::OrHash,
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::APIResponseBrandWithKYC)
      end
      def update(
        # Path param: Brand ID from route
        brand_id,
        # Body param: Brand and KYC information
        brand:,
        # Body param: Test mode flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        test_mode: nil,
        # Header param: Unique key to ensure idempotent request processing. Must be 1-255
        # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
        # hours per key per customer.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # Retrieves all brands for the authenticated customer with information in a
      # flattened structure. Includes inherited brands if inheritTcrBrand=true.
      sig do
        params(request_options: SentDm::RequestOptions::OrHash).returns(
          SentDm::Models::BrandListResponse
        )
      end
      def list(request_options: {})
      end

      # Delete a brand by ID. The brand must belong to the authenticated customer.
      sig do
        params(
          brand_id: String,
          body: SentDm::BrandDeleteParams::Body::OrHash,
          request_options: SentDm::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Brand ID from route parameter
        brand_id,
        # Request to delete a brand
        body:,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: SentDm::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
