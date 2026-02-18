# typed: strong

module SentDm
  module Models
    ProfileCompleteResponse =
      T.let(T.anything, SentDm::Internal::Type::Converter)
  end
end
