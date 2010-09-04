module Tcsh2Bash
  module Boolean

    def self.bracketize (input)
      '[ ' + input + ' ]'
    end

    class ParenBoolExpr < Treetop::Runtime::SyntaxNode
      def to_bash
        paren_bool_expr.to_bash
      end
    end

    class StringComparison < Treetop::Runtime::SyntaxNode
      def to_bash
        Tcsh2Bash::Boolean.bracketize (first.text_value + ' ' + string_oper.text_value + ' ' + second.text_value)
      end
    end

    class NumericComparison < Treetop::Runtime::SyntaxNode
      def to_bash
        Tcsh2Bash::Boolean.bracketize (first.text_value + ' ' + operator.to_bash + ' ' + second.text_value)
      end
    end
  end
end
