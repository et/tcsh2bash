module Tcsh2Bash
  class Lines < Treetop::Runtime::SyntaxNode
    def to_bash
      output = ""
      output << line.to_bash << "\n"
      rest_of_lines.elements.map do |e|
        output << e.line.to_bash << "\n"
      end
      output
    end
  end

  class UnparseableLine < Treetop::Runtime::SyntaxNode
    def to_bash
      "#######################\n" <<
      "# Unable to parse: " << text_value << "\n" <<
      "#######################"
    end
  end
end
