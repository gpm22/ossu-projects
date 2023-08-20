require_relative '../src/VMWriter'

def test
  writer = VMWriter.new(File.dirname(__dir__) + 'test.vm')
  segments = %i[CONSTANT ARGUMENT
                LOCAL STATIC
                THIS THAT
                POINTER TEMP]
  commands = %i[ADD SUB NEG
                EQ GT LT
                AND OR NOT]

  segments.each { |s| writer.writePush(s, 0) }
  segments[1..-1].each { |s| writer.writePop(s, 1) }

  commands.each {|c| writer.writeArithmetic(c)}

  writer.writeLabel("OLA12")

  writer.writeGoto("LALA34")

  writer.writeIf("AHLA43")

  writer.writeCall("osasuna", 12)

  writer.writeFunction("olala", 0)

  writer.writeReturn
  writer.close
end

test
