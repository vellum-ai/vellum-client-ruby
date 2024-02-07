# frozen_string_literal: true

require_relative "metadata_filter_rule_combinator"
require_relative "metadata_filter_rule_request"
require_relative "logical_operator"
require "json"

module Vellum
  class MetadataFilterConfigRequest
    attr_reader :combinator, :negated, :rules, :field, :operator, :value, :additional_properties

    # @param combinator [METADATA_FILTER_RULE_COMBINATOR]
    # @param negated [Boolean]
    # @param rules [Array<MetadataFilterRuleRequest>]
    # @param field [String]
    # @param operator [LOGICAL_OPERATOR]
    # @param value [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [MetadataFilterConfigRequest]
    def initialize(combinator: nil, negated: nil, rules: nil, field: nil, operator: nil, value: nil,
                   additional_properties: nil)
      # @type [METADATA_FILTER_RULE_COMBINATOR]
      @combinator = combinator
      # @type [Boolean]
      @negated = negated
      # @type [Array<MetadataFilterRuleRequest>]
      @rules = rules
      # @type [String]
      @field = field
      # @type [LOGICAL_OPERATOR]
      @operator = operator
      # @type [String]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of MetadataFilterConfigRequest
    #
    # @param json_object [JSON]
    # @return [MetadataFilterConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      combinator = METADATA_FILTER_RULE_COMBINATOR.key(parsed_json["combinator"]) || parsed_json["combinator"]
      negated = struct.negated
      rules = parsed_json["rules"].map do |v|
        v = v.to_json
        MetadataFilterRuleRequest.from_json(json_object: v)
      end
      field = struct.field
      operator = LOGICAL_OPERATOR.key(parsed_json["operator"]) || parsed_json["operator"]
      value = struct.value
      new(combinator: combinator, negated: negated, rules: rules, field: field, operator: operator, value: value,
          additional_properties: struct)
    end

    # Serialize an instance of MetadataFilterConfigRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "combinator": METADATA_FILTER_RULE_COMBINATOR[@combinator] || @combinator,
        "negated": @negated,
        "rules": @rules,
        "field": @field,
        "operator": LOGICAL_OPERATOR[@operator] || @operator,
        "value": @value
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.combinator&.is_a?(METADATA_FILTER_RULE_COMBINATOR) != false || raise("Passed value for field obj.combinator is not the expected type, validation failed.")
      obj.negated&.is_a?(Boolean) != false || raise("Passed value for field obj.negated is not the expected type, validation failed.")
      obj.rules&.is_a?(Array) != false || raise("Passed value for field obj.rules is not the expected type, validation failed.")
      obj.field&.is_a?(String) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
      obj.operator&.is_a?(LOGICAL_OPERATOR) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
