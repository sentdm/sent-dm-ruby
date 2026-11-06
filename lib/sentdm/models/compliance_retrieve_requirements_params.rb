# frozen_string_literal: true

module Sentdm
  module Models
    # @see Sentdm::Resources::Compliance#retrieve_requirements
    class ComplianceRetrieveRequirementsParams < Sentdm::Internal::Type::BaseModel
      extend Sentdm::Internal::Type::RequestParameters::Converter
      include Sentdm::Internal::Type::RequestParameters

      # @!attribute channel
      #   Channel the sender is for: sms, whatsapp or rcs. Defaults to sms, which is the
      #   only one answered today — the other two are 501 until their requirements are
      #   declared.
      #
      #   @return [String, nil]
      optional :channel, String, nil?: true

      # @!attribute country
      #   ISO 3166-1 alpha-2 country code, e.g. US, XK, IN
      #
      #   @return [String, nil]
      optional :country, String, nil?: true

      # @!attribute type
      #   Sender type: LOCAL, MOBILE, TEN_DLC, TOLL_FREE, SHORT_CODE, ALPHANUMERIC. 10DLC
      #   is accepted as a synonym of TEN_DLC, the same as on POST /v3/sender-profiles.
      #   Applies to channel=sms, the only channel whose senders have a type.
      #
      #   @return [String, nil]
      optional :type, String, nil?: true

      # @!attribute x_profile_id
      #
      #   @return [String, nil]
      optional :x_profile_id, String

      # @!method initialize(channel: nil, country: nil, type: nil, x_profile_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::ComplianceRetrieveRequirementsParams} for more details.
      #
      #   @param channel [String, nil] Channel the sender is for: sms, whatsapp or rcs. Defaults to sms, which is the o
      #
      #   @param country [String, nil] ISO 3166-1 alpha-2 country code, e.g. US, XK, IN
      #
      #   @param type [String, nil] Sender type: LOCAL, MOBILE, TEN_DLC, TOLL_FREE, SHORT_CODE, ALPHANUMERIC. 10DLC
      #
      #   @param x_profile_id [String]
      #
      #   @param request_options [Sentdm::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
