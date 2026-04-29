# frozen_string_literal: true

module Sentdm
  module Resources
    class Profiles
      # Manage organization profiles
      class Campaigns
        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Profiles::CampaignCreateParams} for more details.
        #
        # Creates a new campaign scoped under the brand of the specified profile. Each
        # campaign must include at least one use case with sample messages.
        #
        # @overload create(profile_id, campaign:, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param profile_id [String] Path param: Profile ID from route
        #
        # @param campaign [Sentdm::Models::Profiles::CampaignData] Body param: Campaign data for create or update operation
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Profiles::APIResponseOfTcrCampaignWithUseCases]
        #
        # @see Sentdm::Models::Profiles::CampaignCreateParams
        def create(profile_id, params)
          parsed, options = Sentdm::Profiles::CampaignCreateParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :post,
            path: ["v3/profiles/%1$s/campaigns", profile_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Profiles::APIResponseOfTcrCampaignWithUseCases,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Profiles::CampaignUpdateParams} for more details.
        #
        # Updates an existing campaign under the brand of the specified profile. Cannot
        # update campaigns that have already been submitted to TCR.
        #
        # @overload update(campaign_id, profile_id:, campaign:, sandbox: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
        #
        # @param campaign_id [String] Path param: Campaign ID from route
        #
        # @param profile_id [String] Path param: Profile ID from route
        #
        # @param campaign [Sentdm::Models::Profiles::CampaignData] Body param: Campaign data for create or update operation
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Profiles::APIResponseOfTcrCampaignWithUseCases]
        #
        # @see Sentdm::Models::Profiles::CampaignUpdateParams
        def update(campaign_id, params)
          parsed, options = Sentdm::Profiles::CampaignUpdateParams.dump_request(params)
          profile_id =
            parsed.delete(:profile_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
          @client.request(
            method: :put,
            path: ["v3/profiles/%1$s/campaigns/%2$s", profile_id, campaign_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Sentdm::Profiles::APIResponseOfTcrCampaignWithUseCases,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Profiles::CampaignListParams} for more details.
        #
        # Retrieves all campaigns linked to the profile's brand, including use cases and
        # sample messages. Returns inherited campaigns if inherit_tcr_campaign=true.
        #
        # @overload list(profile_id, x_profile_id: nil, request_options: {})
        #
        # @param profile_id [String] Profile ID from route
        #
        # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Sentdm::Models::Profiles::CampaignListResponse]
        #
        # @see Sentdm::Models::Profiles::CampaignListParams
        def list(profile_id, params = {})
          parsed, options = Sentdm::Profiles::CampaignListParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v3/profiles/%1$s/campaigns", profile_id],
            headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
            model: Sentdm::Models::Profiles::CampaignListResponse,
            options: options
          )
        end

        # Some parameter documentations has been truncated, see
        # {Sentdm::Models::Profiles::CampaignDeleteParams} for more details.
        #
        # Deletes a campaign by ID from the brand of the specified profile. The profile
        # must belong to the authenticated organization.
        #
        # @overload delete(campaign_id, profile_id:, sandbox: nil, x_profile_id: nil, request_options: {})
        #
        # @param campaign_id [String] Path param: Campaign ID from route parameter
        #
        # @param profile_id [String] Path param: Profile ID from route parameter
        #
        # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
        #
        # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
        #
        # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [nil]
        #
        # @see Sentdm::Models::Profiles::CampaignDeleteParams
        def delete(campaign_id, params)
          parsed, options = Sentdm::Profiles::CampaignDeleteParams.dump_request(params)
          profile_id =
            parsed.delete(:profile_id) do
              raise ArgumentError.new("missing required path argument #{_1}")
            end
          header_params = {x_profile_id: "x-profile-id"}
          @client.request(
            method: :delete,
            path: ["v3/profiles/%1$s/campaigns/%2$s", profile_id, campaign_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: NilClass,
            options: options
          )
        end

        # @api private
        #
        # @param client [Sentdm::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
