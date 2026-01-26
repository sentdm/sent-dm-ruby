# frozen_string_literal: true

module SentDm
  module Models
    module Organizations
      # @see SentDm::Resources::Organizations::Users#invite
      class UserInviteParams < SentDm::Internal::Type::BaseModel
        extend SentDm::Internal::Type::RequestParameters::Converter
        include SentDm::Internal::Type::RequestParameters

        # @!attribute email
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute invited_by
        #
        #   @return [String, nil]
        optional :invited_by, String, api_name: :invitedBy, nil?: true

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute role
        #
        #   @return [String, nil]
        optional :role, String

        # @!method initialize(email: nil, invited_by: nil, name: nil, role: nil, request_options: {})
        #   @param email [String]
        #   @param invited_by [String, nil]
        #   @param name [String]
        #   @param role [String]
        #   @param request_options [SentDm::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
