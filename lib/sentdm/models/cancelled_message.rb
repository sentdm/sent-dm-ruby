# frozen_string_literal: true

module Sentdm
  module Models
    class CancelledMessage < Sentdm::Models::Message
      # @!attribute scheduled_at
      #   The send time that was called off, in UTC — the scheduled_at the message was
      #   being held for, whether you set it or the recipient's quiet hours moved it
      #   there. Omitted only for a held message that carried no recorded instant.
      #
      #   @return [Time, nil]
      optional :scheduled_at, Time, nil?: true

      # @!method initialize(scheduled_at: nil)
      #   Some parameter documentations has been truncated, see
      #   {Sentdm::Models::CancelledMessage} for more details.
      #
      #   Message response for v3 API — same shape as v2 with snake_case JSON conventions.
      #
      #   The shape of a message that was sent immediately: it never has a scheduled_at
      #   key. A message that is or was held for a later instant is a
      #   ScheduledMessageResponse, and the endpoint decides which of the two to answer
      #   with. From always returns this type.
      #
      #   @param scheduled_at [Time, nil] The send time that was called off, in UTC — the scheduled_at the message was bei
    end
  end
end
