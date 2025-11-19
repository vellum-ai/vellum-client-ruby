# frozen_string_literal: true

module Vellum
# * `INITIATED` - Initiated
#  * `STREAMING` - Streaming
#  * `FULFILLED` - Fulfilled
#  * `REJECTED` - Rejected
#  * `PENDING` - Pending
  class WorkflowResultEventState

    INITIATED = "INITIATED"
    STREAMING = "STREAMING"
    FULFILLED = "FULFILLED"
    REJECTED = "REJECTED"
    PENDING = "PENDING"

  end
end