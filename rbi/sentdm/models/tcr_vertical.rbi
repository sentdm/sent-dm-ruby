# typed: strong

module Sentdm
  module Models
    module TcrVertical
      extend Sentdm::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Sentdm::TcrVertical) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      PROFESSIONAL = T.let(:PROFESSIONAL, Sentdm::TcrVertical::TaggedSymbol)
      REAL_ESTATE = T.let(:REAL_ESTATE, Sentdm::TcrVertical::TaggedSymbol)
      HEALTHCARE = T.let(:HEALTHCARE, Sentdm::TcrVertical::TaggedSymbol)
      HUMAN_RESOURCES =
        T.let(:HUMAN_RESOURCES, Sentdm::TcrVertical::TaggedSymbol)
      ENERGY = T.let(:ENERGY, Sentdm::TcrVertical::TaggedSymbol)
      ENTERTAINMENT = T.let(:ENTERTAINMENT, Sentdm::TcrVertical::TaggedSymbol)
      RETAIL = T.let(:RETAIL, Sentdm::TcrVertical::TaggedSymbol)
      TRANSPORTATION = T.let(:TRANSPORTATION, Sentdm::TcrVertical::TaggedSymbol)
      AGRICULTURE = T.let(:AGRICULTURE, Sentdm::TcrVertical::TaggedSymbol)
      INSURANCE = T.let(:INSURANCE, Sentdm::TcrVertical::TaggedSymbol)
      POSTAL = T.let(:POSTAL, Sentdm::TcrVertical::TaggedSymbol)
      EDUCATION = T.let(:EDUCATION, Sentdm::TcrVertical::TaggedSymbol)
      HOSPITALITY = T.let(:HOSPITALITY, Sentdm::TcrVertical::TaggedSymbol)
      FINANCIAL = T.let(:FINANCIAL, Sentdm::TcrVertical::TaggedSymbol)
      POLITICAL = T.let(:POLITICAL, Sentdm::TcrVertical::TaggedSymbol)
      GAMBLING = T.let(:GAMBLING, Sentdm::TcrVertical::TaggedSymbol)
      LEGAL = T.let(:LEGAL, Sentdm::TcrVertical::TaggedSymbol)
      CONSTRUCTION = T.let(:CONSTRUCTION, Sentdm::TcrVertical::TaggedSymbol)
      NGO = T.let(:NGO, Sentdm::TcrVertical::TaggedSymbol)
      MANUFACTURING = T.let(:MANUFACTURING, Sentdm::TcrVertical::TaggedSymbol)
      GOVERNMENT = T.let(:GOVERNMENT, Sentdm::TcrVertical::TaggedSymbol)
      TECHNOLOGY = T.let(:TECHNOLOGY, Sentdm::TcrVertical::TaggedSymbol)
      COMMUNICATION = T.let(:COMMUNICATION, Sentdm::TcrVertical::TaggedSymbol)

      sig { override.returns(T::Array[Sentdm::TcrVertical::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
