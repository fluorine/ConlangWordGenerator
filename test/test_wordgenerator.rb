require 'conlang'
require 'test/unit'

class TestWordGenerator < Test::Unit::TestCase
  def test_or_operators
    words = WordGenerator.new("test_file_or.lang").get_words(10)
    word.each do |word|
      assert_match(word, /^[aoptk][ao]$/)
    end
  end

  def test_maybe_operators
    words = WordGenerator.new("test_file_maybe.lang").get_words(10)
    word.each do |word|
      assert_match(word, /^[ptk]*[ao]*$/)
    end
  end
end
