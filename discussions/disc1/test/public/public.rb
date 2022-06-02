require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class PublicTests < MiniTest::Test
    def setup
        @phonebook = PhoneBook.new
    end

    def test_public_fib
        assert_equal([], fib(0))
        assert_equal([0], fib(1))
        assert_equal([0, 1], fib(2))
        assert_equal([0, 1, 1], fib(3))
        assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34], fib(10))
    end

    def test_public_ispalindrome
        assert_equal(true, isPalindrome(0))
        assert_equal(true, isPalindrome(1))
        assert_equal(false, isPalindrome(10))
        assert_equal(true, isPalindrome(101))
        assert_equal(false, isPalindrome(120210))
    end

    def test_public_nthmax
        assert_equal(3, nthmax(0, [1,2,3,0]))
        assert_equal(2, nthmax(1, [3,2,1,0]))
        assert_equal(4, nthmax(2, [7,3,4,5]))
        assert_nil(nthmax(5, [1,2,3]))
    end

    def test_public_freq
        assert_equal("", freq(""))
        assert_equal("a", freq("aaabb"))
        assert_equal("a", freq("bbaaa"))
        assert_equal("s", freq("ssabcd"))
        assert_equal("x", freq("a12xxxxxyyyxyxyxy"))
    end

    def test_public_ziphash
        assert_equal({}, zipHash([], []))
        assert_equal({1 => 2}, zipHash([1], [2]))
        assert_equal({1 => 2, 5 => 4}, zipHash([1, 5], [2, 4]))
        assert_nil(zipHash([1], [2,3]))
        assert_equal({"Mamat" => "prof", "Hicks" => "prof", "Vinnie" => "TA"},
                      zipHash(["Mamat", "Hicks", "Vinnie"], ["prof", "prof", "TA"]))
    end

    def test_public_hashToArray
        assert_equal([["Mamat","prof"],["Eastman","prof"],["Cliff","instructor"],["DVH","prof"],["Dalton","ta"],["Varun","ta"],["James","ta"]],
            hashToArray({"Mamat" => "prof", "Eastman" => "prof", "Cliff" => "instructor", "DVH" => "prof", "Dalton" => "ta", "Varun" => "ta", "James" => "ta"}))
        assert_equal([[2,3],[5,7],[11,13],[17,19]],hashToArray({2=>3,5=>7,11=>13,17=>19}))
    end 

    def test_public_morefib
        assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584], fib(19))
        assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 
            6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229], fib(30))
    end

    def test_public_morepalindrome
        assert_equal(true, isPalindrome(5))
        assert_equal(true, isPalindrome(10101))
        assert_equal(false, isPalindrome(10000011))
        assert_equal(true, isPalindrome(101010010101))
        assert_equal(false, isPalindrome(123123321))
    end

    def test_public_morenthmax
        assert_nil(nthmax(9, [1,2,3,50,100,213,5,6,23]))
        assert_equal(100, nthmax(0, [99,100,100,90,33,23,4,100,100,99]))
        assert_equal(9, nthmax(1, [1,2,3,4,5,6,7,8,9,100]))
        assert_equal(23, nthmax(8, [99,100,100,90,33,23,4,100,100,99]))
        assert_equal(99, nthmax(5, [99,100,100,90,33,23,4,100,100,99]))
        assert_equal(90, nthmax(6, [99,100,100,90,33,23,4,100,100,99]))
    end

    def test_public_morefreq
        assert_equal("a", freq("abababababababa"))
        assert_equal("j", freq("djeiajdfnvczkljdjfiaejdkfhjweiiuzb"))
        assert_equal("a", freq("aaaaaaaaaaab"))
        assert_equal("u", freq("qwioruieqwajuhadslfhzncxvbnzxcsdxvnbvcbouyu"))
    end

    def test_public_moreziphash
        assert_nil(zipHash([], [2]))
        assert_nil(zipHash([1], []))
        assert_equal({"Mamat" => "prof", "Eastman" => "prof", "Cliff" => "instructor", "DVH" => "prof", "Dalton" => "ta", "Varun" => "ta", "James" => "ta"},
        zipHash(["Mamat", "Eastman", "Cliff", "DVH", "Dalton", "Varun", "James"],["prof", "prof", "instructor", "prof", "ta", "ta", "ta"]))
        assert_nil(zipHash([1,3,5],[2,4]))
    end 
end
