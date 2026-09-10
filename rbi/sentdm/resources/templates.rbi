# typed: strong

module Sentdm
  module Resources
    # Reusable message bodies with named variables.
    #
    # A template is substituted at send time from the values you pass, so the copy
    # lives here rather than in your application. WhatsApp templates additionally need
    # Meta's approval before they can be sent, and a template's channel status reports
    # where that stands — an approved SMS template and an unapproved WhatsApp one are
    # the same template in two states.
    class Templates
      # Creates a new message template with header, body, footer, and buttons. The
      # template can be submitted for review immediately or saved as draft for later
      # submission.
      sig do
        params(
          category: T.nilable(String),
          creation_source: T.nilable(String),
          definition: Sentdm::TemplateDefinition::OrHash,
          language: T.nilable(String),
          sandbox: T::Boolean,
          submit_for_review: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseTemplate)
      end
      def create(
        # Body param: Template category: MARKETING, UTILITY, AUTHENTICATION (optional,
        # auto-detected if not provided)
        category: nil,
        # Body param: Source of template creation (default: from-api)
        creation_source: nil,
        # Body param: Complete definition of a message template including header, body,
        # footer, and buttons
        definition: nil,
        # Body param: Template language code (e.g., en_US) (optional, auto-detected if not
        # provided)
        language: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param: Whether to submit the template for review after creation (default:
        # false)
        submit_for_review: nil,
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

      # Retrieves a specific template by its ID. Returns template details including
      # name, category, language, status, and definition.
      sig do
        params(
          id: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseTemplate)
      end
      def retrieve(
        # Template ID from route parameter
        id,
        # Profile UUID to scope the request to a child profile. Only organization API keys
        # can use this header. The profile must belong to the calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Updates an existing template's name, category, language, definition, or submits
      # it for review.
      sig do
        params(
          id: String,
          category: T.nilable(String),
          definition: T.nilable(Sentdm::TemplateDefinition::OrHash),
          language: T.nilable(String),
          name: T.nilable(String),
          sandbox: T::Boolean,
          submit_for_review: T::Boolean,
          idempotency_key: String,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::APIResponseTemplate)
      end
      def update(
        # Path param: Template ID from route parameter
        id,
        # Body param: Template category: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Body param: Complete definition of a message template including header, body,
        # footer, and buttons
        definition: nil,
        # Body param: Template language code (e.g., en_US)
        language: nil,
        # Body param: Template display name
        name: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
        # Body param: Whether to submit the template for review after updating (default:
        # false)
        submit_for_review: nil,
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

      # Retrieves a paginated list of message templates for the authenticated customer.
      # Supports filtering by status, category, and search term.
      sig do
        params(
          category: T.nilable(String),
          is_welcome_playground: T.nilable(T::Boolean),
          page: Integer,
          page_size: Integer,
          search: T.nilable(String),
          status: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(Sentdm::Internal::TemplatesPage[Sentdm::Template])
      end
      def list(
        # Query param: Optional category filter: MARKETING, UTILITY, AUTHENTICATION
        category: nil,
        # Query param: Accepted and ignored. It used to filter on the welcome-playground
        # marker inside a template's LOB details; that filter is gone and nothing reads
        # this value, so sending it neither narrows nor widens the result. Retained only
        # so a client still passing is_welcome_playground keeps binding instead of the
        # request shape changing under it.
        is_welcome_playground: nil,
        # Query param: Page number (1-indexed)
        page: nil,
        # Query param: Number of items per page
        page_size: nil,
        # Query param: Optional search term for filtering templates
        search: nil,
        # Query param: Optional status filter: APPROVED, PENDING, REJECTED
        status: nil,
        # Header param: Profile UUID to scope the request to a child profile. Only
        # organization API keys can use this header. The profile must belong to the
        # calling organization.
        x_profile_id: nil,
        request_options: {}
      )
      end

      # Deletes a template by ID. Optionally, you can also delete the template from
      # WhatsApp/Meta by setting delete_from_meta=true.
      sig do
        params(
          id: String,
          delete_from_meta: T.nilable(T::Boolean),
          sandbox: T::Boolean,
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).void
      end
      def delete(
        # Path param: Template ID from route parameter
        id,
        # Body param: Whether to also delete the template from WhatsApp/Meta (optional,
        # defaults to false)
        delete_from_meta: nil,
        # Body param: Sandbox flag - when true, the operation is simulated without side
        # effects Useful for testing integrations without actual execution
        sandbox: nil,
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
