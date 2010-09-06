module Tcsh2Bash
  class Lines < Treetop::Runtime::SyntaxNode
    def to_bash
      output = ""
      output << line.to_bash
      rest_of_lines.elements.map do |e|
        output << e.newline.text_value << e.line.to_bash
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
