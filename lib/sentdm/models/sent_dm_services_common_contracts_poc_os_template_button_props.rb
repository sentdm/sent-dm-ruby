# frozen_string_literal: true

module Sentdm
  module Models
    class SentDmServicesCommonContractsPocOsTemplateButtonProps < Sentdm::Internal::Type::BaseModel
      # @!attribute active_for
      #
      #   @return [Integer, nil]
      optional :active_for, Integer, api_name: :activeFor, nil?: true

      # @!attribute autofill_text
      #
      #   @return [String, nil]
      optional :autofill_text, String, api_name: :autofillText, nil?: true

      # @!attribute country_code
      #
      #   @return [String, nil]
      optional :country_code, String, api_name: :countryCode, nil?: true

      # @!attribute offer_code
      #
      #   @return [String, nil]
      optional :offer_code, String, api_name: :offerCode, nil?: true

      # @!attribute otp_type
      #
      #   @return [String, nil]
      optional :otp_type, String, api_name: :otpType, nil?: true

      # @!attribute package_name
      #
      #   @return [String, nil]
      optional :package_name, String, api_name: :packageName, nil?: true

      # @!attribute phone_number
      #
      #   @return [String, nil]
      optional :phone_number, String, api_name: :phoneNumber, nil?: true

      # @!attribute quick_reply_type
      #
      #   @return [String, nil]
      optional :quick_reply_type, String, api_name: :quickReplyType, nil?: true

      # @!attribute signature_hash
      #
      #   @return [String, nil]
      optional :signature_hash, String, api_name: :signatureHash, nil?: true

      # @!attribute text
      #
      #   @return [String, nil]
      optional :text, String, nil?: true

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String, nil?: true

      # @!attribute url_type
      #
      #   @return [String, nil]
      optional :url_type, String, api_name: :urlType, nil?: true

      # @!method initialize(active_for: nil, autofill_text: nil, country_code: nil, offer_code: nil, otp_type: nil, package_name: nil, phone_number: nil, quick_reply_type: nil, signature_hash: nil, text: nil, url: nil, url_type: nil)
      #   @param active_for [Integer, nil]
      #   @param autofill_text [String, nil]
      #   @param country_code [String, nil]
      #   @param offer_code [String, nil]
      #   @param otp_type [String, nil]
      #   @param package_name [String, nil]
      #   @param phone_number [String, nil]
      #   @param quick_reply_type [String, nil]
      #   @param signature_hash [String, nil]
      #   @param text [String, nil]
      #   @param url [String, nil]
      #   @param url_type [String, nil]
    end
  end
end
