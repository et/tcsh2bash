module Tcsh2Bash
  class Eq < Treetop::Runtime::SyntaxNode
    def to_bash
      '-eq'
    end
  end

  class Neq < Treetop::Runtime::SyntaxNode
    def to_bash
      '-neq'
    end
  end

  class Lt < Treetop::Runtime::SyntaxNode
    def to_bash
      '-lt'
    end
  end

  class Lte < Treetop::Runtime::SyntaxNode
    def to_bash
      '-le'
    end
  end

  class Gt < Treetop::Runtime::SyntaxNode
    def to_bash
      '-gt'
    end
  end

  class Gte < Treetop::Runtime::SyntaxNode
    def to_bash
      '-ge'
    end
  end
end
