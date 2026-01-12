# frozen_string_literal: true
require "json"
require_relative "workflow_output_string"
require_relative "workflow_output_number"
require_relative "workflow_output_json"
require_relative "workflow_output_chat_history"
require_relative "workflow_output_search_results"
require_relative "workflow_output_array"
require_relative "workflow_output_error"
require_relative "workflow_output_function_call"
require_relative "workflow_output_image"
require_relative "workflow_output_audio"
require_relative "workflow_output_video"
require_relative "workflow_output_document"

module Vellum
  class WorkflowOutput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::WorkflowOutput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of WorkflowOutput
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::WorkflowOutputString.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::WorkflowOutputNumber.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::WorkflowOutputJSON.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::WorkflowOutputChatHistory.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::WorkflowOutputSearchResults.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::WorkflowOutputArray.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::WorkflowOutputError.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::WorkflowOutputFunctionCall.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::WorkflowOutputImage.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::WorkflowOutputAudio.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::WorkflowOutputVideo.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::WorkflowOutputDocument.from_json(json_object: json_object)
      else
        member = Vellum::WorkflowOutputString.from_json(json_object: json_object)
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
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "IMAGE"
        { **@member.to_json, type: @discriminant }.to_json
      when "AUDIO"
        { **@member.to_json, type: @discriminant }.to_json
      when "VIDEO"
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
        Vellum::WorkflowOutputString.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::WorkflowOutputNumber.validate_raw(obj: obj)
      when "JSON"
        Vellum::WorkflowOutputJSON.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::WorkflowOutputChatHistory.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::WorkflowOutputSearchResults.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::WorkflowOutputArray.validate_raw(obj: obj)
      when "ERROR"
        Vellum::WorkflowOutputError.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::WorkflowOutputFunctionCall.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::WorkflowOutputImage.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::WorkflowOutputAudio.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::WorkflowOutputVideo.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::WorkflowOutputDocument.validate_raw(obj: obj)
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
    # @param member [Vellum::WorkflowOutputString] 
    # @return [Vellum::WorkflowOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::WorkflowOutputNumber] 
    # @return [Vellum::WorkflowOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::WorkflowOutputJSON] 
    # @return [Vellum::WorkflowOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::WorkflowOutputChatHistory] 
    # @return [Vellum::WorkflowOutput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::WorkflowOutputSearchResults] 
    # @return [Vellum::WorkflowOutput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::WorkflowOutputArray] 
    # @return [Vellum::WorkflowOutput]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::WorkflowOutputError] 
    # @return [Vellum::WorkflowOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::WorkflowOutputFunctionCall] 
    # @return [Vellum::WorkflowOutput]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::WorkflowOutputImage] 
    # @return [Vellum::WorkflowOutput]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::WorkflowOutputAudio] 
    # @return [Vellum::WorkflowOutput]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::WorkflowOutputVideo] 
    # @return [Vellum::WorkflowOutput]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::WorkflowOutputDocument] 
    # @return [Vellum::WorkflowOutput]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end