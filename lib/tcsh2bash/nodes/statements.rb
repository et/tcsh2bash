module Tcsh2Bash
  class MultiLineStatement < Treetop::Runtime::SyntaxNode
    def to_bash
      output = ""
      output << statement.to_bash
      rest_of_statements.elements.map do |e|
        output << e.newline.text_value << e.statement.to_bash
      end
      output
    end
  end

  class UndefinedStatement < Treetop::Runtime::SyntaxNode
    def to_bash
      text_value
    end
  end


end
