# Solution for leetcode.com problem #3
# https://leetcode.com/problems/longest-substring-without-repeating-characters/

class Solution:
    # Sliding window algorithm
    def lengthOfLongestSubstring(self, s: str) -> int:
        start = 0
        end = 0
        found = {}
        longest = 0
        while end < len(s):
            if s[end] not in found.keys() or found[s[end]] < start:
                found[s[end]] = end
                if longest == None or longest < end - start + 1:
                    longest = end - start + 1
                end += 1
            else:
                start = found[s[end]] + 1
                found[s[end]] = end
                end += 1
        return longest

    # Brute force algorithm
    def lengthOfLongestSubstring_bf(self, s: str) -> int:
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
assert s.lengthOfLongestSubstring("tmmzuxt") == 5

assert s.lengthOfLongestSubstring_bf("") == 0
assert s.lengthOfLongestSubstring_bf("a") == 1
assert s.lengthOfLongestSubstring_bf("aa") == 1
assert s.lengthOfLongestSubstring_bf("ab") == 2
assert s.lengthOfLongestSubstring_bf("aaa") == 1
assert s.lengthOfLongestSubstring_bf("aab") == 2
assert s.lengthOfLongestSubstring_bf("aba") == 2
assert s.lengthOfLongestSubstring_bf("abb") == 2
assert s.lengthOfLongestSubstring_bf("abb") == 2
assert s.lengthOfLongestSubstring_bf("abc") == 3
assert s.lengthOfLongestSubstring_bf("abcabcbb") == 3
assert s.lengthOfLongestSubstring_bf("bbbbb") == 1
assert s.lengthOfLongestSubstring_bf("pwwkew") == 3
assert s.lengthOfLongestSubstring_bf("tmmzuxt") == 5
