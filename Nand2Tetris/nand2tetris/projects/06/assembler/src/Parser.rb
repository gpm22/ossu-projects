require_relative "./Code"
class Parser

    def initialize(fileName)
        @file = File.open(fileName).each_line
        @currentInstruction=""
        @currentLine = 0
        @cInstructionGroups = nil
    end

    def hasMoreLines
        begin
            @file.peek
            true
        rescue StopIteration
            false
        end
    end

    def advance
        raise "no more lines to read" unless hasMoreLines
        while true
            begin
                nextLine = @file.next
            rescue StopIteration
                return
            end

            @currentLine += 1
            next if nextLine.gsub(/\s+/, "") == "" || (nextLine[0] == "/" && nextLine[1] == "/")
            @currentInstruction = nextLine.gsub(/\s+/, "").split(/^*\/\//, 2).first           
            return
        end
    end

    def instructionType
        if isAInstruction?
            return :A_INSTRUCTION
        elsif isLInstruction?
            return :L_INSTRUCTION
        elsif isCInstruction?
            return :C_INSTRUCTION
        end

        raise "wrong instruction at line #{@currentLine}: #{@currentInstruction}"
    end

    def symbol

        if isLInstruction?
            return @currentInstruction[1..-2]
        elsif isAInstruction?
            return @currentInstruction[1..-1]
        end

        raise "instruction #{@currentInstruction.to_s} it is not a symbol"
    end

    def dest
        raise "instrunction is not a C-instruction" unless isCInstruction?
        @cInstructionGroups[0]
    end

    def comp
        raise "instrunction is not a C-instruction" unless isCInstruction?
        @cInstructionGroups[1]
    end
    
    def jump
        raise "instrunction is not a C-instruction" unless isCInstruction?
        @cInstructionGroups[2]
    end

    private

    def isAInstruction?
        @currentInstruction[0] == "@" && (isSymbol?(@currentInstruction[1..-1]) || /[0-9]+/.match?(@currentInstruction[1..-1]))
    end

    def isLInstruction?
        @currentInstruction[0] == "(" && @currentInstruction[-1] == ")" && isSymbol?(@currentInstruction[1..-2])
    end

    def isSymbol? str
        symbolRegex = /^[_\.\$:a-zA-Z0-9][_\.\$:\w]*$/
        symbolRegex.match? str
    end

    def isCInstruction?
        cInstructionRegex = /^([A-Z]{0,3})=?([A-Z\&\-\+\!\|01]{1,3});?([A-Z]{0,3})$/ #dest=comp;jump
        
        return false unless cInstructionRegex.match? @currentInstruction

        groups = cInstructionRegex.match @currentInstruction

        dest = Code.dest groups[1]
        comp = Code.comp groups[2]
        jump = Code.jump groups[3]

        if !dest.nil? && !comp.nil? && !jump.nil?
            @cInstructionGroups = groups[1..3]
            true
        else
            false
        end
    end
end