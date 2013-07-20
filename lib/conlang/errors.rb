#!/usr/bin/env ruby

class LangFileError < StandardError
  def initialize(msg)
    super msg
  end
end

# If LANG file doesn't exists
# or the loading fails
class LangFileIOError < LangFileError
end

# If syntax error in LANG file 
class LangSyntaxError < LangFileError
end
