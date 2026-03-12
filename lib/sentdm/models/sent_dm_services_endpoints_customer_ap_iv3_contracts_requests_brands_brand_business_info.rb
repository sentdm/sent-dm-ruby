# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo < Sentdm::Internal::Type::BaseModel
      # @!attribute city
      #   City
      #
      #   @return [String, nil]
      optional :city, String, nil?: true

      # @!attribute country
      #   Country code (e.g., US, CA)
      #
      #   @return [String, nil]
      optional :country, String, nil?: true

      # @!attribute country_of_registration
      #   Country where the business is registered
      #
      #   @return [String, nil]
      optional :country_of_registration, String, api_name: :countryOfRegistration, nil?: true

      # @!attribute entity_type
      #
      #   @return [Symbol, Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType, nil]
      optional :entity_type,
               enum: -> {
                 Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType
               },
               api_name: :entityType,
               nil?: true

      # @!attribute legal_name
      #   Legal business name
      #
      #   @return [String, nil]
      optional :legal_name, String, api_name: :legalName, nil?: true

      # @!attribute postal_code
      #   Postal/ZIP code
      #
      #   @return [String, nil]
      optional :postal_code, String, api_name: :postalCode, nil?: true

      # @!attribute state
      #   State/province code
      #
      #   @return [String, nil]
      optional :state, String, nil?: true

      # @!attribute street
      #   Street address
      #
      #   @return [String, nil]
      optional :street, String, nil?: true

      # @!attribute tax_id
      #   Tax ID/EIN number
      #
      #   @return [String, nil]
      optional :tax_id, String, api_name: :taxId, nil?: true

      # @!attribute tax_id_type
      #   Type of tax ID (e.g., us_ein, ca_bn)
      #
      #   @return [String, nil]
      optional :tax_id_type, String, api_name: :taxIdType, nil?: true

      # @!attribute url
      #   Business website URL
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(city: nil, country: nil, country_of_registration: nil, entity_type: nil, legal_name: nil, postal_code: nil, state: nil, street: nil, tax_id: nil, tax_id_type: nil, url: nil)
      #   Business details and address for brand KYC
      #
      #   @param city [String, nil] City
      #
      #   @param country [String, nil] Country code (e.g., US, CA)
      #
      #   @param country_of_registration [String, nil] Country where the business is registered
      #
      #   @param entity_type [Symbol, Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType, nil]
      #
      #   @param legal_name [String, nil] Legal business name
      #
      #   @param postal_code [String, nil] Postal/ZIP code
      #
      #   @param state [String, nil] State/province code
      #
      #   @param street [String, nil] Street address
      #
      #   @param tax_id [String, nil] Tax ID/EIN number
      #
      #   @param tax_id_type [String, nil] Type of tax ID (e.g., us_ein, ca_bn)
      #
      #   @param url [String, nil] Business website URL

      # @see Sentdm::Models::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo#entity_type
      module EntityType
        extend Sentdm::Internal::Type::Enum

        PRIVATE_PROFIT = :PRIVATE_PROFIT
        PUBLIC_PROFIT = :PUBLIC_PROFIT
        NON_PROFIT = :NON_PROFIT
        SOLE_PROPRIETOR = :SOLE_PROPRIETOR
        GOVERNMENT = :GOVERNMENT

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
