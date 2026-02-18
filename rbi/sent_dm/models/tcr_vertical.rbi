# typed: strong

module SentDm
  module Models
    module TcrVertical
      extend SentDm::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, SentDm::TcrVertical) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PROFESSIONAL = T.let(:PROFESSIONAL, SentDm::TcrVertical::TaggedSymbol)
      REAL_ESTATE = T.let(:REAL_ESTATE, SentDm::TcrVertical::TaggedSymbol)
      HEALTHCARE = T.let(:HEALTHCARE, SentDm::TcrVertical::TaggedSymbol)
      HUMAN_RESOURCES =
        T.let(:HUMAN_RESOURCES, SentDm::TcrVertical::TaggedSymbol)
      ENERGY = T.let(:ENERGY, SentDm::TcrVertical::TaggedSymbol)
      ENTERTAINMENT = T.let(:ENTERTAINMENT, SentDm::TcrVertical::TaggedSymbol)
      RETAIL = T.let(:RETAIL, SentDm::TcrVertical::TaggedSymbol)
      TRANSPORTATION = T.let(:TRANSPORTATION, SentDm::TcrVertical::TaggedSymbol)
      AGRICULTURE = T.let(:AGRICULTURE, SentDm::TcrVertical::TaggedSymbol)
      INSURANCE = T.let(:INSURANCE, SentDm::TcrVertical::TaggedSymbol)
      POSTAL = T.let(:POSTAL, SentDm::TcrVertical::TaggedSymbol)
      EDUCATION = T.let(:EDUCATION, SentDm::TcrVertical::TaggedSymbol)
      HOSPITALITY = T.let(:HOSPITALITY, SentDm::TcrVertical::TaggedSymbol)
      FINANCIAL = T.let(:FINANCIAL, SentDm::TcrVertical::TaggedSymbol)
      POLITICAL = T.let(:POLITICAL, SentDm::TcrVertical::TaggedSymbol)
      GAMBLING = T.let(:GAMBLING, SentDm::TcrVertical::TaggedSymbol)
      LEGAL = T.let(:LEGAL, SentDm::TcrVertical::TaggedSymbol)
      CONSTRUCTION = T.let(:CONSTRUCTION, SentDm::TcrVertical::TaggedSymbol)
      NGO = T.let(:NGO, SentDm::TcrVertical::TaggedSymbol)
      MANUFACTURING = T.let(:MANUFACTURING, SentDm::TcrVertical::TaggedSymbol)
      GOVERNMENT = T.let(:GOVERNMENT, SentDm::TcrVertical::TaggedSymbol)
      TECHNOLOGY = T.let(:TECHNOLOGY, SentDm::TcrVertical::TaggedSymbol)
      COMMUNICATION = T.let(:COMMUNICATION, SentDm::TcrVertical::TaggedSymbol)

      sig { override.returns(T::Array[SentDm::TcrVertical::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
