module Tcsh2Bash
  class SetAssignment < Treetop::Runtime::SyntaxNode
    def to_bash
      variable.text_value + '=' + value.text_value
    end
  end

  class AliasAssignment < Treetop::Runtime::SyntaxNode
    def to_bash
      'alias ' + variable.text_value + '=' + value.text_value
    end
  end

  class SetenvAssignment < Treetop::Runtime::SyntaxNode
    def to_bash
      'export ' + variable.text_value + '=' + value.text_value
    end
  end
end
