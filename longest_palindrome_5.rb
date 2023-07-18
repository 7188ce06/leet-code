# Solution for leetcode problem #5
# https://leetcode.com/problems/longest-palindromic-substring/

def longest_palindrome(s)
  # @palis is ordered over its entire lifetime from the shortest to longest palindromes.
  # First find all length 1 and 2 palindromes
  palis = 0.upto(s.size - 1).map {|i| [i, i]}
  palis += 0.upto(s.size - 2).filter {|i| s[i] == s[i+1]}.map {|i| [i, i+1]}
  longest = s[palis[-1][0]..palis[-1][1]]
  while palis.size != 0
    x = palis.shift()
    start = x[0]
    stop = x[1]
    if start != 0 and stop != s.size - 1
      if s[start-1] == s[stop+1]
        palis.push([start-1,stop+1])
        longest = s[start-1..stop+1]
      end
    end
  end
  longest
end

raise "fail" if !(longest_palindrome("z") == "z")
raise "fail" if !(["a", "b"].include? longest_palindrome("ab"))
raise "fail" if !(longest_palindrome("aa") == "aa")
raise "fail" if !(["a", "b", "c"].include? longest_palindrome("abc"))
raise "fail" if !(longest_palindrome("aab") == "aa")
raise "fail" if !(longest_palindrome("aba") == "aba")
raise "fail" if !(longest_palindrome("baa") == "aa")
raise "fail" if !(longest_palindrome("aaa") == "aaa")
raise "fail" if !(["bab", "aba"].include? longest_palindrome("babad"))
