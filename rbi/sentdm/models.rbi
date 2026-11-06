# typed: strong

module Sentdm
  APIMeta = Sentdm::Models::APIMeta

  APIResponseOfChannelsState = Sentdm::Models::APIResponseOfChannelsState

  APIResponseOfComplianceRequirements =
    Sentdm::Models::APIResponseOfComplianceRequirements

  APIResponseOfContact = Sentdm::Models::APIResponseOfContact

  APIResponseOfContactMessageSummary =
    Sentdm::Models::APIResponseOfContactMessageSummary

  APIResponseOfConversationMessagesList =
    Sentdm::Models::APIResponseOfConversationMessagesList

  APIResponseOfProfileDetail = Sentdm::Models::APIResponseOfProfileDetail

  APIResponseOfSenderProfile = Sentdm::Models::APIResponseOfSenderProfile

  APIResponseOfSenderProfilesList =
    Sentdm::Models::APIResponseOfSenderProfilesList

  APIResponseOfUser = Sentdm::Models::APIResponseOfUser

  APIResponseTemplate = Sentdm::Models::APIResponseTemplate

  APIResponseWebhook = Sentdm::Models::APIResponseWebhook

  AuthenticationConfig = Sentdm::Models::AuthenticationConfig

  BillingContactInfo = Sentdm::Models::BillingContactInfo

  BrandBusinessInfo = Sentdm::Models::BrandBusinessInfo

  BrandComplianceInfo = Sentdm::Models::BrandComplianceInfo

  BrandContactInfo = Sentdm::Models::BrandContactInfo

  BrandsBrandData = Sentdm::Models::BrandsBrandData

  CallEvent = Sentdm::Models::CallEvent

  CallEventPayload = Sentdm::Models::CallEventPayload

  ChannelEvent = Sentdm::Models::ChannelEvent

  ChannelEventPayload = Sentdm::Models::ChannelEventPayload

  ChannelListParams = Sentdm::Models::ChannelListParams

  Channels = Sentdm::Models::Channels

  ChannelsState = Sentdm::Models::ChannelsState

  ComplianceAttachmentTemplate = Sentdm::Models::ComplianceAttachmentTemplate

  ComplianceRequirement = Sentdm::Models::ComplianceRequirement

  ComplianceRequirements = Sentdm::Models::ComplianceRequirements

  ComplianceRetrieveRequirementsParams =
    Sentdm::Models::ComplianceRetrieveRequirementsParams

  ComplianceSetupStep = Sentdm::Models::ComplianceSetupStep

  ContactCreateParams = Sentdm::Models::ContactCreateParams

  ContactDeleteParams = Sentdm::Models::ContactDeleteParams

  ContactEvent = Sentdm::Models::ContactEvent

  ContactEventPayload = Sentdm::Models::ContactEventPayload

  ContactListParams = Sentdm::Models::ContactListParams

  ContactMessageSummary = Sentdm::Models::ContactMessageSummary

  ContactResponse = Sentdm::Models::ContactResponse

  ContactRetrieveMessageSummaryParams =
    Sentdm::Models::ContactRetrieveMessageSummaryParams

  ContactRetrieveParams = Sentdm::Models::ContactRetrieveParams

  ContactUpdateParams = Sentdm::Models::ContactUpdateParams

  ConversationListMessagesParams =
    Sentdm::Models::ConversationListMessagesParams

  ConversationListParams = Sentdm::Models::ConversationListParams

  ConversationMessagesList = Sentdm::Models::ConversationMessagesList

  DestinationCountry = Sentdm::Models::DestinationCountry

  ErrorDetail = Sentdm::Models::ErrorDetail

  InboundMessageEvent = Sentdm::Models::InboundMessageEvent

  InboundMessageEventPayload = Sentdm::Models::InboundMessageEventPayload

  MeRetrieveParams = Sentdm::Models::MeRetrieveParams

  MessageCancelParams = Sentdm::Models::MessageCancelParams

  MessageEvent = Sentdm::Models::MessageEvent

  MessageEventPayload = Sentdm::Models::MessageEventPayload

  MessageResendParams = Sentdm::Models::MessageResendParams

  MessageRetrieveActivitiesParams =
    Sentdm::Models::MessageRetrieveActivitiesParams

  MessageRetrieveStatusParams = Sentdm::Models::MessageRetrieveStatusParams

  MessageSendParams = Sentdm::Models::MessageSendParams

  MessageSendResponse = Sentdm::Models::MessageSendResponse

  MmsMarket = Sentdm::Models::MmsMarket

  MutationRequest = Sentdm::Models::MutationRequest

  NumberLookupParams = Sentdm::Models::NumberLookupParams

  PaginationMeta = Sentdm::Models::PaginationMeta

  PaymentDetails = Sentdm::Models::PaymentDetails

  ProfileCompleteParams = Sentdm::Models::ProfileCompleteParams

  ProfileCreateParams = Sentdm::Models::ProfileCreateParams

  ProfileDeleteParams = Sentdm::Models::ProfileDeleteParams

  ProfileDetail = Sentdm::Models::ProfileDetail

  ProfileListParams = Sentdm::Models::ProfileListParams

  ProfileRetrieveParams = Sentdm::Models::ProfileRetrieveParams

  Profiles = Sentdm::Models::Profiles

  ProfileSettings = Sentdm::Models::ProfileSettings

  ProfileUpdateParams = Sentdm::Models::ProfileUpdateParams

  SenderProfile = Sentdm::Models::SenderProfile

  SenderProfileBilling = Sentdm::Models::SenderProfileBilling

  SenderProfileBillingRequest = Sentdm::Models::SenderProfileBillingRequest

  SenderProfileChannels = Sentdm::Models::SenderProfileChannels

  SenderProfileCreateParams = Sentdm::Models::SenderProfileCreateParams

  SenderProfileDeleteParams = Sentdm::Models::SenderProfileDeleteParams

  SenderProfileListParams = Sentdm::Models::SenderProfileListParams

  SenderProfileRcs = Sentdm::Models::SenderProfileRcs

  SenderProfileRetrieveParams = Sentdm::Models::SenderProfileRetrieveParams

  SenderProfilesList = Sentdm::Models::SenderProfilesList

  SenderProfileSMS = Sentdm::Models::SenderProfileSMS

  SenderProfileUpdateParams = Sentdm::Models::SenderProfileUpdateParams

  SenderProfileWhatsapp = Sentdm::Models::SenderProfileWhatsapp

  TcrBrandRelationship = Sentdm::Models::TcrBrandRelationship

  TcrVertical = Sentdm::Models::TcrVertical

  Template = Sentdm::Models::Template

  TemplateBody = Sentdm::Models::TemplateBody

  TemplateBodyContent = Sentdm::Models::TemplateBodyContent

  TemplateButton = Sentdm::Models::TemplateButton

  TemplateButtonProps = Sentdm::Models::TemplateButtonProps

  TemplateCreateParams = Sentdm::Models::TemplateCreateParams

  TemplateDefinition = Sentdm::Models::TemplateDefinition

  TemplateDeleteParams = Sentdm::Models::TemplateDeleteParams

  TemplateEvent = Sentdm::Models::TemplateEvent

  TemplateEventPayload = Sentdm::Models::TemplateEventPayload

  TemplateFooter = Sentdm::Models::TemplateFooter

  TemplateHeader = Sentdm::Models::TemplateHeader

  TemplateListParams = Sentdm::Models::TemplateListParams

  TemplateRetrieveParams = Sentdm::Models::TemplateRetrieveParams

  TemplateUpdateParams = Sentdm::Models::TemplateUpdateParams

  TemplateVariable = Sentdm::Models::TemplateVariable

  UserInviteParams = Sentdm::Models::UserInviteParams

  UserListParams = Sentdm::Models::UserListParams

  UserRemoveParams = Sentdm::Models::UserRemoveParams

  UserResponse = Sentdm::Models::UserResponse

  UserRetrieveParams = Sentdm::Models::UserRetrieveParams

  UserUpdateRoleParams = Sentdm::Models::UserUpdateRoleParams

  Voice = Sentdm::Models::Voice

  WebhookCreateParams = Sentdm::Models::WebhookCreateParams

  WebhookDeleteParams = Sentdm::Models::WebhookDeleteParams

  WebhookEventType = Sentdm::Models::WebhookEventType

  WebhookListEventsParams = Sentdm::Models::WebhookListEventsParams

  WebhookListEventTypesParams = Sentdm::Models::WebhookListEventTypesParams

  WebhookListParams = Sentdm::Models::WebhookListParams

  WebhookResponse = Sentdm::Models::WebhookResponse

  WebhookRetrieveParams = Sentdm::Models::WebhookRetrieveParams

  WebhookRotateSecretParams = Sentdm::Models::WebhookRotateSecretParams

  WebhookTestParams = Sentdm::Models::WebhookTestParams

  WebhookToggleStatusParams = Sentdm::Models::WebhookToggleStatusParams

  WebhookUpdateParams = Sentdm::Models::WebhookUpdateParams
end
