# typed: strong

module Sentdm
  module Models
    class SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo,
            Sentdm::Internal::AnyHash
          )
        end

      # City
      sig { returns(T.nilable(String)) }
      attr_accessor :city

      # Country code (e.g., US, CA)
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # Country where the business is registered
      sig { returns(T.nilable(String)) }
      attr_accessor :country_of_registration

      sig do
        returns(
          T.nilable(
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::OrSymbol
          )
        )
      end
      attr_accessor :entity_type

      # Legal business name
      sig { returns(T.nilable(String)) }
      attr_accessor :legal_name

      # Postal/ZIP code
      sig { returns(T.nilable(String)) }
      attr_accessor :postal_code

      # State/province code
      sig { returns(T.nilable(String)) }
      attr_accessor :state

      # Street address
      sig { returns(T.nilable(String)) }
      attr_accessor :street

      # Tax ID/EIN number
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_id

      # Type of tax ID (e.g., us_ein, ca_bn)
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_id_type

      # Business website URL
      sig { returns(T.nilable(String)) }
      attr_accessor :url

      # Business details and address for brand KYC
      sig do
        params(
          city: T.nilable(String),
          country: T.nilable(String),
          country_of_registration: T.nilable(String),
          entity_type:
            T.nilable(
              Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::OrSymbol
            ),
          legal_name: T.nilable(String),
          postal_code: T.nilable(String),
          state: T.nilable(String),
          street: T.nilable(String),
          tax_id: T.nilable(String),
          tax_id_type: T.nilable(String),
          url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # City
        city: nil,
        # Country code (e.g., US, CA)
        country: nil,
        # Country where the business is registered
        country_of_registration: nil,
        entity_type: nil,
        # Legal business name
        legal_name: nil,
        # Postal/ZIP code
        postal_code: nil,
        # State/province code
        state: nil,
        # Street address
        street: nil,
        # Tax ID/EIN number
        tax_id: nil,
        # Type of tax ID (e.g., us_ein, ca_bn)
        tax_id_type: nil,
        # Business website URL
        url: nil
      )
      end

      sig do
        override.returns(
          {
            city: T.nilable(String),
            country: T.nilable(String),
            country_of_registration: T.nilable(String),
            entity_type:
              T.nilable(
                Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::OrSymbol
              ),
            legal_name: T.nilable(String),
            postal_code: T.nilable(String),
            state: T.nilable(String),
            street: T.nilable(String),
            tax_id: T.nilable(String),
            tax_id_type: T.nilable(String),
            url: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      module EntityType
        extend Sentdm::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PRIVATE_PROFIT =
          T.let(
            :PRIVATE_PROFIT,
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::TaggedSymbol
          )
        PUBLIC_PROFIT =
          T.let(
            :PUBLIC_PROFIT,
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::TaggedSymbol
          )
        NON_PROFIT =
          T.let(
            :NON_PROFIT,
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::TaggedSymbol
          )
        SOLE_PROPRIETOR =
          T.let(
            :SOLE_PROPRIETOR,
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::TaggedSymbol
          )
        GOVERNMENT =
          T.let(
            :GOVERNMENT,
            Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Sentdm::SentDmServicesEndpointsCustomerApIv3ContractsRequestsBrandsBrandBusinessInfo::EntityType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
