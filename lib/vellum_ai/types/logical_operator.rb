# frozen_string_literal: true

module Vellum
# * `=` - EQUALS
#  * `!=` - DOES_NOT_EQUAL
#  * `<` - LESS_THAN
#  * `>` - GREATER_THAN
#  * `<=` - LESS_THAN_OR_EQUAL_TO
#  * `>=` - GREATER_THAN_OR_EQUAL_TO
#  * `contains` - CONTAINS
#  * `beginsWith` - BEGINS_WITH
#  * `endsWith` - ENDS_WITH
#  * `doesNotContain` - DOES_NOT_CONTAIN
#  * `doesNotBeginWith` - DOES_NOT_BEGIN_WITH
#  * `doesNotEndWith` - DOES_NOT_END_WITH
#  * `null` - NULL
#  * `notNull` - NOT_NULL
#  * `in` - IN
#  * `notIn` - NOT_IN
#  * `between` - BETWEEN
#  * `notBetween` - NOT_BETWEEN
#  * `concat` - CONCAT
#  * `+` - ADD
#  * `-` - MINUS
#  * `blank` - BLANK
#  * `notBlank` - NOT_BLANK
#  * `coalesce` - COALESCE
#  * `accessField` - ACCESS_FIELD
#  * `parseJson` - PARSE_JSON
#  * `and` - AND
#  * `or` - OR
#  * `isError` - IS_ERROR
#  * `length` - LENGTH
  class LogicalOperator

    EQUALS = "="
    DOES_NOT_EQUAL = "!="
    LESS_THAN = "<"
    GREATER_THAN = ">"
    LESS_THAN_OR_EQUAL_TO = "<="
    GREATER_THAN_OR_EQUAL_TO = ">="
    CONTAINS = "contains"
    BEGINS_WITH = "beginsWith"
    ENDS_WITH = "endsWith"
    DOES_NOT_CONTAIN = "doesNotContain"
    DOES_NOT_BEGIN_WITH = "doesNotBeginWith"
    DOES_NOT_END_WITH = "doesNotEndWith"
    NULL = "null"
    NOT_NULL = "notNull"
    IN = "in"
    NOT_IN = "notIn"
    BETWEEN = "between"
    NOT_BETWEEN = "notBetween"
    CONCAT = "concat"
    ADD = "+"
    MINUS = "-"
    BLANK = "blank"
    NOT_BLANK = "notBlank"
    COALESCE = "coalesce"
    ACCESS_FIELD = "accessField"
    PARSE_JSON = "parseJson"
    AND = "and"
    OR = "or"
    IS_ERROR = "isError"
    LENGTH = "length"

  end
end