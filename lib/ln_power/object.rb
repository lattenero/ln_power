module LnPower
  class ::Object

    def metaclass
      class << self
        self
      end
    end

    def include_whit_params(mod, methods = {}  )
      methods.keys.each do |met|
        self.metaclass.send(:define_method, met) do
          methods[met]
        end
      end
      self.include  mod
    end
  end

end
