require 'conlang'
require 'test/unit'

class TestWordGenerator < Test::Unit::TestCase
  #
  # Test if an Error occurs when opening a file
  #
  def test_file_does_not_exist
    assert_raise(LangFileIOError) do
      WordGenerator.new(Dir.pwd + "/test/doesnt_exists.lang")
    end
  end

  def test_not_lang_file
    assert_raise(LangFileIOError) do
      WordGenerator.new(Dir.pwd + "/test/not_lang.gaga")
    end
  end

  #
  # Catch a general error in LANG file's body
  #
  def test_lang_syntax_error
    assert_raise(LangSyntaxError) do
      WordGenerator.new(Dir.pwd + "/test/test_syntax_error.lang")
    end
  end

  #
  # Test if operators work fine throw
  # the WordGenerator class.
  #
  def test_or_operators
    words = WordGenerator.new(Dir.pwd + "/test/test_file_or.lang").get_words(10)
    words.each do |word|
      assert_match(/^[aoptk][ao]$/, word)
    end
  end

  def test_maybe_operators
    words = WordGenerator.new(Dir.pwd + "/test/test_file_maybe.lang").get_words(10)
    words.each do |word|
      assert_match(/^[ptk]*[ao]*$/, word)
    end
  end

  #
  # Test replacements
  #
  def test_replacements
    words = WordGenerator.new(Dir.pwd + "/test/test_file_replacements.lang").get_words(10)
    words.each do |word|
      assert_match(/^[aobdg][ao]$/, word)
    end
  end
end
