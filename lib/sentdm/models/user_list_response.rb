# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Users#list
    class UserListResponse < Sentdm::Internal::Type::BaseModel
      # @!attribute data
      #   List of users response
      #
      #   @return [Sentdm::Models::UserListResponse::Data, nil]
      optional :data, -> { Sentdm::Models::UserListResponse::Data }, nil?: true

      # @!attribute error
      #   Error information
      #
      #   @return [Sentdm::Models::UserListResponse::Error, nil]
      optional :error, -> { Sentdm::Models::UserListResponse::Error }, nil?: true

      # @!attribute meta
      #   Request and response metadata
      #
      #   @return [Sentdm::Models::UserListResponse::Meta, nil]
      optional :meta, -> { Sentdm::Models::UserListResponse::Meta }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean, nil]
      optional :success, Sentdm::Internal::Type::Boolean

      # @!method initialize(data: nil, error: nil, meta: nil, success: nil)
      #   Standard API response envelope for all v3 endpoints
      #
      #   @param data [Sentdm::Models::UserListResponse::Data, nil] List of users response
      #
      #   @param error [Sentdm::Models::UserListResponse::Error, nil] Error information
      #
      #   @param meta [Sentdm::Models::UserListResponse::Meta] Request and response metadata
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Sentdm::Models::UserListResponse#data
      class Data < Sentdm::Internal::Type::BaseModel
        # @!attribute users
        #   List of users in the organization
        #
        #   @return [Array<Sentdm::Models::UserListResponse::Data::User>, nil]
        optional :users, -> { Sentdm::Internal::Type::ArrayOf[Sentdm::Models::UserListResponse::Data::User] }

        # @!method initialize(users: nil)
        #   List of users response
        #
        #   @param users [Array<Sentdm::Models::UserListResponse::Data::User>] List of users in the organization

        class User < Sentdm::Internal::Type::BaseModel
          # @!attribute id
          #   User unique identifier
          #
          #   @return [String, nil]
          optional :id, String

          # @!attribute created_at
          #   When the user was added to the organization
          #
          #   @return [Time, nil]
          optional :created_at, Time

          # @!attribute email
          #   User email address
          #
          #   @return [String, nil]
          optional :email, String

          # @!attribute invited_at
          #   When the user was invited
          #
          #   @return [Time, nil]
          optional :invited_at, Time, nil?: true

          # @!attribute last_login_at
          #   When the user last logged in
          #
          #   @return [Time, nil]
          optional :last_login_at, Time, nil?: true

          # @!attribute name
          #   User full name
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute role
          #   User role in the organization: admin, billing, developer
          #
          #   @return [String, nil]
          optional :role, String

          # @!attribute status
          #   User status: active, invited, suspended, rejected
          #
          #   @return [String, nil]
          optional :status, String

          # @!attribute updated_at
          #   When the user record was last updated
          #
          #   @return [Time, nil]
          optional :updated_at, Time, nil?: true

          # @!method initialize(id: nil, created_at: nil, email: nil, invited_at: nil, last_login_at: nil, name: nil, role: nil, status: nil, updated_at: nil)
          #   User response for v3 API
          #
          #   @param id [String] User unique identifier
          #
          #   @param created_at [Time] When the user was added to the organization
          #
          #   @param email [String] User email address
          #
          #   @param invited_at [Time, nil] When the user was invited
          #
          #   @param last_login_at [Time, nil] When the user last logged in
          #
          #   @param name [String] User full name
          #
          #   @param role [String] User role in the organization: admin, billing, developer
          #
          #   @param status [String] User status: active, invited, suspended, rejected
          #
          #   @param updated_at [Time, nil] When the user record was last updated
        end
      end

      # @see Sentdm::Models::UserListResponse#error
      class Error < Sentdm::Internal::Type::BaseModel
        # @!attribute code
        #   Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @return [String, nil]
        optional :code, String

        # @!attribute details
        #   Additional validation error details (field-level errors)
        #
        #   @return [Hash{Symbol=>Array<String>}, nil]
        optional :details, Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::ArrayOf[String]], nil?: true

        # @!attribute doc_url
        #   URL to documentation about this error
        #
        #   @return [String, nil]
        optional :doc_url, String, nil?: true

        # @!attribute message
        #   Human-readable error message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(code: nil, details: nil, doc_url: nil, message: nil)
        #   Error information
        #
        #   @param code [String] Machine-readable error code (e.g., "RESOURCE_001")
        #
        #   @param details [Hash{Symbol=>Array<String>}, nil] Additional validation error details (field-level errors)
        #
        #   @param doc_url [String, nil] URL to documentation about this error
        #
        #   @param message [String] Human-readable error message
      end

      # @see Sentdm::Models::UserListResponse#meta
      class Meta < Sentdm::Internal::Type::BaseModel
        # @!attribute request_id
        #   Unique identifier for this request (for tracing and support)
        #
        #   @return [String, nil]
        optional :request_id, String

        # @!attribute timestamp
        #   Server timestamp when the response was generated
        #
        #   @return [Time, nil]
        optional :timestamp, Time

        # @!attribute version
        #   API version used for this request
        #
        #   @return [String, nil]
        optional :version, String

        # @!method initialize(request_id: nil, timestamp: nil, version: nil)
        #   Request and response metadata
        #
        #   @param request_id [String] Unique identifier for this request (for tracing and support)
        #
        #   @param timestamp [Time] Server timestamp when the response was generated
        #
        #   @param version [String] API version used for this request
      end
    end
  end
end
