# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsAuthenticationConfig < Sentdm::Internal::Type::BaseModel
      # @!attribute add_security_recommendation
      #   Whether to add the security recommendation text: "For your security, do not
      #   share this code."
      #
      #   @return [Boolean, nil]
      optional :add_security_recommendation,
               Sentdm::Internal::Type::Boolean,
               api_name: :addSecurityRecommendation

      # @!attribute code_expiration_minutes
      #   Code expiration time in minutes (1-90). If set, adds footer: "This code expires
      #   in X minutes."
      #
      #   @return [Integer, nil]
      optional :code_expiration_minutes, Integer, api_name: :codeExpirationMinutes, nil?: true

      # @!method initialize(add_security_recommendation: nil, code_expiration_minutes: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::SentDmServicesCommonContractsPocOsAuthenticationConfig} for
      #   more details.
      #
      #   Configuration for AUTHENTICATION category templates
      #
      #   @param add_security_recommendation [Boolean] Whether to add the security recommendation text: "For your security, do not shar
      #
      #   @param code_expiration_minutes [Integer, nil] Code expiration time in minutes (1-90). If set, adds footer: "This code expires
    end
  end
end
