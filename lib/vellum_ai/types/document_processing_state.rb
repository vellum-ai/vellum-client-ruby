# frozen_string_literal: true

module Vellum
# * `QUEUED` - Queued
#  * `PROCESSING` - Processing
#  * `PROCESSED` - Processed
#  * `FAILED` - Failed
#  * `UNKNOWN` - Unknown
  class DocumentProcessingState

    QUEUED = "QUEUED"
    PROCESSING = "PROCESSING"
    PROCESSED = "PROCESSED"
    FAILED = "FAILED"
    UNKNOWN = "UNKNOWN"

  end
end