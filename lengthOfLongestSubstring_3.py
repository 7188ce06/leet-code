# Solution for leetcode.com problem #3
# https://leetcode.com/problems/longest-substring-without-repeating-characters/

# XXX: There might be a sliding window algorithm that is faster.
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        i = 0
        longest = 0
        while i < len(s):
            found = {s[i] : True}
            j = i + 1
            while j < len(s) and s[j] not in found.keys():
                found[s[j]] = True
                j += 1
            if longest == None or longest < j - i:
                longest = j - i
            i += 1
        return longest

s = Solution()
assert s.lengthOfLongestSubstring("") == 0
assert s.lengthOfLongestSubstring("a") == 1
assert s.lengthOfLongestSubstring("aa") == 1
assert s.lengthOfLongestSubstring("ab") == 2
assert s.lengthOfLongestSubstring("aaa") == 1
assert s.lengthOfLongestSubstring("aab") == 2
assert s.lengthOfLongestSubstring("aba") == 2
assert s.lengthOfLongestSubstring("abb") == 2
assert s.lengthOfLongestSubstring("abb") == 2
assert s.lengthOfLongestSubstring("abc") == 3
assert s.lengthOfLongestSubstring("abcabcbb") == 3
assert s.lengthOfLongestSubstring("bbbbb") == 1
assert s.lengthOfLongestSubstring("pwwkew") == 3
