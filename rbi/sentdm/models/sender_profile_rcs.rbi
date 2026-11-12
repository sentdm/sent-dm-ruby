# typed: strong

module Sentdm
  module Models
    class SenderProfileRcs < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::SenderProfileRcs, Sentdm::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :description

      sig { returns(T.nilable(String)) }
      attr_accessor :agent_use_case

      sig { returns(T.nilable(String)) }
      attr_accessor :banner_url

      sig { returns(T.nilable(String)) }
      attr_accessor :billing_category

      sig { returns(T.nilable(String)) }
      attr_accessor :brand_color

      sig { returns(T.nilable(String)) }
      attr_accessor :brand_email

      sig { returns(T.nilable(String)) }
      attr_accessor :brand_name

      sig { returns(T.nilable(String)) }
      attr_accessor :brand_phone_number

      sig { returns(T.nilable(String)) }
      attr_accessor :brief_company_description

      sig { returns(T.nilable(String)) }
      attr_accessor :company_ein

      sig { returns(T.nilable(String)) }
      attr_accessor :contact_name_and_title

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_support_email

      sig { returns(T.nilable(String)) }
      attr_accessor :customer_support_phone_number

      sig { returns(T.nilable(String)) }
      attr_accessor :display_name

      sig { returns(T.nilable(String)) }
      attr_accessor :entity_type

      sig { returns(T.nilable(String)) }
      attr_accessor :help_message

      sig { returns(T.nilable(String)) }
      attr_accessor :hosting_region

      sig { returns(T.nilable(String)) }
      attr_accessor :logo_url

      # The registered address of the company behind the agent.
      sig { returns(T.nilable(Sentdm::Channels::RcsAddress)) }
      attr_reader :official_address

      sig do
        params(
          official_address: T.nilable(Sentdm::Channels::RcsAddress::OrHash)
        ).void
      end
      attr_writer :official_address

      sig { returns(T.nilable(String)) }
      attr_accessor :opt_in_process_description

      # Optional — uploaded separately and its URL may not be known at submission time.
      sig { returns(T.nilable(String)) }
      attr_accessor :opt_in_screenshot_url

      sig { returns(T.nilable(String)) }
      attr_accessor :privacy_policy_url

      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :sample_messages

      sig { returns(T.nilable(String)) }
      attr_accessor :start_message

      sig { returns(T.nilable(String)) }
      attr_accessor :stop_message

      sig { returns(T.nilable(String)) }
      attr_accessor :terms_and_conditions_url

      sig { returns(T.nilable(String)) }
      attr_accessor :website_url

      # Asks for an RCS agent of the profile's own, optionally with the full order form
      # inline.
      #
      # Two modes, distinguished by whether any field is populated: "rcs": {} — intent
      # only. Records that the profile wants its own agent; the order form is submitted
      # separately through POST /v3/channels/rcs once the fields are ready. "rcs": {
      # ...fields... } — full form. All required fields must be present; the agent is
      # created alongside the profile in one call. Omitting opt_in_screenshot_url is
      # allowed.
      sig do
        params(
          description: String,
          agent_use_case: T.nilable(String),
          banner_url: T.nilable(String),
          billing_category: T.nilable(String),
          brand_color: T.nilable(String),
          brand_email: T.nilable(String),
          brand_name: T.nilable(String),
          brand_phone_number: T.nilable(String),
          brief_company_description: T.nilable(String),
          company_ein: T.nilable(String),
          contact_name_and_title: T.nilable(String),
          customer_support_email: T.nilable(String),
          customer_support_phone_number: T.nilable(String),
          display_name: T.nilable(String),
          entity_type: T.nilable(String),
          help_message: T.nilable(String),
          hosting_region: T.nilable(String),
          logo_url: T.nilable(String),
          official_address: T.nilable(Sentdm::Channels::RcsAddress::OrHash),
          opt_in_process_description: T.nilable(String),
          opt_in_screenshot_url: T.nilable(String),
          privacy_policy_url: T.nilable(String),
          sample_messages: T.nilable(T::Array[String]),
          start_message: T.nilable(String),
          stop_message: T.nilable(String),
          terms_and_conditions_url: T.nilable(String),
          website_url: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        description:,
        agent_use_case: nil,
        banner_url: nil,
        billing_category: nil,
        brand_color: nil,
        brand_email: nil,
        brand_name: nil,
        brand_phone_number: nil,
        brief_company_description: nil,
        company_ein: nil,
        contact_name_and_title: nil,
        customer_support_email: nil,
        customer_support_phone_number: nil,
        display_name: nil,
        entity_type: nil,
        help_message: nil,
        hosting_region: nil,
        logo_url: nil,
        # The registered address of the company behind the agent.
        official_address: nil,
        opt_in_process_description: nil,
        # Optional — uploaded separately and its URL may not be known at submission time.
        opt_in_screenshot_url: nil,
        privacy_policy_url: nil,
        sample_messages: nil,
        start_message: nil,
        stop_message: nil,
        terms_and_conditions_url: nil,
        website_url: nil
      )
      end

      sig do
        override.returns(
          {
            description: String,
            agent_use_case: T.nilable(String),
            banner_url: T.nilable(String),
            billing_category: T.nilable(String),
            brand_color: T.nilable(String),
            brand_email: T.nilable(String),
            brand_name: T.nilable(String),
            brand_phone_number: T.nilable(String),
            brief_company_description: T.nilable(String),
            company_ein: T.nilable(String),
            contact_name_and_title: T.nilable(String),
            customer_support_email: T.nilable(String),
            customer_support_phone_number: T.nilable(String),
            display_name: T.nilable(String),
            entity_type: T.nilable(String),
            help_message: T.nilable(String),
            hosting_region: T.nilable(String),
            logo_url: T.nilable(String),
            official_address: T.nilable(Sentdm::Channels::RcsAddress),
            opt_in_process_description: T.nilable(String),
            opt_in_screenshot_url: T.nilable(String),
            privacy_policy_url: T.nilable(String),
            sample_messages: T.nilable(T::Array[String]),
            start_message: T.nilable(String),
            stop_message: T.nilable(String),
            terms_and_conditions_url: T.nilable(String),
            website_url: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
