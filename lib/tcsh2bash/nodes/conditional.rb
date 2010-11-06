module Tcsh2Bash
  class IfOneLine < Treetop::Runtime::SyntaxNode
    def to_bash
      if_opening.to_bash + " ; then " + statement.to_bash + " ; fi"
    end
  end

  class IfBlock < Treetop::Runtime::SyntaxNode
    def to_bash
      output = ""
      output << "\nthen\n"
      block.elements.map do |line|
        output << line.statement.to_bash << "\n"
      end
      output << "fi"
    end
  end

  class IfOpening < Treetop::Runtime::SyntaxNode
    def to_bash
      "if " + paren_bool_expr.to_bash
    end
  end
end
