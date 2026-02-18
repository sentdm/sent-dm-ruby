# typed: strong

module SentDm
  module Resources
    class Templates
      # Creates a new message template with header, body, footer, and buttons. The
      # template can be submitted for review immediately or saved as draft for later
      # submission.
      sig do
        params(
          category: T.nilable(String),
          creation_source: T.nilable(String),
          definition: SentDm::TemplateDefinition::OrHash,
          language: T.nilable(String),
          submit_for_review: T::Boolean,
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::APIResponseTemplate)
      end
      def create(
        # Body param: Template category: MARKETING, UTILITY, AUTHENTICATION (optional,
        # auto-detected if not provided)
        category: nil,
        # Body param: Source of template creation (default: from-api)
        creation_source: nil,
        # Body param: Template definition including header, body, footer, and buttons
        definition: nil,
        # Body param: Template language code (e.g., en_US) (optional, auto-detected if not
        # provided)
        language: nil,
        # Body param: Whether to submit the template for review after creation (default:
        # false)
        submit_for_review: nil,
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

      # Retrieves a specific template by its ID. Returns template details including
      # name, category, language, status, and definition.
      sig do
        params(
          id: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::APIResponseTemplate)
      end
      def retrieve(
        # Template ID from route parameter
        id,
        request_options: {}
      )
      end

      # Updates an existing template's name, category, language, definition, or submits
      # it for review.
      sig do
        params(
          id: String,
          category: T.nilable(String),
          definition: T.nilable(SentDm::TemplateDefinition::OrHash),
          language: T.nilable(String),
          name: T.nilable(String),
          submit_for_review: T::Boolean,
          test_mode: T::Boolean,
          idempotency_key: String,
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::APIResponseTemplate)
      end
      def update(
        # Path param: Template ID from route parameter
        id,
        # Body param: Template category: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Body param: Template definition including header, body, footer, and buttons
        definition: nil,
        # Body param: Template language code (e.g., en_US)
        language: nil,
        # Body param: Template display name
        name: nil,
        # Body param: Whether to submit the template for review after updating (default:
        # false)
        submit_for_review: nil,
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

      # Retrieves a paginated list of message templates for the authenticated customer.
      # Supports filtering by status, category, and search term.
      sig do
        params(
          page: Integer,
          page_size: Integer,
          category: T.nilable(String),
          search: T.nilable(String),
          status: T.nilable(String),
          request_options: SentDm::RequestOptions::OrHash
        ).returns(SentDm::Models::TemplateListResponse)
      end
      def list(
        # Page number (1-indexed)
        page:,
        page_size:,
        # Optional category filter: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Optional search term for filtering templates
        search: nil,
        # Optional status filter: APPROVED, PENDING, REJECTED
        status: nil,
        request_options: {}
      )
      end

      # Deletes a template by ID. Optionally, you can also delete the template from
      # WhatsApp/Meta by setting delete_from_meta=true.
      sig do
        params(
          id: String,
          delete_from_meta: T.nilable(T::Boolean),
          test_mode: T::Boolean,
          request_options: SentDm::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Template ID from route parameter
        id,
        # Whether to also delete the template from WhatsApp/Meta (optional, defaults to
        # false)
        delete_from_meta: nil,
        # Test mode flag - when true, the operation is simulated without side effects
        # Useful for testing integrations without actual execution
        test_mode: nil,
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
