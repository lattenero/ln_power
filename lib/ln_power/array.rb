module LNPower
  class ::Array

    def g(str)
      self.select{|x| x.to_s.downcase.match?(str.downcase) }
    end
  end
end
