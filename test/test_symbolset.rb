require 'conlang'
require 'test/unit'

class TestSymbolset < Test::Unit::TestCase
  def setup
    @ss = ConlangWordGenerator::SymbolSet.new
  end

  def test_out_of_weight_upper_range
    (100...110).each do |n|
      assert_raise(LangSyntaxError) do
        @ss.add_pair 'x', n
      end
    end
  end

  def test_out_of_weight_lower_range
    (-5...1).each do |n|
      assert_raise(LangSyntaxError) do
        @ss.add_pair 'x', n
      end
    end
  end
end
