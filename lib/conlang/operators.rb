# Operators for .lang grammatical expressions.
#   - maybe(weight, symbolset)
#       The symbolset may appear or not (empty string),
#       given its probability (weight: 0 - 100) to appear.
#   - or(weight, symbolsetA, symbolsetB)
#       A symbol from symbolsetA or symbolsetB may appear.
#       The probability weight for symbolsetA is specificed
#       and the complement (of 100) favors symbolsetB.
#   - a + b + ...
#       Append all symbols.
#  

#
# Base classes for operators.
#
module ConlangWordGenerator
  # 
  # Classes for operators
  # and operands.
  #
  class Or
    def initialize(weight, setA, setB)
      unless weight > 0 and weight < 100
        raise "Error: Weight for an or() operator " +
              "must be between 1 and 100 (exclusive)."
      end

      @weight = weight
      @setA = setA
      @setB = setB
    end

    def sample
      if rand(100) < @weight
        @setA.sample
      else
        @setB.sample
      end
    end

    def +(other)
      Append.new(self, other)
    end
  end

  class Append
    def initialize(*sets)
      @sets = sets
    end

    def sample
      result = ""

      @sets.each { |item| result += item.sample }

      result
    end

    def +(other)
      Append.new(self, other)
    end
  end

  class Maybe
    def initialize(weight, set)
      unless weight > 0 and weight < 100
        raise "Error: Weight for an maybe() operator " +
              "must be between 1 and 100 (exclusive)."
      end

      @weight = weight
      @set = set
    end

    def sample
      if rand(100) < @weight
        @set.sample
      else
        ""
      end
    end

    def +(other)
      Append.new(self, other)
    end
  end

  #
  # Functions for operators
  #

  def self.orOp(*args)
    if args.length == 2
      Or.new(50, args[0], args[1])
    elsif args.length == 3
      Or.new(args[0].to_i, args[1], args[2])
    else
      raise "Error evaluating an Or() expression."
    end
  end

  def self.maybeOp(*args)
    if args.length == 1
      Maybe.new(50, args[0]) 
    elsif args.length == 2
      Maybe.new(args[0].to_i, args[1])
    else
      raise "Error evaluating Maybe() expression."
    end
  end

  #
  # Interpreter
  #
    def self.load_definitions(bindings)
    statements = ""

    bindings.each_key do |k|
      statements += "#{k} = bindings['#{k}']\n"
    end

    statements
  end

  def self.run_expression(expr, bindings)
    # Modify method's names to avoid
    # errors on Ruby syntax.
    expr.gsub!(/\b[Oo]r\b/, 'orOp')
    expr.gsub!(/\b[Mm]aybe\b/, 'maybeOp')

    expr =  load_definitions(bindings) + expr

    # Evaluate all generated assigments
    # and then the grammatical expression.
    eval(expr)
  end
end