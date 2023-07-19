# Recursive DFS implementation
# (based on number of matches, but not total match length)
def word_break(s, word_dict)
  raise "rent" if !(s.is_a? String and s.size >= 1)
  raise "rent" if !(word_dict.is_a? Array and word_dict.size >= 1)

  i = 0
  while i < word_dict.size
    w = word_dict[i]
    if s[0...w.size] == w
      if s.size == w.size
        return true
      else
        raise "assert" if !(s.size > w.size)
        if word_break(s[w.size..], word_dict) == true
          return true
        end
      end
    end
    i += 1
  end
  return false
end

# Iterative DFS implementation
# (based on number of matches, but not total match length)
def word_break_dfs(s, word_dict)
  raise "rent" if !(s.is_a? String and s.size >= 1)
  raise "rent" if !(word_dict.is_a? Array and word_dict.size >= 1)

  searchFrom = [0]
  while searchFrom.size != 0
    start = searchFrom.shift()
    j = 0
    while j < word_dict.size
      w = word_dict[j]
      if s[start...start+w.size] == w
        if start + w.size == s.size
          return true
        else
          raise "assert" if !(s.size > w.size)
          searchFrom.prepend(start+w.size)
        end
      end
      j += 1
    end
  end

  return false
end

# Iterative BFS implementation
# (based on number of matches, but not total match length)
def word_break_bfs(s, word_dict)
  raise "rent" if !(s.is_a? String and s.size >= 1)
  raise "rent" if !(word_dict.is_a? Array and word_dict.size >= 1)

  searchFrom = [0]
  while searchFrom.size != 0
    start = searchFrom.shift()
    j = 0
    while j < word_dict.size
      w = word_dict[j]
      if s[start...start+w.size] == w
        if start + w.size == s.size
          return true
        else
          raise "assert" if !(s.size > w.size)
          searchFrom.append(start+w.size)
        end
      end
      j += 1
    end
  end

  return false
end

raise "fail" if !(word_break_bfs("a", ["a"]) == true)
raise "fail" if !(word_break_bfs("a", ["b"]) == false)
raise "fail" if !(word_break_bfs("a", ["a", "b"]) == true)
raise "fail" if !(word_break_bfs("a", ["b", "a"]) == true)
raise "fail" if !(word_break_bfs("foobar", ["foo", "bar"]) == true)
raise "fail" if !(word_break_bfs("foobar", ["bar", "foo"]) == true)
raise "fail" if !(word_break_bfs("foobar", ["foo", "ba"]) == false)
raise "fail" if !(word_break_bfs("foobar", ["foob", "r"]) == false)

# automatic test generation
# 1. generate a random string
# 2. generate a couple random partitions of it.
# 3. mix and match elements from the different partitions
# 4. invoke word_break_bfs

def randstring(chars, k)
    if !(chars.is_a?(Array) and 1 <= chars.size)
        raise "invalid input"
    elsif !(k.is_a?(Integer) and 0 <= k)
        raise "invalid input"
    end

    xs = []
    i = 0
    while i < k
        xs.append(chars[rand(chars.size)])
        i += 1
    end
    xs.join
end

# Test generator 1
# Partitions a random string and passes the partition as @word_dict.
1.upto(1000) do
  s_len = 10
  s = randstring("abcdefghijklmnopqrstuvwxyz".split(//), s_len)

  splitcnt = 3
  splitat = []
  i = 0
  while i < splitcnt
    # don't split at 0 or -1
    x = rand(s_len - 2)
    if !splitat.include?(x+1)
      splitat.append(x+1)
      i += 1
    end
  end
  splitat.sort!()

  word_dict = [s[0...splitat[0]], s[splitat[0]...splitat[1]], s[splitat[1]...splitat[2]], s[splitat[2]..-1]].shuffle
  raise "fail" if !(word_break(s, word_dict) == true)
  raise "fail" if !(word_break_bfs(s, word_dict) == true)
  raise "fail" if !(word_break_dfs(s, word_dict) == true)
end

# Test generator 2
# Partitions a random string multiple times, then passes one of the partitions plus some
# components from the other partitions as @word_dict.
1.upto(1000) do
  s_len = 20
  s = randstring("abcdefghijklmnopqrstuvwxyz".split(//), s_len)

  parts = []
  partcnt = 3
  i = 0
  while i < partcnt
    splitcnt = 3
    splitat = []
    j = 0
    while j < splitcnt
      # don't split at 0 or -1
      x = rand(s_len - 2)
      if !splitat.include?(x+1)
        splitat.append(x+1)
        j += 1
      end
    end
    splitat.sort!()
    parts.append([s[0...splitat[0]], s[splitat[0]...splitat[1]], s[splitat[1]...splitat[2]], s[splitat[2]..-1]].shuffle)
    i += 1
  end

  word_dict = (parts[0] + [parts[1][0], parts[1][1], parts[2][0], parts[2][1]]).shuffle
  raise "fail" if !(word_break(s, word_dict) == true)
  raise "fail" if !(word_break_bfs(s, word_dict) == true)
  raise "fail" if !(word_break_dfs(s, word_dict) == true)
end

# Test generator 3
# Test whether each of the implementations behaves identically.
1.upto(1000) do
  s_len = 20
  s = randstring("abcdefghijklmnopqrstuvwxyz".split(//), s_len)

  parts = []
  partcnt = 5
  splitcnt = 3
  i = 0
  while i < partcnt
    splitat = []
    j = 0
    while j < splitcnt
      # don't split at 0 or -1
      x = rand(s_len - 2)
      if !splitat.include?(x+1)
        splitat.append(x+1)
        j += 1
      end
    end
    splitat.sort!()
    parts.append([s[0...splitat[0]], s[splitat[0]...splitat[1]], s[splitat[1]...splitat[2]], s[splitat[2]..-1]].shuffle)
    i += 1
  end

  word_dict = []
  i = 0
  while i < 5
    x = rand(partcnt)
    y = rand(splitcnt+1)
    word_dict.append(parts[x][y])
    i += 1
  end

  raise "fail: #{s} #{word_dict}" if !(word_break(s, word_dict) == word_break_bfs(s, word_dict))
  raise "fail: #{s} #{word_dict}" if !(word_break(s, word_dict) == word_break_dfs(s, word_dict))
end
