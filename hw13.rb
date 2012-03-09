
def combine_anagrams(words)
  hash = {}
  words.each {
    |word|
      key = word.split("").sort.join("")
      hash[key] = hash[key] || []
      hash[key].push(word)
  }
  hash.map { |k,v| v }
end