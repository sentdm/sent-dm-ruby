# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateButtonProps < Sentdm::Internal::Type::BaseModel
      # @!attribute active_for
      #
      #   @return [Integer]
      required :active_for, Integer, api_name: :activeFor

      # @!attribute country_code
      #
      #   @return [String]
      required :country_code, String, api_name: :countryCode

      # @!attribute offer_code
      #
      #   @return [String]
      required :offer_code, String, api_name: :offerCode

      # @!attribute phone_number
      #
      #   @return [String]
      required :phone_number, String, api_name: :phoneNumber

      # @!attribute quick_reply_type
      #
      #   @return [String]
      required :quick_reply_type, String, api_name: :quickReplyType

      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute url_type
      #
      #   @return [String]
      required :url_type, String, api_name: :urlType

      # @!attribute autofill_text
      #
      #   @return [String, nil]
      optional :autofill_text, String, api_name: :autofillText, nil?: true

      # @!attribute otp_type
      #
      #   @return [String, nil]
      optional :otp_type, String, api_name: :otpType, nil?: true

      # @!attribute package_name
      #
      #   @return [String, nil]
      optional :package_name, String, api_name: :packageName, nil?: true

      # @!attribute signature_hash
      #
      #   @return [String, nil]
      optional :signature_hash, String, api_name: :signatureHash, nil?: true

      # @!method initialize(active_for:, country_code:, offer_code:, phone_number:, quick_reply_type:, text:, url:, url_type:, autofill_text: nil, otp_type: nil, package_name: nil, signature_hash: nil)
      #   @param active_for [Integer]
      #   @param country_code [String]
      #   @param offer_code [String]
      #   @param phone_number [String]
      #   @param quick_reply_type [String]
      #   @param text [String]
      #   @param url [String]
      #   @param url_type [String]
      #   @param autofill_text [String, nil]
      #   @param otp_type [String, nil]
      #   @param package_name [String, nil]
      #   @param signature_hash [String, nil]
    end
  end
end
