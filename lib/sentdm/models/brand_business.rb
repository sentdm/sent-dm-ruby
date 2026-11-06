# frozen_string_literal: true

module Sentdm
  module Models
    class BrandBusiness < Sentdm::Internal::Type::BaseModel
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
      optional :country_of_registration, String, nil?: true

      # @!attribute entity_type
      #   Business entity type
      #
      #   @return [String, nil]
      optional :entity_type, String, nil?: true

      # @!attribute legal_name
      #   Legal business name
      #
      #   @return [String, nil]
      optional :legal_name, String, nil?: true

      # @!attribute postal_code
      #   Postal/ZIP code
      #
      #   @return [String, nil]
      optional :postal_code, String, nil?: true

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
      optional :tax_id, String, nil?: true

      # @!attribute tax_id_type
      #   Type of tax ID (e.g., us_ein, ca_bn)
      #
      #   @return [String, nil]
      optional :tax_id_type, String, nil?: true

      # @!attribute url
      #   Business website URL
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!method initialize(city: nil, country: nil, country_of_registration: nil, entity_type: nil, legal_name: nil, postal_code: nil, state: nil, street: nil, tax_id: nil, tax_id_type: nil, url: nil)
      #   @param city [String, nil] City
      #
      #   @param country [String, nil] Country code (e.g., US, CA)
      #
      #   @param country_of_registration [String, nil] Country where the business is registered
      #
      #   @param entity_type [String, nil] Business entity type
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
    end
  end
end
