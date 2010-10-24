module Tcsh2Bash
  class UndefinedStatement < Treetop::Runtime::SyntaxNode
    def to_bash
      text_value
    end
  end

end
