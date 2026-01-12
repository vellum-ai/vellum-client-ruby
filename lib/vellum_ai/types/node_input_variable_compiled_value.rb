# frozen_string_literal: true
require "json"
require_relative "node_input_compiled_string_value"
require_relative "node_input_compiled_number_value"
require_relative "node_input_compiled_json_value"
require_relative "node_input_compiled_chat_history_value"
require_relative "node_input_compiled_search_results_value"
require_relative "node_input_compiled_error_value"
require_relative "node_input_compiled_array_value"
require_relative "node_input_compiled_function_call_value"
require_relative "node_input_compiled_secret_value"
require_relative "node_input_compiled_audio_value"
require_relative "node_input_compiled_video_value"
require_relative "node_input_compiled_image_value"
require_relative "node_input_compiled_document_value"

module Vellum
  class NodeInputVariableCompiledValue
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of NodeInputVariableCompiledValue
    #
    # @param json_object [String] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::NodeInputCompiledStringValue.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::NodeInputCompiledNumberValue.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::NodeInputCompiledJSONValue.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::NodeInputCompiledChatHistoryValue.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::NodeInputCompiledSearchResultsValue.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::NodeInputCompiledErrorValue.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::NodeInputCompiledArrayValue.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::NodeInputCompiledFunctionCallValue.from_json(json_object: json_object)
      when "SECRET"
        member = Vellum::NodeInputCompiledSecretValue.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::NodeInputCompiledAudioValue.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::NodeInputCompiledVideoValue.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::NodeInputCompiledImageValue.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::NodeInputCompiledDocumentValue.from_json(json_object: json_object)
      else
        member = Vellum::NodeInputCompiledStringValue.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "STRING"
        { **@member.to_json, type: @discriminant }.to_json
      when "NUMBER"
        { **@member.to_json, type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, type: @discriminant }.to_json
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "SEARCH_RESULTS"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "SECRET"
        { **@member.to_json, type: @discriminant }.to_json
      when "AUDIO"
        { **@member.to_json, type: @discriminant }.to_json
      when "VIDEO"
        { **@member.to_json, type: @discriminant }.to_json
      when "IMAGE"
        { **@member.to_json, type: @discriminant }.to_json
      when "DOCUMENT"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "STRING"
        Vellum::NodeInputCompiledStringValue.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::NodeInputCompiledNumberValue.validate_raw(obj: obj)
      when "JSON"
        Vellum::NodeInputCompiledJSONValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::NodeInputCompiledChatHistoryValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::NodeInputCompiledSearchResultsValue.validate_raw(obj: obj)
      when "ERROR"
        Vellum::NodeInputCompiledErrorValue.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::NodeInputCompiledArrayValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::NodeInputCompiledFunctionCallValue.validate_raw(obj: obj)
      when "SECRET"
        Vellum::NodeInputCompiledSecretValue.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::NodeInputCompiledAudioValue.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::NodeInputCompiledVideoValue.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::NodeInputCompiledImageValue.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::NodeInputCompiledDocumentValue.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::NodeInputCompiledStringValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::NodeInputCompiledNumberValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::NodeInputCompiledJSONValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::NodeInputCompiledChatHistoryValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::NodeInputCompiledSearchResultsValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::NodeInputCompiledErrorValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::NodeInputCompiledArrayValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::NodeInputCompiledFunctionCallValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::NodeInputCompiledSecretValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.secret(member:)
      new(member: member, discriminant: "SECRET")
    end
    # @param member [Vellum::NodeInputCompiledAudioValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::NodeInputCompiledVideoValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::NodeInputCompiledImageValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::NodeInputCompiledDocumentValue] 
    # @return [Vellum::NodeInputVariableCompiledValue]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end