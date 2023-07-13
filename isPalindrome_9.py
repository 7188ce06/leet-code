# Solution for leetcode.com problem #9
# https://leetcode.com/problems/palindrome-number/

class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x < 0:
            # All negative integers are not palidromes because they start with
            # a negative sign, but do not end with one.
            return False
        elif x == 0:
            # Zero is a palindrome, because when reversed it's still zero.
            return True
        else:
            assert 0 < x
            # Find the largest power of ten that is not larger than x.
            a = 0
            while 10**(a+1) <= x:
                a += 1
            return self.isPalindromePosInt(x, a)

    def isPalindromePosInt(self, x: int, a: int) -> bool:
        assert 0 <= x
        assert -1 <= a
        # x has a+1 digits (possibly including leading zeros).
        if a == 0 or a == -1:
            return True
        else:
            return ( x // (10**a) == x % 10 ) and self.isPalindromePosInt( ( x % (10**a) ) // 10, a - 2 )

s = Solution()
assert s.isPalindrome(-1) == False
assert s.isPalindrome(0) == True
assert s.isPalindrome(1) == True
assert s.isPalindrome(10) == False
assert s.isPalindrome(11) == True
assert s.isPalindrome(10001) == True
assert s.isPalindrome(10002) == False
