require_relative "./src/Parser"
require_relative "./src/Code"
require_relative "./src/SymbolTable"

class HackAssembler

    def initialize (file)
        setOutputAndParser(file)
    end

    def execute
        while (@parser.hasMoreLines)
            @parser.advance

            if @parser.instructionType ==  :A_INSTRUCTION
                line = ("%016b" % @parser.symbol)
            elsif @parser.instructionType == :C_INSTRUCTION
                line = "111"+Code.comp(@parser.comp) + Code.dest(@parser.dest) + Code.jump(@parser.jump)
            else
                next
            end

            @output.puts(line)
        end
        closeOutputFile
    end

    private

    def setOutputAndParser(file)
        raise "File extension must be asm and not #{File.extname(file)}" unless File.extname(file) == ".asm"

        if file.include?("\\") || file.include?("/")
            file = file.gsub("\\", "/") if file.include?("\\")
            folder = File.dirname(file)
            @parser = Parser.new(file)
        else
            folder = Dir.pwd
            @parser = Parser.new(folder.to_s + "/" + file.to_s)
        end

        @output = File.new(folder + "/" + File.basename(file, ".asm") + ".hack", "w")
        @output.truncate(0)
    end

    def closeOutputFile
        @output.close
    end

end

for arg in ARGV
    HackAssembler.new(arg).execute
end