# typed: strong

module Sentdm
  module Resources
    class Profiles
      # Manage organization profiles
      class Campaigns
        # Creates a new campaign scoped under the brand of the specified profile. Each
        # campaign must include at least one use case with sample messages.
        sig do
          params(
            profile_id: String,
            campaign: Sentdm::Profiles::CampaignData::OrHash,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Profiles::APIResponseOfTcrCampaignWithUseCases)
        end
        def create(
          # Path param: Profile ID from route
          profile_id,
          # Body param: Campaign data for create or update operation
          campaign:,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Header param: Unique key to ensure idempotent request processing. Must be 1-255
          # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
          # hours per key per customer.
          idempotency_key: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Updates an existing campaign under the brand of the specified profile. Cannot
        # update campaigns that have already been submitted to TCR.
        sig do
          params(
            campaign_id: String,
            profile_id: String,
            campaign: Sentdm::Profiles::CampaignData::OrHash,
            sandbox: T::Boolean,
            idempotency_key: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Profiles::APIResponseOfTcrCampaignWithUseCases)
        end
        def update(
          # Path param: Campaign ID from route
          campaign_id,
          # Path param: Profile ID from route
          profile_id:,
          # Body param: Campaign data for create or update operation
          campaign:,
          # Body param: Sandbox flag - when true, the operation is simulated without side
          # effects Useful for testing integrations without actual execution
          sandbox: nil,
          # Header param: Unique key to ensure idempotent request processing. Must be 1-255
          # alphanumeric characters, hyphens, or underscores. Responses are cached for 24
          # hours per key per customer.
          idempotency_key: nil,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Retrieves all campaigns linked to the profile's brand, including use cases and
        # sample messages. Returns inherited campaigns if inherit_tcr_campaign=true.
        sig do
          params(
            profile_id: String,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).returns(Sentdm::Models::Profiles::CampaignListResponse)
        end
        def list(
          # Profile ID from route
          profile_id,
          # Profile UUID to scope the request to a child profile. Only organization API keys
          # can use this header. The profile must belong to the calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # Deletes a campaign by ID from the brand of the specified profile. The profile
        # must belong to the authenticated organization.
        sig do
          params(
            campaign_id: String,
            profile_id: String,
            body: Sentdm::Profiles::CampaignDeleteParams::Body::OrHash,
            x_profile_id: String,
            request_options: Sentdm::RequestOptions::OrHash
          ).void
        end
        def delete(
          # Path param: Campaign ID from route parameter
          campaign_id,
          # Path param: Profile ID from route parameter
          profile_id:,
          # Body param: Request to delete a campaign from a brand
          body:,
          # Header param: Profile UUID to scope the request to a child profile. Only
          # organization API keys can use this header. The profile must belong to the
          # calling organization.
          x_profile_id: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Sentdm::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
