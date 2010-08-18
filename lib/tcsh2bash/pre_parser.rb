module Tcsh2Bash
  class PreParser

    def self.parse(input)
      new.parse(input)
    end

    def parse(input)
      input = remove_extra_chars(input)
      input ? input : nil
    end

    private
      def remove_extra_chars(input)
        input.strip.gsub("\r", "").squeeze("\n").gsub(/\n\s*/, "\n").gsub(/\s*\n/, "\n")
      end
  end
end
