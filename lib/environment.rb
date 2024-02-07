# frozen_string_literal: true

module Vellum
  class Environment
    PRODUCTION = {
      Default: "https://api.vellum.ai",
      Predict: "https://predict.vellum.ai",
      Documents: "https://documents.vellum.ai"
    }.freeze
  end
end
