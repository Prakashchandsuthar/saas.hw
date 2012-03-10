
#2.1a
class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

  def method_missing(currency)
    @currency = currency
    self
  end
  
  def in(currency)
    def convert(c)
      singular_currency = c.to_s.gsub( /s$/, '')
      if @@currencies.has_key?(singular_currency)
        self * @@currencies[singular_currency]
      else
        nil
      end
    end
    
    baseCurrency = convert @currency
    targetCurrency = convert currency
    
    @currency = currency
    if !baseCurrency.nil? && !targetCurrency.nil?
      self * baseCurrency / targetCurrency  
    else
      super
    end
  end
end

#print 10.yens.in(:euro)


#2.1b
class String
  def palindrome?
    str = self.downcase.gsub /\W/, ''
    str == str.reverse
  end
end

#print "abba".palindrome?

#2.1c
module Enumerable
  def palindrome?
    result = true
    0.upto(self.length/2) { |i| result &= self[i] == self[self.length - i - 1] }
    result
  end
end

#print [1,2,3,2,1].palindrome?
#print [:a, :b].palindrome?

