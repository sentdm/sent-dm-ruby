# frozen_string_literal: true

module Sentdm
  module Resources
    # Manage message templates with variable substitution
    class Templates
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::TemplateCreateParams} for more details.
      #
      # Creates a new message template with header, body, footer, and buttons. The
      # template can be submitted for review immediately or saved as draft for later
      # submission.
      #
      # @overload create(category: nil, creation_source: nil, definition: nil, language: nil, sandbox: nil, submit_for_review: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param category [String, nil] Body param: Template category: MARKETING, UTILITY, AUTHENTICATION (optional, aut
      #
      # @param creation_source [String, nil] Body param: Source of template creation (default: from-api)
      #
      # @param definition [Sentdm::Models::TemplateDefinition] Body param: Complete definition of a message template including header, body, fo
      #
      # @param language [String, nil] Body param: Template language code (e.g., en_US) (optional, auto-detected if not
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param submit_for_review [Boolean] Body param: Whether to submit the template for review after creation (default: f
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseTemplate]
      #
      # @see Sentdm::Models::TemplateCreateParams
      def create(params = {})
        parsed, options = Sentdm::TemplateCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :post,
          path: "v3/templates",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseTemplate,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::TemplateRetrieveParams} for more details.
      #
      # Retrieves a specific template by its ID. Returns template details including
      # name, category, language, status, and definition.
      #
      # @overload retrieve(id, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Template ID from route parameter
      #
      # @param x_profile_id [String] Profile UUID to scope the request to a child profile. Only organization API keys
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseTemplate]
      #
      # @see Sentdm::Models::TemplateRetrieveParams
      def retrieve(id, params = {})
        parsed, options = Sentdm::TemplateRetrieveParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v3/templates/%1$s", id],
          headers: parsed.transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::APIResponseTemplate,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::TemplateUpdateParams} for more details.
      #
      # Updates an existing template's name, category, language, definition, or submits
      # it for review.
      #
      # @overload update(id, category: nil, definition: nil, language: nil, name: nil, sandbox: nil, submit_for_review: nil, idempotency_key: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param: Template ID from route parameter
      #
      # @param category [String, nil] Body param: Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      # @param definition [Sentdm::Models::TemplateDefinition, nil] Body param: Complete definition of a message template including header, body, fo
      #
      # @param language [String, nil] Body param: Template language code (e.g., en_US)
      #
      # @param name [String, nil] Body param: Template display name
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param submit_for_review [Boolean] Body param: Whether to submit the template for review after updating (default: f
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseTemplate]
      #
      # @see Sentdm::Models::TemplateUpdateParams
      def update(id, params = {})
        parsed, options = Sentdm::TemplateUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key", x_profile_id: "x-profile-id"}
        @client.request(
          method: :put,
          path: ["v3/templates/%1$s", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseTemplate,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::TemplateListParams} for more details.
      #
      # Retrieves a paginated list of message templates for the authenticated customer.
      # Supports filtering by status, category, and search term.
      #
      # @overload list(page:, page_size:, category: nil, is_welcome_playground: nil, search: nil, status: nil, x_profile_id: nil, request_options: {})
      #
      # @param page [Integer] Query param: Page number (1-indexed)
      #
      # @param page_size [Integer] Query param: Number of items per page
      #
      # @param category [String, nil] Query param: Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      #
      # @param is_welcome_playground [Boolean, nil] Query param: Optional filter by welcome playground flag
      #
      # @param search [String, nil] Query param: Optional search term for filtering templates
      #
      # @param status [String, nil] Query param: Optional status filter: APPROVED, PENDING, REJECTED
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::TemplateListResponse]
      #
      # @see Sentdm::Models::TemplateListParams
      def list(params)
        query_params = [:page, :page_size, :category, :is_welcome_playground, :search, :status]
        parsed, options = Sentdm::TemplateListParams.dump_request(params)
        query = Sentdm::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: "v3/templates",
          query: query,
          headers: parsed.except(*query_params).transform_keys(x_profile_id: "x-profile-id"),
          model: Sentdm::Models::TemplateListResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::TemplateDeleteParams} for more details.
      #
      # Deletes a template by ID. Optionally, you can also delete the template from
      # WhatsApp/Meta by setting delete_from_meta=true.
      #
      # @overload delete(id, delete_from_meta: nil, sandbox: nil, x_profile_id: nil, request_options: {})
      #
      # @param id [String] Path param: Template ID from route parameter
      #
      # @param delete_from_meta [Boolean, nil] Body param: Whether to also delete the template from WhatsApp/Meta (optional, de
      #
      # @param sandbox [Boolean] Body param: Sandbox flag - when true, the operation is simulated without side ef
      #
      # @param x_profile_id [String] Header param: Profile UUID to scope the request to a child profile. Only organiz
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::TemplateDeleteParams
      def delete(id, params = {})
        parsed, options = Sentdm::TemplateDeleteParams.dump_request(params)
        header_params = {x_profile_id: "x-profile-id"}
        @client.request(
          method: :delete,
          path: ["v3/templates/%1$s", id],
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
