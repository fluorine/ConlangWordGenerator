#!/usr/bin/env ruby

#
# This Ruby class generates random words using 
# prabability-weighted symbols, and grammar rules
# from a given *.lang file as input.
# 

class WordGenerator
  # Constructor
  def initialize(file)
    # Check file extension.
    unless file.match(/.*\.lang/)
      raise LangFileIOError,
            "Given file, \"#{file}\", is not a .lang file." 
    end

    # Check if files exist
    unless File.exist?(file)
      raise LangFileIOError,
            "File \"#{file}\" was not found." 
    end

    #   #   #   #   #   #   #   #   #

    # Input filename
    @lang_file = file

    # Bindings for SymbolSets and a variable 
    # to save the grammatical expression string.
    @bindings = {}
    @full_expression = ""

    # Bindings for replacements
    @replacements = {}

    # Parse .lang file
    parse_lang_file

    # Parse and evaluate grammatical expression
    eval_expression
  end

  # This method reads a .lang file to parse it.
  # It parses the symbols and then copies the full
  # grammatical expression to evaluate it later.
  def parse_lang_file
    # Open .lang file and parse it, then copy 
    # its full grammatical expression.
    File.open(@lang_file, "r:UTF-8") do |file|
      lines_count = 1
      current = :none

      # Evaluating lines
      while (line = file.gets)
        # Parsing .lang file
        case line
        when /(^\s*$)|(^\s*#.*$)/
          # Ignore blank lines or comments
          
        when /^\s*symbols\s*for\s*(\w*)?\s*(\w+)\s*:\s*(#.*)?$/
          # Create new symbol set
          captured = line.scan(/\s*(\w+)\s*:/)
          current_binding = captured[0][0]
          @bindings[current_binding] = ConlangWordGenerator::SymbolSet.new
          current = :symbols

        when /^\s*expression\s*:\s*(#.*)?$/
          # Start of grammatical expression
          #puts "Evaluating expression:"
          current = :expression

        when /^\s*(\S+)\s*[:=]\s*(\w+)\s*(#.*)?$/
          if current == :symbols
            #Add a symbol to the current SymbolSet's binding
            @bindings[current_binding].add_pair($1, $2.to_i)
          else
            raise LangSyntaxError, "Runtime error when evaluating " +
                                   "\"#{@lang_file}\" at binding line #{lines_count}."
          end

        else
          if current == :expression
            # Copying expression
            @full_expression += line.strip
          else
            raise LangSyntaxError, "Runtime error when evaluating " +
                                   "\"#{@lang_file}\" at line #{lines_count}."
          end
        end

        #Counting lines
        lines_count += 1
      end
    end
  end

  # This method evaluates the grammatical expression
  # and then generate random words.
  def eval_expression
    @evaluated_expression =
       ConlangWordGenerator::run_expression(@full_expression, @bindings)
  end

  # This method generates words
  def get_words(qty = 30)
    raise "Error on quantity of words." if qty < 1

    words = []

    qty.times do
      words += [@evaluated_expression.sample]
    end 

    words
  end
end
