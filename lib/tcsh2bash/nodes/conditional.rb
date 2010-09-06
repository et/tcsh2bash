module Tcsh2Bash
  class IfOneLine < Treetop::Runtime::SyntaxNode
    def to_bash
      if_opening.to_bash + " ; then " + command.to_bash + " ; fi"
    end
  end

  class IfMultiLine < Treetop::Runtime::SyntaxNode
    def to_bash
      if_opening.to_bash + "\nthen\n" + commands.to_bash + "\nfi"
    end
  end

  class IfOpening < Treetop::Runtime::SyntaxNode
    def to_bash
      "if " + paren_bool_expr.to_bash
    end
  end

  class Commands < Treetop::Runtime::SyntaxNode
    def to_bash
      output = ""
      output << command.to_bash
      rest_of_commands.elements.map do |e|
        output << e.newline.text_value << e.addl.command.to_bash
      end
      output
    end
  end

  class AnyCommand < Treetop::Runtime::SyntaxNode
    def to_bash
      text_value
    end
  end

end
