# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Templates#list
    class Template < Sentdm::Internal::Type::BaseModel
      # @!attribute customer_id
      #   Which customer owns this — the key's own, or the profile named in x-profile-id.
      #   Says whose resource this is, which the resource's own id does not.
      #
      #   @return [String]
      required :customer_id, String

      # @!attribute id
      #   Unique template identifier
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute auto_reply_action
      #   Which consent keyword this template answers, when it is one of Sent's
      #   auto-replies: OPT_IN, OPT_OUT, HELP, or OTHER for a customer-defined keyword.
      #   Null for an ordinary template, and omitted from the response, so its presence is
      #   the answer to "is this an auto-reply".
      #
      #   Deliberately not required, unlike CustomerId, even though the same "no single
      #   mapper" argument applies: NJsonSchema publishes a C# required member in the
      #   schema's required array, so the contract would have advertised a field this
      #   response omits for every ordinary template, and a generated client could refuse
      #   the common case. A compile-time guard is not worth a wrong published contract.
      #   Every mapping site sets it explicitly, and TemplateResponseSchemaTests pins the
      #   field as optional so it cannot be reintroduced.
      #
      #   @return [String, nil]
      optional :auto_reply_action, String, nil?: true

      # @!attribute category
      #   Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @return [String, nil]
      optional :category, String

      # @!attribute channels
      #   The channels this template's definition can render on, in canonical order: sms,
      #   whatsapp, rcs.
      #
      #   Derived from the definition's body, mirroring each channel's send-time fallback
      #   chain, so a channel is listed only when a real body would be produced for it:
      #   SMS reads sms ?? multiChannel, WhatsApp reads whatsapp ?? multiChannel, and RCS
      #   reads rcs ?? multiChannel ?? sms. A multiChannel body therefore reports all
      #   three, and the extra SMS fallback on RCS is why an sms/whatsapp pair reports RCS
      #   too.
      #
      #   This says what the content can render on, not what may be sent: sending also
      #   needs the template approved for that channel.
      #
      #   @return [Array<String>, nil]
      optional :channels, Sentdm::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute created_at
      #   When the template was created
      #
      #   @return [Time, nil]
      optional :created_at, Time

      # @!attribute is_published
      #   Whether the template is published and active
      #
      #   @return [Boolean, nil]
      optional :is_published, Sentdm::Internal::Type::Boolean

      # @!attribute language
      #   Template language code (e.g., en_US)
      #
      #   @return [String, nil]
      optional :language, String

      # @!attribute name
      #   Template display name
      #
      #   @return [String, nil]
      optional :name, String

      # @!attribute status
      #   Template status: DRAFT, PENDING, APPROVED, REJECTED. A template created with
      #   submit_for_review: false starts as DRAFT and stays there until it is submitted.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute updated_at
      #   When the template was last updated
      #
      #   @return [Time, nil]
      optional :updated_at, Time, nil?: true

      # @!attribute variables
      #   Template variables for personalization
      #
      #   @return [Array<String>, nil]
      optional :variables, Sentdm::Internal::Type::ArrayOf[String], nil?: true

      # @!method initialize(customer_id:, id: nil, auto_reply_action: nil, category: nil, channels: nil, created_at: nil, is_published: nil, language: nil, name: nil, status: nil, updated_at: nil, variables: nil)
      #   Some parameter documentations has been truncated, see {Sentdm::Models::Template}
      #   for more details.
      #
      #   Template response for v3 API
      #
      #   @param customer_id [String] Which customer owns this — the key's own, or the profile named in x-profile-id.
      #
      #   @param id [String] Unique template identifier
      #
      #   @param auto_reply_action [String, nil] Which consent keyword this template answers, when it is one of Sent's auto-repli
      #
      #   @param category [String] Template category: MARKETING, UTILITY, AUTHENTICATION
      #
      #   @param channels [Array<String>, nil] The channels this template's definition can render on, in canonical order: sms,
      #
      #   @param created_at [Time] When the template was created
      #
      #   @param is_published [Boolean] Whether the template is published and active
      #
      #   @param language [String] Template language code (e.g., en_US)
      #
      #   @param name [String] Template display name
      #
      #   @param status [String] Template status: DRAFT, PENDING, APPROVED, REJECTED. A template created with
      #
      #   @param updated_at [Time, nil] When the template was last updated
      #
      #   @param variables [Array<String>, nil] Template variables for personalization
    end
  end
end
