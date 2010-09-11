module Tcsh2Bash
  class Foreach < Treetop::Runtime::SyntaxNode
    def to_bash
      "for " + variable.text_value " in " + collection.text_value + "\ndo\n" + commands.to_bash + "\nfi"
    end
  end
end
 
