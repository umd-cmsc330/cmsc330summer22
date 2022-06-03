require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class SemiPublicTests < MiniTest::Test
    def setup
        @phonebook = PhoneBook.new
    end

    def test_semi_public_warmup
        assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765], fib(21))
        assert_equal(false, isPalindrome(558))
        assert_equal(false, isPalindrome(1126))
        assert_equal(true, isPalindrome(558855))
        assert_equal(true, isPalindrome(11266211))
        assert_equal(8, nthmax(0, [5,5,8]))
        assert_equal(5, nthmax(1, [5,5,8]))
        assert_equal(5, nthmax(2, [5,5,8]))
        assert_equal("5", freq("558"))
        assert_equal("1", freq("1126"))
        assert_equal({1 => 5, 3 => 5, 7 => 8}, zipHash([1,3,7], [5,5,8]))
        assert_equal([[1,5], [3,5], [7,8]], hashToArray({1 => 5, 3 => 5, 7 => 8}))
    end
end
