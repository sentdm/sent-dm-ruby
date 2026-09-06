# typed: strong

module Sentdm
  module Models
    class TemplateEventPayload < Sentdm::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Sentdm::TemplateEventPayload, Sentdm::Internal::AnyHash)
        end

      # The review status the template just reached, for example APPROVED or REJECTED.
      sig { returns(String) }
      attr_accessor :status

      # The template's identifier with Meta, assigned when the template is submitted for
      # review.
      sig { returns(String) }
      attr_accessor :whatsapp_template_id

      # The account the template belongs to.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # The template's category, for example UTILITY, MARKETING, or AUTHENTICATION.
      sig { returns(T.nilable(String)) }
      attr_reader :category

      sig { params(category: String).void }
      attr_writer :category

      # The channel the template applies to.
      sig { returns(T.nilable(String)) }
      attr_reader :channel

      sig { params(channel: String).void }
      attr_writer :channel

      # The template's language code, for example en_US.
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      # Why the template reached Status, when a reason was given. Populated on a
      # rejection.
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # The template in Sent.
      sig { returns(T.nilable(String)) }
      attr_reader :template_id

      sig { params(template_id: String).void }
      attr_writer :template_id

      # The template's display name.
      sig { returns(T.nilable(String)) }
      attr_reader :template_name

      sig { params(template_name: String).void }
      attr_writer :template_name

      # Body of a template status event. Delivered when a template's review outcome
      # changes, so you can react without polling.
      sig do
        params(
          status: String,
          whatsapp_template_id: String,
          account_id: String,
          category: String,
          channel: String,
          language: String,
          reason: T.nilable(String),
          template_id: String,
          template_name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The review status the template just reached, for example APPROVED or REJECTED.
        status:,
        # The template's identifier with Meta, assigned when the template is submitted for
        # review.
        whatsapp_template_id:,
        # The account the template belongs to.
        account_id: nil,
        # The template's category, for example UTILITY, MARKETING, or AUTHENTICATION.
        category: nil,
        # The channel the template applies to.
        channel: nil,
        # The template's language code, for example en_US.
        language: nil,
        # Why the template reached Status, when a reason was given. Populated on a
        # rejection.
        reason: nil,
        # The template in Sent.
        template_id: nil,
        # The template's display name.
        template_name: nil
      )
      end

      sig do
        override.returns(
          {
            status: String,
            whatsapp_template_id: String,
            account_id: String,
            category: String,
            channel: String,
            language: String,
            reason: T.nilable(String),
            template_id: String,
            template_name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
