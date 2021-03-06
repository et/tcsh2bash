module Tcsh2Bash
  class Statements < Treetop::Runtime::SyntaxNode
    def to_bash
      output = ""
      output << statement.to_bash
      rest_of_statements.elements.map do |e|
        output << e.newline.text_value << e.statement.to_bash
      end
      output
    end
  end

  class UnparseableLine < Treetop::Runtime::SyntaxNode
    def to_bash
      text_value
    end
  end
end
