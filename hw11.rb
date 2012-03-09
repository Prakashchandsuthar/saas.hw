
def palindrome?(input)
  str = input.downcase.gsub /\W/, ''
  str == str.reverse
end

def count_words(input)
  input.downcase.split.inject(Hash.new 0) {
    |hash, word|
      word.scan(/\w+/) { |w| hash[w]+=1; }
      hash
  }
end