load 'operators.rb'

#
# This script generates ruby statements for
# the .lang expression and assigments.
#

def load_definitions(bindings)
  statements = ""

  bindings.each_key do |k|
    statements += "#{k} = bindings['#{k}']\n"
  end

  statements
end

def run_expression(expr, bindings)
  # Modify some method's names to avoid
  # error on syntax.
  expr.gsub!(/\bor\b/, 'Or')
  expr.gsub!(/\bmaybe\b/, 'Maybe')
  expr = load_definitions(bindings) + expr

  # Evaluate all generated assigments
  # and then the grammatical expression.
  eval(expr)
end