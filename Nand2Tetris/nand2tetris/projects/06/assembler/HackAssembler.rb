require_relative "./src/Parser"
require_relative "./src/Code"
require_relative "./src/SymbolTable"

class HackAssembler

    def initialize (file)
        setFilesInfo(file)
        setOutput
        @table = SymbolTable.new
    end

    def execute
        executeBasic
    end

    private

    def firstPass
        parser = Parser.new(@file)
    end

    def secondPass
        parser = Parser.new(@file)
    end

    def executeBasic
        parser = Parser.new(@file)
        while (parser.hasMoreLines)
            parser.advance

            if parser.instructionType ==  :A_INSTRUCTION
                line = ("%016b" % parser.symbol)
            elsif parser.instructionType == :C_INSTRUCTION
                line = "111"+Code.comp(parser.comp) + Code.dest(parser.dest) + Code.jump(parser.jump)
            else
                next
            end

            @output.puts(line)
        end
        closeOutputFile
    end

    def setFilesInfo(file)
        raise "File extension must be asm and not #{File.extname(file)}" unless File.extname(file) == ".asm"

        if file.include?("\\") || file.include?("/")
            file = file.gsub("\\", "/") if file.include?("\\")
            @file = file
            puts "file: #{file}"
            puts "@file: #{@file}"
            @folder = File.dirname(@file)
        else
            @folder = Dir.pwd
            @file = @folder.to_s + "/" + file.to_s
        end
    end

    def setOutput
        @output = File.new(@folder + "/" + File.basename(@file, ".asm") + ".hack", "w")
        @output.truncate(0)
    end

    def closeOutputFile
        @output.close
    end

end

for arg in ARGV
    HackAssembler.new(arg).execute
end