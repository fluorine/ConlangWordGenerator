require 'conlang'
require 'test/unit'

class TestWordGenerator < Test::Unit::TestCase
  def test_or_operators
    words = WordGenerator.new("test_file_or.lang").get_words(10)
    words.each do |word|
      assert_match(/^[aoptk][ao]$/, word)
    end
  end

  def test_maybe_operators
    words = WordGenerator.new("test_file_maybe.lang").get_words(10)
    words.each do |word|
      assert_match(/^[ptk]*[ao]*$/, word)
    end
  end
end
