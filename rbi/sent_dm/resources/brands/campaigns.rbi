# typed: strong

module SentDm
  module Resources
    class Brands
      class Campaigns
        # Creates a new campaign scoped under a specific brand. The campaign is linked to
        # the specified brand. Each campaign must include at least one use case with
        # sample messages.
        sig do
          params(
            brand_id: String,
            campaign: SentDm::Brands::CampaignData::OrHash,
            test_mode: T::Boolean,
            idempotency_key: String,
            request_options: SentDm::RequestOptions::OrHash
          ).returns(SentDm::Brands::APIResponseTcrCampaignWithUseCases)
        end
        def create(
          # Path param: Brand ID from route
          brand_id,
          # Body param: Campaign data
          campaign:,
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

        # Updates an existing campaign scoped under a specific brand. Cannot update
        # campaigns that have already been submitted to TCR.
        sig do
          params(
            campaign_id: String,
            brand_id: String,
            campaign: SentDm::Brands::CampaignData::OrHash,
            test_mode: T::Boolean,
            idempotency_key: String,
            request_options: SentDm::RequestOptions::OrHash
          ).returns(SentDm::Brands::APIResponseTcrCampaignWithUseCases)
        end
        def update(
          # Path param: Campaign ID from route
          campaign_id,
          # Path param: Brand ID from route
          brand_id:,
          # Body param: Campaign data
          campaign:,
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

        # Retrieves all campaigns linked to a specific brand, including their use cases
        # and sample messages.
        sig do
          params(
            brand_id: String,
            request_options: SentDm::RequestOptions::OrHash
          ).returns(SentDm::Models::Brands::CampaignListResponse)
        end
        def list(
          # Brand ID from route
          brand_id,
          request_options: {}
        )
        end

        # Deletes a campaign by ID within a specific brand. The brand must belong to the
        # authenticated customer.
        sig do
          params(
            campaign_id: String,
            brand_id: String,
            body: SentDm::Brands::CampaignDeleteParams::Body::OrHash,
            request_options: SentDm::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Path param: Campaign ID from route parameter
          campaign_id,
          # Path param: Brand ID from route parameter
          brand_id:,
          # Body param: Request to delete a campaign from a brand
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
end
