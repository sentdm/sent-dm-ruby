# typed: strong

module Sentdm
  module Models
    class ComplianceRetrieveRequirementsParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Sentdm::ComplianceRetrieveRequirementsParams,
            Sentdm::Internal::AnyHash
          )
        end

      # Channel the sender is for: sms, whatsapp or rcs. Defaults to sms, which is the
      # only one answered today — the other two are 501 until their requirements are
      # declared.
      sig { returns(T.nilable(String)) }
      attr_accessor :channel

      # ISO 3166-1 alpha-2 country code, e.g. US, XK, IN
      sig { returns(T.nilable(String)) }
      attr_accessor :country

      # Sender type: LOCAL, MOBILE, TEN_DLC, TOLL_FREE, SHORT_CODE, ALPHANUMERIC. 10DLC
      # is accepted as a synonym of TEN_DLC, the same as on POST /v3/sender-profiles.
      # Applies to channel=sms, the only channel whose senders have a type.
      sig { returns(T.nilable(String)) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_reader :x_profile_id

      sig { params(x_profile_id: String).void }
      attr_writer :x_profile_id

      sig do
        params(
          channel: T.nilable(String),
          country: T.nilable(String),
          type: T.nilable(String),
          x_profile_id: String,
          request_options: Sentdm::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Channel the sender is for: sms, whatsapp or rcs. Defaults to sms, which is the
        # only one answered today — the other two are 501 until their requirements are
        # declared.
        channel: nil,
        # ISO 3166-1 alpha-2 country code, e.g. US, XK, IN
        country: nil,
        # Sender type: LOCAL, MOBILE, TEN_DLC, TOLL_FREE, SHORT_CODE, ALPHANUMERIC. 10DLC
        # is accepted as a synonym of TEN_DLC, the same as on POST /v3/sender-profiles.
        # Applies to channel=sms, the only channel whose senders have a type.
        type: nil,
        x_profile_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            channel: T.nilable(String),
            country: T.nilable(String),
            type: T.nilable(String),
            x_profile_id: String,
            request_options: Sentdm::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
