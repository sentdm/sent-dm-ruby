# typed: strong

module Sentdm
  module Models
    ProfileCompleteSetupResponse =
      T.let(T.anything, Sentdm::Internal::Type::Converter)
  end
end
