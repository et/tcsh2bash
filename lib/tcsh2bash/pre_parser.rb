module Tcsh2Bash
  class PreParser

    def self.parse(input, cwd)
      new.parse(input, cwd)
    end

    def parse(input, cwd)
      input = unsource_files(input, cwd)
      input = remove_extra_chars(input)
    end

    private
      def remove_extra_chars(input)
        input.strip.gsub("\r", "").squeeze("\n")
      end

      # Search the file for source statements
      # such as: source ~/.bashrc
      # and extract the text.
      def unsource_files(input, cwd)
        input.gsub(/^\s*source (.*)$/) do |match|
          Dir.chdir(cwd)
          file_name = expand_file_name($1)
          return input if !File.readable?(file_name)
          file = File.open(file_name, 'r')
          unsource_files(file.read, File.dirname(file))
        end
      end

      # This tries to expand the file name if there
      # are any variables in it.
      # example ../hello_world.$SHELL
      def expand_file_name(file)
        return file
        # Will try and match $SHELL or ${SHELL}
        #file.gsub(/\${?([^}\/]*)}?/) do |match|
        #  return ENV[match] unless ENV[match].nil?
        #  file
        #end
      end
  end
end
