module Tcsh2Bash
  class MultipleCommands < Treetop::Runtime::SyntaxNode
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
