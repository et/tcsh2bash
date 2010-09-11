module Tcsh2Bash
  class IfOneLine < Treetop::Runtime::SyntaxNode
    def to_bash
      if_opening.to_bash + " ; then " + command.to_bash + " ; fi"
    end
  end

  class IfMultiLine < Treetop::Runtime::SyntaxNode
    def to_bash
      if_opening.to_bash + "\nthen\n" + multiple_commands.to_bash + "\nfi"
    end
  end

  class IfOpening < Treetop::Runtime::SyntaxNode
    def to_bash
      "if " + paren_bool_expr.to_bash
    end
  end
end
