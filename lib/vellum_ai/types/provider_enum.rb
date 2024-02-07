# frozen_string_literal: true

module Vellum
  # @type [PROVIDER_ENUM]
  PROVIDER_ENUM = {
    anthropic: "ANTHROPIC",
    aws_bedrock: "AWS_BEDROCK",
    azure_openai: "AZURE_OPENAI",
    cohere: "COHERE",
    google: "GOOGLE",
    hosted: "HOSTED",
    mosaicml: "MOSAICML",
    openai: "OPENAI",
    fireworks_ai: "FIREWORKS_AI",
    huggingface: "HUGGINGFACE",
    mystic: "MYSTIC",
    pyq: "PYQ",
    replicate: "REPLICATE"
  }.freeze
end
