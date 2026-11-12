# typed: strong

module Sentdm
  module Models
    module Channels
      SuppliedCampaign =
        T.let(
          Sentdm::Internal::Type::HashOf[Sentdm::Internal::Type::Unknown],
          Sentdm::Internal::Type::Converter
        )
    end
  end
end
