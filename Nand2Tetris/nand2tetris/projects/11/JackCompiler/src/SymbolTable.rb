class SymbolTable
  def initialize
    reset
  end

  def reset
    @table = {}
    @staticIndex = -1
    @fieldIndex = -1
    @argIndex = -1
    @varIndex = -1
  end

  def define(name, type, kind)
    raise "variable #{name} already exist!" if @table.include? name

    @table[name] = Row.new(name, type, kind, getIndexByKind(kind))
  end

  def varCount(kind)
    case kind
    when :STATIC
      @staticIndex + 1
    when :FIELD
      @fieldIndex + 1
    when :ARG
      @argIndex + 1
    when :VAR
      @varIndex + 1
    else
      raise "kind #{kind} does no exist!"
    end
  end

  def kindOf(name)
    if @table.include? name
      @table[name].kind
    else
      :NONE
    end
  end

  def typeOf(name)
    raise "There is no variable #{name}" unless @table.include? name

    @table[name].type
  end

  def indexOf(name)
    raise "There is no variable #{name}" unless @table.include? name

    @table[name].index
  end

  private

  def getIndexByKind(kind)
    case kind
    when :STATIC
      @staticIndex += 1
    when :FIELD
      @fieldIndex += 1
    when :ARG
      @argIndex += 1
    when :VAR
      @varIndex += 1
    else
      raise "kind #{kind} does no exist!"
    end
  end

  class Row
    attr_reader :name, :type, :kind, :index

    def initialize(name, type, kind, index)
      @name = name
      @type = type
      @kind = kind
      @index = index
    end
  end
end
