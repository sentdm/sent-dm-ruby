# frozen_string_literal: true

module Sentdm
  [Sentdm::Internal::Type::BaseModel, *Sentdm::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Sentdm::Internal::AnyHash) } }
  end

  Sentdm::Internal::Util.walk_namespaces(Sentdm::Models).each do |mod|
    case mod
    in Sentdm::Internal::Type::Enum | Sentdm::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Sentdm::Internal::Util.walk_namespaces(Sentdm::Models)
                        .lazy
                        .grep(Sentdm::Internal::Type::Union)
                        .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Account = Sentdm::Models::Account

  AccountChannels = Sentdm::Models::AccountChannels

  AccountProfile = Sentdm::Models::AccountProfile

  AccountRcsChannel = Sentdm::Models::AccountRcsChannel

  AccountSMSChannel = Sentdm::Models::AccountSMSChannel

  AccountWhatsappChannel = Sentdm::Models::AccountWhatsappChannel

  APIMeta = Sentdm::Models::APIMeta

  APIResponseOfAccount = Sentdm::Models::APIResponseOfAccount

  APIResponseOfCancelledMessage = Sentdm::Models::APIResponseOfCancelledMessage

  APIResponseOfChannelsState = Sentdm::Models::APIResponseOfChannelsState

  APIResponseOfComplianceRequirements = Sentdm::Models::APIResponseOfComplianceRequirements

  APIResponseOfContact = Sentdm::Models::APIResponseOfContact

  APIResponseOfContactMessageSummary = Sentdm::Models::APIResponseOfContactMessageSummary

  APIResponseOfContactsList = Sentdm::Models::APIResponseOfContactsList

  APIResponseOfConversationMessagesList = Sentdm::Models::APIResponseOfConversationMessagesList

  APIResponseOfMessage = Sentdm::Models::APIResponseOfMessage

  APIResponseOfMessageActivities = Sentdm::Models::APIResponseOfMessageActivities

  APIResponseOfNumberLookupResult = Sentdm::Models::APIResponseOfNumberLookupResult

  APIResponseOfProfileCompletionAccepted = Sentdm::Models::APIResponseOfProfileCompletionAccepted

  APIResponseOfProfileCompletionResult = Sentdm::Models::APIResponseOfProfileCompletionResult

  APIResponseOfProfileDetail = Sentdm::Models::APIResponseOfProfileDetail

  APIResponseOfProfilesList = Sentdm::Models::APIResponseOfProfilesList

  APIResponseOfSenderProfile = Sentdm::Models::APIResponseOfSenderProfile

  APIResponseOfSenderProfilesList = Sentdm::Models::APIResponseOfSenderProfilesList

  APIResponseOfTemplatesList = Sentdm::Models::APIResponseOfTemplatesList

  APIResponseOfUser = Sentdm::Models::APIResponseOfUser

  APIResponseOfUsersList = Sentdm::Models::APIResponseOfUsersList

  APIResponseOfWebhookEventsList = Sentdm::Models::APIResponseOfWebhookEventsList

  APIResponseOfWebhookEventTypesList = Sentdm::Models::APIResponseOfWebhookEventTypesList

  APIResponseOfWebhookSecret = Sentdm::Models::APIResponseOfWebhookSecret

  APIResponseOfWebhooksList = Sentdm::Models::APIResponseOfWebhooksList

  APIResponseOfWebhookTest = Sentdm::Models::APIResponseOfWebhookTest

  APIResponseTemplate = Sentdm::Models::APIResponseTemplate

  APIResponseWebhook = Sentdm::Models::APIResponseWebhook

  AuthenticationConfig = Sentdm::Models::AuthenticationConfig

  BillingContact = Sentdm::Models::BillingContact

  BillingContactInfo = Sentdm::Models::BillingContactInfo

  BrandBusiness = Sentdm::Models::BrandBusiness

  BrandBusinessInfo = Sentdm::Models::BrandBusinessInfo

  BrandCompliance = Sentdm::Models::BrandCompliance

  BrandComplianceInfo = Sentdm::Models::BrandComplianceInfo

  BrandContact = Sentdm::Models::BrandContact

  BrandContactInfo = Sentdm::Models::BrandContactInfo

  BrandsBrandData = Sentdm::Models::BrandsBrandData

  BrandWithKYC = Sentdm::Models::BrandWithKYC

  CallEvent = Sentdm::Models::CallEvent

  CallEventPayload = Sentdm::Models::CallEventPayload

  CancelledMessage = Sentdm::Models::CancelledMessage

  ChannelEvent = Sentdm::Models::ChannelEvent

  ChannelEventPayload = Sentdm::Models::ChannelEventPayload

  ChannelListParams = Sentdm::Models::ChannelListParams

  Channels = Sentdm::Models::Channels

  ChannelScore = Sentdm::Models::ChannelScore

  ChannelsState = Sentdm::Models::ChannelsState

  ComplianceAttachmentTemplate = Sentdm::Models::ComplianceAttachmentTemplate

  ComplianceRequirement = Sentdm::Models::ComplianceRequirement

  ComplianceRequirements = Sentdm::Models::ComplianceRequirements

  ComplianceRetrieveRequirementsParams = Sentdm::Models::ComplianceRetrieveRequirementsParams

  ComplianceSetupStep = Sentdm::Models::ComplianceSetupStep

  ContactCreateParams = Sentdm::Models::ContactCreateParams

  ContactDeleteParams = Sentdm::Models::ContactDeleteParams

  ContactEvent = Sentdm::Models::ContactEvent

  ContactEventPayload = Sentdm::Models::ContactEventPayload

  ContactListParams = Sentdm::Models::ContactListParams

  ContactMessageSummary = Sentdm::Models::ContactMessageSummary

  ContactResponse = Sentdm::Models::ContactResponse

  ContactRetrieveMessageSummaryParams = Sentdm::Models::ContactRetrieveMessageSummaryParams

  ContactRetrieveParams = Sentdm::Models::ContactRetrieveParams

  ContactsList = Sentdm::Models::ContactsList

  ContactUpdateParams = Sentdm::Models::ContactUpdateParams

  ConversationListMessagesParams = Sentdm::Models::ConversationListMessagesParams

  ConversationListParams = Sentdm::Models::ConversationListParams

  ConversationMessagesList = Sentdm::Models::ConversationMessagesList

  DestinationCountry = Sentdm::Models::DestinationCountry

  EntityType = Sentdm::Models::EntityType

  ErrorDetail = Sentdm::Models::ErrorDetail

  InboundMedia = Sentdm::Models::InboundMedia

  InboundMessageEvent = Sentdm::Models::InboundMessageEvent

  InboundMessageEventPayload = Sentdm::Models::InboundMessageEventPayload

  LinkEvent = Sentdm::Models::LinkEvent

  LinkEventPayload = Sentdm::Models::LinkEventPayload

  MeRetrieveParams = Sentdm::Models::MeRetrieveParams

  Message = Sentdm::Models::Message

  MessageActivities = Sentdm::Models::MessageActivities

  MessageActivity = Sentdm::Models::MessageActivity

  MessageBody = Sentdm::Models::MessageBody

  MessageButton = Sentdm::Models::MessageButton

  MessageCancelParams = Sentdm::Models::MessageCancelParams

  MessageChannelOptions = Sentdm::Models::MessageChannelOptions

  MessageEvent = Sentdm::Models::MessageEvent

  MessageEventPayload = Sentdm::Models::MessageEventPayload

  MessageHeaderMedia = Sentdm::Models::MessageHeaderMedia

  MessageMedia = Sentdm::Models::MessageMedia

  MessageRecipient = Sentdm::Models::MessageRecipient

  MessageResendParams = Sentdm::Models::MessageResendParams

  MessageRetrieveActivitiesParams = Sentdm::Models::MessageRetrieveActivitiesParams

  MessageRetrieveStatusParams = Sentdm::Models::MessageRetrieveStatusParams

  MessageSendParams = Sentdm::Models::MessageSendParams

  MessageSendResponse = Sentdm::Models::MessageSendResponse

  MessageSendResult = Sentdm::Models::MessageSendResult

  MessageStatusEvent = Sentdm::Models::MessageStatusEvent

  MmsMarket = Sentdm::Models::MmsMarket

  MutationRequest = Sentdm::Models::MutationRequest

  NumberLookupParams = Sentdm::Models::NumberLookupParams

  NumberLookupResult = Sentdm::Models::NumberLookupResult

  PaginationCursors = Sentdm::Models::PaginationCursors

  PaginationMeta = Sentdm::Models::PaginationMeta

  PaymentDetails = Sentdm::Models::PaymentDetails

  ProfileCompleteParams = Sentdm::Models::ProfileCompleteParams

  ProfileCompletionAccepted = Sentdm::Models::ProfileCompletionAccepted

  ProfileCompletionResult = Sentdm::Models::ProfileCompletionResult

  ProfileCreateParams = Sentdm::Models::ProfileCreateParams

  ProfileDeleteParams = Sentdm::Models::ProfileDeleteParams

  ProfileDetail = Sentdm::Models::ProfileDetail

  ProfileListParams = Sentdm::Models::ProfileListParams

  ProfileRetrieveParams = Sentdm::Models::ProfileRetrieveParams

  Profiles = Sentdm::Models::Profiles

  ProfileSettings = Sentdm::Models::ProfileSettings

  ProfilesList = Sentdm::Models::ProfilesList

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

  TcrBrandIdentityStatus = Sentdm::Models::TcrBrandIdentityStatus

  TcrBrandRelationship = Sentdm::Models::TcrBrandRelationship

  TcrBrandStatus = Sentdm::Models::TcrBrandStatus

  TcrCampaignStatus = Sentdm::Models::TcrCampaignStatus

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

  TemplateHeaderLocation = Sentdm::Models::TemplateHeaderLocation

  TemplateListParams = Sentdm::Models::TemplateListParams

  TemplateMediaItem = Sentdm::Models::TemplateMediaItem

  TemplateMmsBodyContent = Sentdm::Models::TemplateMmsBodyContent

  TemplateRef = Sentdm::Models::TemplateRef

  TemplateRetrieveParams = Sentdm::Models::TemplateRetrieveParams

  TemplatesList = Sentdm::Models::TemplatesList

  TemplateUpdateParams = Sentdm::Models::TemplateUpdateParams

  TemplateVariable = Sentdm::Models::TemplateVariable

  TemplateVariableProps = Sentdm::Models::TemplateVariableProps

  UserInviteParams = Sentdm::Models::UserInviteParams

  UserListParams = Sentdm::Models::UserListParams

  UserRemoveParams = Sentdm::Models::UserRemoveParams

  UserResponse = Sentdm::Models::UserResponse

  UserRetrieveParams = Sentdm::Models::UserRetrieveParams

  UsersList = Sentdm::Models::UsersList

  UserUpdateRoleParams = Sentdm::Models::UserUpdateRoleParams

  Voice = Sentdm::Models::Voice

  WebhookCreateParams = Sentdm::Models::WebhookCreateParams

  WebhookDeleteParams = Sentdm::Models::WebhookDeleteParams

  WebhookDelivery = Sentdm::Models::WebhookDelivery

  WebhookEventsList = Sentdm::Models::WebhookEventsList

  WebhookEventType = Sentdm::Models::WebhookEventType

  WebhookEventTypesList = Sentdm::Models::WebhookEventTypesList

  WebhookListEventsParams = Sentdm::Models::WebhookListEventsParams

  WebhookListEventTypesParams = Sentdm::Models::WebhookListEventTypesParams

  WebhookListParams = Sentdm::Models::WebhookListParams

  WebhookResponse = Sentdm::Models::WebhookResponse

  WebhookRetrieveParams = Sentdm::Models::WebhookRetrieveParams

  WebhookRotateSecretParams = Sentdm::Models::WebhookRotateSecretParams

  WebhookSecret = Sentdm::Models::WebhookSecret

  WebhookSenderProfile = Sentdm::Models::WebhookSenderProfile

  WebhookSenderProfileConfig = Sentdm::Models::WebhookSenderProfileConfig

  WebhooksList = Sentdm::Models::WebhooksList

  WebhookTest = Sentdm::Models::WebhookTest

  WebhookTestParams = Sentdm::Models::WebhookTestParams

  WebhookToggleStatusParams = Sentdm::Models::WebhookToggleStatusParams

  WebhookUpdateParams = Sentdm::Models::WebhookUpdateParams
end
