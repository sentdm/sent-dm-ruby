# typed: strong

module Sentdm
  module Models
    ProfileCompleteResponse =
      T.let(T.anything, Sentdm::Internal::Type::Converter)
  end
end
