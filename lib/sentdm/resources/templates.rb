# frozen_string_literal: true

module Sentdm
  module Resources
    class Templates
      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::TemplateCreateParams} for more details.
      #
      # Creates a new message template with header, body, footer, and buttons. The
      # template can be submitted for review immediately or saved as draft for later
      # submission.
      #
      # @overload create(category: nil, creation_source: nil, definition: nil, language: nil, submit_for_review: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param category [String, nil] Body param: Template category: MARKETING, UTILITY, AUTHENTICATION (optional, aut
      #
      # @param creation_source [String, nil] Body param: Source of template creation (default: from-api)
      #
      # @param definition [Sentdm::Models::TemplateDefinition] Body param: Template definition including header, body, footer, and buttons
      #
      # @param language [String, nil] Body param: Template language code (e.g., en_US) (optional, auto-detected if not
      #
      # @param submit_for_review [Boolean] Body param: Whether to submit the template for review after creation (default: f
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseTemplate]
      #
      # @see Sentdm::Models::TemplateCreateParams
      def create(params = {})
        parsed, options = Sentdm::TemplateCreateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "v3/templates",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseTemplate,
          options: options
        )
      end

      # Retrieves a specific template by its ID. Returns template details including
      # name, category, language, status, and definition.
      #
      # @overload retrieve(id, request_options: {})
      #
      # @param id [String] Template ID from route parameter
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseTemplate]
      #
      # @see Sentdm::Models::TemplateRetrieveParams
      def retrieve(id, params = {})
        @client.request(
          method: :get,
          path: ["v3/templates/%1$s", id],
          model: Sentdm::APIResponseTemplate,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Sentdm::Models::TemplateUpdateParams} for more details.
      #
      # Updates an existing template's name, category, language, definition, or submits
      # it for review.
      #
      # @overload update(id, category: nil, definition: nil, language: nil, name: nil, submit_for_review: nil, test_mode: nil, idempotency_key: nil, request_options: {})
      #
      # @param id [String] Path param: Template ID from route parameter
      #
      # @param category [String, nil] Body param: Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      # @param definition [Sentdm::Models::TemplateDefinition, nil] Body param: Template definition including header, body, footer, and buttons
      #
      # @param language [String, nil] Body param: Template language code (e.g., en_US)
      #
      # @param name [String, nil] Body param: Template display name
      #
      # @param submit_for_review [Boolean] Body param: Whether to submit the template for review after updating (default: f
      #
      # @param test_mode [Boolean] Body param: Test mode flag - when true, the operation is simulated without side
      #
      # @param idempotency_key [String] Header param: Unique key to ensure idempotent request processing. Must be 1-255
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::APIResponseTemplate]
      #
      # @see Sentdm::Models::TemplateUpdateParams
      def update(id, params = {})
        parsed, options = Sentdm::TemplateUpdateParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :put,
          path: ["v3/templates/%1$s", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Sentdm::APIResponseTemplate,
          options: options
        )
      end

      # Retrieves a paginated list of message templates for the authenticated customer.
      # Supports filtering by status, category, and search term.
      #
      # @overload list(page:, page_size:, category: nil, search: nil, status: nil, request_options: {})
      #
      # @param page [Integer] Page number (1-indexed)
      #
      # @param page_size [Integer]
      #
      # @param category [String, nil] Optional category filter: MARKETING, UTILITY, AUTHENTICATION
      #
      # @param search [String, nil] Optional search term for filtering templates
      #
      # @param status [String, nil] Optional status filter: APPROVED, PENDING, REJECTED
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Sentdm::Models::TemplateListResponse]
      #
      # @see Sentdm::Models::TemplateListParams
      def list(params)
        parsed, options = Sentdm::TemplateListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v3/templates",
          query: parsed.transform_keys(page_size: "pageSize"),
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
      # @overload delete(id, delete_from_meta: nil, test_mode: nil, request_options: {})
      #
      # @param id [String] Template ID from route parameter
      #
      # @param delete_from_meta [Boolean, nil] Whether to also delete the template from WhatsApp/Meta (optional, defaults to fa
      #
      # @param test_mode [Boolean] Test mode flag - when true, the operation is simulated without side effects
      #
      # @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [nil]
      #
      # @see Sentdm::Models::TemplateDeleteParams
      def delete(id, params = {})
        parsed, options = Sentdm::TemplateDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v3/templates/%1$s", id],
          headers: {"content-type" => "*/*"},
          body: parsed,
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
