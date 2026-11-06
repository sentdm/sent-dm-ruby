# frozen_string_literal: true

module Sentdm
  module Models
    class SenderProfileRcs < Sentdm::Internal::Type::BaseModel
      # @!attribute description
      #
      #   @return [String]
      required :description, String

      # @!attribute agent_use_case
      #
      #   @return [String, nil]
      optional :agent_use_case, String, nil?: true

      # @!attribute banner_url
      #
      #   @return [String, nil]
      optional :banner_url, String, nil?: true

      # @!attribute billing_category
      #
      #   @return [String, nil]
      optional :billing_category, String, nil?: true

      # @!attribute brand_color
      #
      #   @return [String, nil]
      optional :brand_color, String, nil?: true

      # @!attribute brand_email
      #
      #   @return [String, nil]
      optional :brand_email, String, nil?: true

      # @!attribute brand_name
      #
      #   @return [String, nil]
      optional :brand_name, String, nil?: true

      # @!attribute brand_phone_number
      #
      #   @return [String, nil]
      optional :brand_phone_number, String, nil?: true

      # @!attribute brief_company_description
      #
      #   @return [String, nil]
      optional :brief_company_description, String, nil?: true

      # @!attribute company_ein
      #
      #   @return [String, nil]
      optional :company_ein, String, nil?: true

      # @!attribute contact_name_and_title
      #
      #   @return [String, nil]
      optional :contact_name_and_title, String, nil?: true

      # @!attribute customer_support_email
      #
      #   @return [String, nil]
      optional :customer_support_email, String, nil?: true

      # @!attribute customer_support_phone_number
      #
      #   @return [String, nil]
      optional :customer_support_phone_number, String, nil?: true

      # @!attribute display_name
      #
      #   @return [String, nil]
      optional :display_name, String, nil?: true

      # @!attribute entity_type
      #
      #   @return [String, nil]
      optional :entity_type, String, nil?: true

      # @!attribute help_message
      #
      #   @return [String, nil]
      optional :help_message, String, nil?: true

      # @!attribute hosting_region
      #
      #   @return [String, nil]
      optional :hosting_region, String, nil?: true

      # @!attribute logo_url
      #
      #   @return [String, nil]
      optional :logo_url, String, nil?: true

      # @!attribute official_address
      #   The registered address of the company behind the agent.
      #
      #   @return [Sentdm::Models::Channels::RcsAddress, nil]
      optional :official_address, -> { Sentdm::Channels::RcsAddress }, nil?: true

      # @!attribute opt_in_process_description
      #
      #   @return [String, nil]
      optional :opt_in_process_description, String, nil?: true

      # @!attribute opt_in_screenshot_url
      #   Optional — uploaded separately and its URL may not be known at submission time.
      #
      #   @return [String, nil]
      optional :opt_in_screenshot_url, String, nil?: true

      # @!attribute privacy_policy_url
      #
      #   @return [String, nil]
      optional :privacy_policy_url, String, nil?: true

      # @!attribute sample_messages
      #
      #   @return [Array<String>, nil]
      optional :sample_messages, Sentdm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute start_message
      #
      #   @return [String, nil]
      optional :start_message, String, nil?: true

      # @!attribute stop_message
      #
      #   @return [String, nil]
      optional :stop_message, String, nil?: true

      # @!attribute terms_and_conditions_url
      #
      #   @return [String, nil]
      optional :terms_and_conditions_url, String, nil?: true

      # @!attribute website_url
      #
      #   @return [String, nil]
      optional :website_url, String, nil?: true

      # @!method initialize(description:, agent_use_case: nil, banner_url: nil, billing_category: nil, brand_color: nil, brand_email: nil, brand_name: nil, brand_phone_number: nil, brief_company_description: nil, company_ein: nil, contact_name_and_title: nil, customer_support_email: nil, customer_support_phone_number: nil, display_name: nil, entity_type: nil, help_message: nil, hosting_region: nil, logo_url: nil, official_address: nil, opt_in_process_description: nil, opt_in_screenshot_url: nil, privacy_policy_url: nil, sample_messages: nil, start_message: nil, stop_message: nil, terms_and_conditions_url: nil, website_url: nil)
      #   Asks for an RCS agent of the profile's own, optionally with the full order form
      #   inline.
      #
      #   Two modes, distinguished by whether any field is populated: "rcs": {} — intent
      #   only. Records that the profile wants its own agent; the order form is submitted
      #   separately through POST /v3/channels/rcs once the fields are ready. "rcs": {
      #   ...fields... } — full form. All required fields must be present; the agent is
      #   created alongside the profile in one call. Omitting opt_in_screenshot_url is
      #   allowed.
      #
      #   @param description [String]
      #
      #   @param agent_use_case [String, nil]
      #
      #   @param banner_url [String, nil]
      #
      #   @param billing_category [String, nil]
      #
      #   @param brand_color [String, nil]
      #
      #   @param brand_email [String, nil]
      #
      #   @param brand_name [String, nil]
      #
      #   @param brand_phone_number [String, nil]
      #
      #   @param brief_company_description [String, nil]
      #
      #   @param company_ein [String, nil]
      #
      #   @param contact_name_and_title [String, nil]
      #
      #   @param customer_support_email [String, nil]
      #
      #   @param customer_support_phone_number [String, nil]
      #
      #   @param display_name [String, nil]
      #
      #   @param entity_type [String, nil]
      #
      #   @param help_message [String, nil]
      #
      #   @param hosting_region [String, nil]
      #
      #   @param logo_url [String, nil]
      #
      #   @param official_address [Sentdm::Models::Channels::RcsAddress, nil] The registered address of the company behind the agent.
      #
      #   @param opt_in_process_description [String, nil]
      #
      #   @param opt_in_screenshot_url [String, nil] Optional — uploaded separately and its URL may not be known at submission time.
      #
      #   @param privacy_policy_url [String, nil]
      #
      #   @param sample_messages [Array<String>, nil]
      #
      #   @param start_message [String, nil]
      #
      #   @param stop_message [String, nil]
      #
      #   @param terms_and_conditions_url [String, nil]
      #
      #   @param website_url [String, nil]
    end
  end
end
